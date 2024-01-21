package kr.co.kfs.assetedu.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kfs.assetedu.model.Bok01Book;
import kr.co.kfs.assetedu.model.Com03Date;
import kr.co.kfs.assetedu.model.Opr01Cont;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Bok01BookRepository;
import kr.co.kfs.assetedu.repository.Com03DateRepository;
import kr.co.kfs.assetedu.repository.Opr01ContRepository;
import kr.co.kfs.assetedu.servlet.exception.AssetException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class Opr01ContService  {

	@Autowired
	private Opr01ContRepository contRepository;
	
	@Autowired
	private Bok01BookRepository bookRepository;
	
	@Autowired
	private Bok01BookService bookService;
	
	@Autowired
	private Com03DateRepository dateRepository;
	
	public List<Opr01Cont> selectList(QueryAttr condtiion){
		return contRepository.selectList(condtiion);
	}

	public Opr01Cont selectOne(Opr01Cont cont) {
		return contRepository.selectOne(cont);
	}
	
	@Transactional	//얘는 커밋 롤백만 상관있어서 인서트엔 안씀~
	public String insert(Opr01Cont cont) throws Exception {
		
		//체결아이디 세팅
		cont.setOpr01ContId(contRepository.getNewSeq());
		
		//보유원장 아이디 세팅. book xml에서 보유원장 있으면 갖다 쓰고 없으면 새로 만들기
		QueryAttr condition = new QueryAttr();
		condition.put("holdDate", cont.getOpr01ContDate());
		condition.put("fundCode", cont.getOpr01FundCd());
		condition.put("itemCode", cont.getOpr01ItemCd());
		String bookId = bookRepository.getBookId(condition);
		if (bookId == null) {
			bookId = contRepository.getNewSeq();	//bookId 없으면 시퀀스로 세팅해줌
		} else 
		cont.setOpr01BookId(bookId);
			
		//장무금액 세팅은 딴데서 한다
		
		//체결상태 세팅
		cont.setOpr01StatusCd("0");
		
		//체결내역 인서트
		int insertCnt = contRepository.insert(cont);
		
		//처리 메인 호출(보유원장생성, 분개장생성)		//proc= process
		String resultMsg = this.procMain("P", cont);	//처리모듈 처리코드: 처리P 취소C (캔슬) 원장이월A
		return resultMsg;
		
		//나며진 화면 그대로
		
		//return contRepository.insert(cont);
	}
	
	@Transactional
	public String procMain(String procType, Opr01Cont cont) throws Exception {
		
		String resultMsg = "Y"; 	//Y면 정상처리 아니명 예외처리 라고 걍 정함~
		int procCnt;
		//----------------------------------
		//처리 : 원장이월처리
		//----------------------------------
		
		//원장이월처리. 처리ㅣP 원장이월A
		if ("P".equals(procType) || "A".equals(procType)) {	//상수.이퀄(변수) 해줘야 변수에 null 들어와도 에러 안남. 변수 이퀄 상수면 널 에러 가능. 항상 반대로 써라.
			//원장이월
			//최근보유날짜 가져오기. 최근보유일자 < 체결일 이면 원장이월처리. 아니면 오늘날짜 원장 있으니 원장이월 안함
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
			DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			
			String lastDateStr = bookRepository.getLastHoldDate();
			if (lastDateStr != null) {
				Date lastDate = transFormat.parse(lastDateStr);
				Date contDate = transFormat.parse(cont.getOpr01ContDate());
				
				//최근보유일자 < 체결일인 경우 원장이월처리
				if (lastDate.compareTo(contDate) < 0) {
					//원장이월 시작일자 = 최근보유일자 + 1일
					Calendar cal = Calendar.getInstance();
					cal.setTime(lastDate);
					cal.add(Calendar.DATE, 1);
					String startDate = dateFormat.format(cal.getTime());
					
					//원장이월 종료일자 = 체결일자
					String closeDate = cont.getOpr01ContDate();
					
					//이월기간 가져오기
					QueryAttr dateCondition = new QueryAttr();
					dateCondition.put("startDate", startDate);
					dateCondition.put("closeDate", closeDate);
					List<Com03Date> dateList = dateRepository.selectListByPeriod(dateCondition);
					
					//원장이월 삽입하기
					for(Com03Date dateModel : dateList) {
						QueryAttr insertCondition = new QueryAttr();
						insertCondition.put("holdDate", dateModel.getCom03Day());
						procCnt = bookRepository.insertByDayBefore(insertCondition);
					}
				}
			}	//원장이월 완료.
			
			//원장모듈 호출 - 이월인 경우 호출하지 않고 처리인 경우 호출
			if ("P".equals(procType)) {	//처리 P
				//원장모듈 호출
				resultMsg = bookService.createBook(cont);
			
				//처리상태 '완료' 로 업데이트
				cont.setOpr01StatusCd("1");	//1:처리완료
				procCnt = contRepository.update(cont);
			}
		} else if ("C".equals(procType)) {		//취소 C
			
			//취소 대상 체결내역의 체결상태를 9:취소 로 UPDATE
			cont.setOpr01StatusCd("9");  	//처리상태를 9:취소 로 세팅
			procCnt = contRepository.update(cont);
			
			//당일 원장 삭제
			QueryAttr bookCondition = new QueryAttr();
			bookCondition.put("nookId", cont.getOpr01BookId());
			bookCondition.put("holdDate", cont.getOpr01ContDate());
			procCnt = bookRepository.deleteByBookId(bookCondition);
			
			//전일 원장 이월
			procCnt = bookRepository.insertByDayBefore(bookCondition);
			
			//당일 원장 거래 반영: 같은 원장에 반영된 다른 체결내역들 재처리
			QueryAttr otherCondition = new QueryAttr();
			otherCondition.put("contDate", cont.getOpr01ContDate());
			otherCondition.put("bookId", cont.getOpr01BookId());
			List<Opr01Cont> otherContList = contRepository.selectByBookId(otherCondition);
			for (Opr01Cont otherCont : otherContList) {
				resultMsg = bookService.createBook(otherCont);	
			}
		}
		return resultMsg;
	}
	
	@Transactional
	public String delete(Opr01Cont cont ) throws Exception {

		//취소처리전 평가여부 확인
		QueryAttr bookCondition = new QueryAttr();
		bookCondition.put("bookId"  , cont.getOpr01BookId());
		bookCondition.put("holdDate", cont.getOpr01ContDate());

		Bok01Book book = bookRepository.selectOneByBookId(bookCondition);
		
		if("true".equals(book.getBok01EvalYn())) {
			throw new AssetException("평가처리된 종목입니다. 평가취소 후 가능합니다.");
		}

		// 보유원장&분개장 취소처리 (처리Main 호출 )
		String resultMsg = this.procMain("C", cont);

		return resultMsg;
	
	}
	
	@Transactional
	public String eval(String procType, String evalDate) throws Exception {
		//평가 리스트 가져오기
		QueryAttr evalCondition = new QueryAttr();
		evalCondition.put("evalDate", evalDate);
		//evalCondition.put("searchText", "%");	//맵퍼에서 if 썼으면 안써도 됨.
		
		List<Bok01Book> evalList = bookRepository.selectEvalList(evalCondition);
		Long checkCnt = 0L;
		String resultMsg = "";
		
		for (Bok01Book book : evalList) {
			
			//-------------------
			//평가처리
			//-------------------
			if ("P".equals(procType) && "false".equals(book.getBok01EvalYn())) {	//평가가 안된 것만 평가해야 하므로 &&조건 추가. 안하면 데이터가 꼬일수도 있음.
				//평가내역 생성 (opr01 insert)
				
				Opr01Cont insertModel = new Opr01Cont();
				
				insertModel.setOpr01ContId(contRepository.getNewSeq());
				insertModel.setOpr01FundCd(book.getBok01FundCd());
				insertModel.setOpr01ItemCd(book.getBok01ItemCd());
				insertModel.setOpr01ContDate(book.getBok01HoldDate());
				insertModel.setOpr01TrCd("3001");						//3001:평가처리
				insertModel.setOpr01Qty(book.getBok01HoldQty());
				insertModel.setOpr01Price(book.getBok01EvalPrice());	//평가단가
				
				//평가금액 = 수량 * 평가단가
				Long evalAmt = book.getBok01HoldQty() * book.getBok01EvalPrice();
				insertModel.setOpr01ContAmt(evalAmt);
				
				//평가손익 = 평가금액 - 장부금액
				insertModel.setOpr01TrPl(evalAmt - book.getBok01BookAmt());
				
				insertModel.setOpr01BookId(book.getBok01BookId());
				insertModel.setOpr01BookAmt(book.getBok01BookAmt());
				insertModel.setOpr01StatusCd("0"); 						//0 : 미처리
				
				contRepository.insert(insertModel);
				
				//처리Main processMain 호출해서 처리
				resultMsg = procMain("P", insertModel);
				
				checkCnt++;
			}
			
			//-------------------
			//평가취소
			//-------------------
			else if ("C".equals(procType) && "true".equals(book.getBok01EvalYn())) {	//취소는 평가가 된 애만 취소해야 하므로 && 조건 추가
				//취소할 해당 거래내역 가져오기
				Opr01Cont temp = new Opr01Cont();
				temp.setOpr01ContId(book.getBok01ContId());
				Opr01Cont cont = contRepository.selectOne(temp);
				
				//처리메인 호출해서 취소
				resultMsg = procMain("C", cont);
				checkCnt++;
			}
		}
		
		if (checkCnt == 0) {
			if("P".equals(procType)) {
				resultMsg = "평가처리 대상이 없습니다.";
			} else {
				resultMsg = "평가취소 대상이 없습니다.";
			} throw new AssetException(resultMsg);
			
		}
		
		return resultMsg;
		
	
	}
	
}
