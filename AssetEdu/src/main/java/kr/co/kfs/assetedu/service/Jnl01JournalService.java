package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kfs.assetedu.model.Itm01Item;
import kr.co.kfs.assetedu.model.Jnl01Journal;
import kr.co.kfs.assetedu.model.Jnl02JournalTmp;
import kr.co.kfs.assetedu.model.Jnl13TrMap;
import kr.co.kfs.assetedu.model.Opr01Cont;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Itm01ItemRepository;
import kr.co.kfs.assetedu.repository.Jnl01JournalRepository;
import kr.co.kfs.assetedu.repository.Jnl02JournalTmpRepository;
import kr.co.kfs.assetedu.repository.Jnl13TrMapRepository;
import kr.co.kfs.assetedu.repository.Jnl14RealAcntMapRepository;
import kr.co.kfs.assetedu.servlet.exception.AssetException;

@Service
public class Jnl01JournalService {

	@Autowired
	Jnl01JournalRepository jnlRepository;
	
	@Autowired
	Jnl02JournalTmpRepository jnlTmpRepository;
	
	@Autowired
	Jnl13TrMapRepository jnlTrMapRepository;
	
	@Autowired
	Itm01ItemRepository itemRepository;
	
	@Autowired
	Jnl14RealAcntMapRepository realAcntMapRepository;
	
	
	
	public List<Jnl01Journal> selectList(QueryAttr condition){
		return jnlRepository.selectList(condition);
	};
	
	@Transactional
	public String createJournal(Opr01Cont cont) throws Exception {
		String resultMsg = "Y";
		int procCnt;
		int lastSeq = 0;
		
		//임시분개장, 실분개장 정리. 취소로직이 상태만 취소로 없데이트되고 나머지 건은 재처리를 해줌. 분개장은 이걸 재처리 해버리면 중복되고 오류가 나서 정리 필요.
		//거래취소시 전날의 해당 체결금액을 0으로 만들고 전날거 가져와서 오늘 원장으로 재생성
		procCnt = jnlTmpRepository.deleteByContId(cont.getOpr01ContId());
		procCnt = jnlRepository.deleteByContId(cont.getOpr01ContId());
		
		//============================
		//임시분개장 생성
		//============================
		//거래코드별 분개맵 가져오기
		Jnl02JournalTmp jnlTmpModel;
		List<Jnl13TrMap> trMapList = jnlTrMapRepository.selectByTrCode(cont.getOpr01TrCd());
			//for문을 돌면서 건건이 임시분개장 만들기
		for (Jnl13TrMap trMapModel : trMapList) {
			jnlTmpModel = new Jnl02JournalTmp();
			
			jnlTmpModel.setJnl02ContId(cont.getOpr01ContId());
			jnlTmpModel.setJnl02Seq(trMapModel.getJnl13Seq());
			jnlTmpModel.setJnl02DrcrType(trMapModel.getJnl13DrcrType());
			
			//대표계정코드가 미수(1200)/미지급금(2200)인 경우 체결일=결제일 이면 예금(8888)으로 변경해줘야 함
			jnlTmpModel.setJnl02ReprAcntCd(trMapModel.getJnl13ReprAcntCd());
			if ("1200".equals(jnlTmpModel.getJnl02ReprAcntCd()) || 
				"2200".equals(jnlTmpModel.getJnl02ReprAcntCd())) {
				if (cont.getOpr01ContDate().equals(cont.getOpr01SettleDate())) {
					jnlTmpModel.setJnl02ReprAcntCd("8888");
				}
			}
			
			//금액
			QueryAttr amtCondition = new QueryAttr();
			amtCondition.put("formula", trMapModel.getJnl13Formula());
			amtCondition.put("contId", cont.getOpr01ContId());
			Long amt = jnlRepository.getAmt(amtCondition);
			jnlTmpModel.setJnl02Amt(amt);
			
			//금액이 0이면 해줄 의미가 없음
			if (amt != 0) {
				procCnt = jnlTmpRepository.insert(jnlTmpModel);
				lastSeq = jnlTmpModel.getJnl02Seq();	//라스트 시퀀스를 가지고 있도록.
			}	
		}
		
		//차대 금액 차이금액 확인, 매수/평가인데 차이금액이 있는 경우 에러처리, 매도면 처분손익 생성
		Long diffAmt = jnlTmpRepository.selectDiffAmt(cont.getOpr01ContId());
		if (diffAmt != 0) {
			//매도거래 코드가 2001 2002임. 들 다 아니라면 에러 메시지 뱉어주고 끝.
			if (!"2001".equals(cont.getOpr01TrCd()) && !"2002".equals(cont.getOpr01TrCd())) {
				resultMsg = "차대변 금액이 서로 다릅니다.";
				throw new AssetException(resultMsg);
			}
			
			//처분손익 생성
			jnlTmpModel = new Jnl02JournalTmp();
			jnlTmpModel.setJnl02ContId(cont.getOpr01ContId());
			jnlTmpModel.setJnl02Seq(lastSeq + 1);
			//차이금액 <0 이면 처분손실 발생, 차이금액 >0 이면 처분이익 발생
			if (diffAmt > 0) {
				jnlTmpModel.setJnl02ReprAcntCd("4100");//4100은 처분이익 코드
				jnlTmpModel.setJnl02DrcrType("C");	//C credit: 대변
				jnlTmpModel.setJnl02Amt(diffAmt);
			} else {
				jnlTmpModel.setJnl02ReprAcntCd("5100");//5100 처분손실 코드
				jnlTmpModel.setJnl02DrcrType("D");	//D debit: 차변
				jnlTmpModel.setJnl02Amt(diffAmt * -1);
			}
			procCnt = jnlTmpRepository.insert(jnlTmpModel);
			
			
		}
		//========================
		//실분개장 생성
		//========================
		//종목정보 가져오기
		String itm01ItemCd = cont.getOpr01ItemCd();
		Itm01Item itmInfo = itemRepository.selectOne(itm01ItemCd);
		
		//상장구분 입력 체크
		if (itmInfo.getItm01ListType() == null || itmInfo.getItm01IssType() == "") {
			resultMsg = "상장구분이 없습니다. 종목정보를 확인하세요.";
			throw new AssetException(resultMsg);
		}
		
		//시장구분
		if (itmInfo.getItm01MarketType() == null || itmInfo.getItm01MarketType() == "") {
			resultMsg = "시장구분이 없습니다. 종목정보를 확인하세요.";
			throw new AssetException(resultMsg);
		}
		
		QueryAttr realAcntCondition = new QueryAttr();
		realAcntCondition.put("listType", itmInfo.getItm01ListType());
		realAcntCondition.put("marketType", itmInfo.getItm01MarketType());
		
		//임시분개장
		int drSeq = 0;
		int crSeq = 0;
		String dmlType = "I";
		//Jnl01Journal jnlModel = new Jnl01Journal();
		Jnl01Journal jnlModel = new Jnl01Journal();;
		
		
		List<Jnl02JournalTmp> jnlTmpList = jnlTmpRepository.selectByContId(cont.getOpr01ContId());
		for (Jnl02JournalTmp jnlTmp : jnlTmpList) {
			//대표계정코드 => 실계정코드
			realAcntCondition.put("reprAcntCd", jnlTmp.getJnl02ReprAcntCd());
			
			String acntCd = realAcntMapRepository.selectByReprAcntCd(realAcntCondition);
			
			if (acntCd == null || "".equals(acntCd)) {
				resultMsg = "실계정과목을 가져올 수 없습니다. 관리팀에 문의하세요.";
				throw new AssetException(resultMsg);
			}
			
			//차변 대변 자리맞춰서 실분개장 생성 (인서트)
			if ("D".equals(jnlTmp.getJnl02DrcrType())) {
				drSeq++;
				dmlType="I";	//차변인 경우 전부 인서트
				
				jnlModel.setJnl01Seq(drSeq);	//차변시퀀스 넣기
				jnlModel.setDrAcnt(acntCd);		//차변 계쩡과목 넣기
				jnlModel.setJnl01DrAmt(jnlTmp.getJnl02Amt());	//차변 수량 넣기
			} else {
				crSeq++;
				jnlModel.setJnl01Seq(crSeq);
				
				if (drSeq >= crSeq) {
					dmlType = "U";
					jnlModel = jnlRepository.selectOne(jnlModel);
				} else {
					dmlType="I";
				}
			}
			jnlModel.setJnl01CrAcntCd(acntCd);
			jnlModel.setJnl01CrAmt(jnlTmp.getJnl02Amt());
		} 
		
		if ("I".equals(dmlType)) {
			procCnt = jnlRepository.insert(jnlModel);
		} else {
			procCnt = jnlRepository.update(jnlModel);
		}
		
		return resultMsg;
	}
	
	
	@Transactional
	public int insert(Jnl01Journal fund) {
		return jnlRepository.insert(fund);
	}
	
	@Transactional
	public int update(Jnl01Journal fund) {
		return jnlRepository.update(fund);
	}
	@Transactional
	public int delete(Jnl01Journal  fund ) {
		return jnlRepository.delete(fund);
	}
	
	public Long selectCount(QueryAttr condition){
		return jnlRepository.selectCount(condition);
	}
	
	public Jnl01Journal selectOne(Jnl01Journal jnl01Journal) {
		return jnlRepository.selectOne(jnl01Journal);
	}

}
