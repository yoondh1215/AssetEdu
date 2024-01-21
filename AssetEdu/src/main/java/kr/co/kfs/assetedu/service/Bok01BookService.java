package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kfs.assetedu.model.Bok01Book;
import kr.co.kfs.assetedu.model.Jnl12Tr;
import kr.co.kfs.assetedu.model.Opr01Cont;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Bok01BookRepository;
import kr.co.kfs.assetedu.repository.Jnl01JournalRepository;
import kr.co.kfs.assetedu.repository.Jnl12TrRepository;
import kr.co.kfs.assetedu.repository.Opr01ContRepository;
import kr.co.kfs.assetedu.servlet.exception.AssetException;
@Service

public class Bok01BookService {

	@Autowired
	private Bok01BookRepository bookRepository;
	
	@Autowired
	private Jnl12TrRepository trRepository;
	
	@Autowired
	private Opr01ContRepository contRepository;
	
	@Autowired
	private Jnl01JournalRepository jnlRepository;
	
	@Autowired
	private Jnl01JournalService jnlServive;
	
	public String createBook(Opr01Cont cont) throws Exception {
		String resultMsg = "Y";
		int procCnt;
		
		//보유원장 가져오기. 모듈이기에 모든 케이스인 입출고 원장변경 세 케이스가 들어가야 함.
		QueryAttr bookCondition = new QueryAttr();
		bookCondition.put("bookId", cont.getOpr01BookId());
		bookCondition.put("holdDate", cont.getOpr01ContDate());
		//오늘 날짜의 북 아이디를 가져온다.
		Bok01Book book = bookRepository.selectByBookId(bookCondition);
		
		if (book == null) {
			book = new Bok01Book();
			//널인 경우 초기화 세팅
			book.setBok01BookId(cont.getOpr01BookId());
			book.setBok01HoldDate(cont.getOpr01ContDate());
			book.setBok01FundCd(cont.getOpr01FundCd());
			book.setBok01ItemCd(cont.getOpr01ItemCd());
			book.setBok01HoldQty(0l);
			book.setBok01EvalAmt(0l);		//01이 아니라 0L임 long 이라 변환시켜줌
			book.setBok01EvalPl(0l);
			book.setBok01EvalYn("false");
		} 
		//거래유형정보 가져오기
		Jnl12Tr trInfo = trRepository.selectByTrCd(cont.getOpr01TrCd());
		if (trInfo.getJnl12InOutType() == null) {
			resultMsg = "원장입출고 구분값이 없습니다. 분개맵핑 정보를 확인하세요.";
			throw new AssetException(resultMsg);
		}
		//----------------------------------
		//입고처리 (입고데이터 세팅) 입고1 출고2 평가3
		//----------------------------------
		if ("1".equals(trInfo.getJnl12InOutType())) {
			
			//우선 장부금액 세팅
			cont.setOpr01BookAmt(cont.getOpr01ContAmt());
			
			//보유수량
			Long holdQty = 0l;	//0L 이다 l 붙이는거 잊지말자
			if (book.getBok01HoldQty() != null) {
				holdQty = book.getBok01HoldQty();
			}
			book.setBok01HoldQty(holdQty + cont.getOpr01Qty());
			
			//장부금액
			Long bookAmt = 0l;	//0L 이다 l 붙이는거 잊지말자
			if (book.getBok01BookAmt() != null) {
				bookAmt = book.getBok01BookAmt();
			}
			book.setBok01BookAmt(bookAmt + cont.getOpr01ContAmt());
			
			//취득금액
			Long purAmt = 0l;	//0L 이다 l 붙이는거 잊지말자
			if (book.getBok01PurAmt() != null) {
				purAmt = book.getBok01PurAmt();
			}
			book.setBok01PurAmt(purAmt+cont.getOpr01BookAmt());
		}
			
		//----------------------------------
		//출고처리2  (매도)
		//----------------------------------
		else if ("2".equals(trInfo.getJnl12InOutType())) {
			//매도 장부금액 = 원장의 장부금액 * (매도수량 / 원장의 보유수량). 자바로 짤 땐 나누기를 먼저 하고 곱해야 형변환과정에 손실이 없을듯?
			
			//출고가능수량 체크
			if (book.getBok01HoldQty() < cont.getOpr01Qty()) {		//매도량이 재고보다 더 많으면 안됨
				resultMsg = "매도수량이 보유수량보다 많습니다.";
				throw new AssetException(resultMsg);
			}
			
			//만약 전액 매도라면 내 보유수량=출고수량, 남는 돈 1원 없이 싹 매도 
			Long bookAmt;
			if(book.getBok01HoldQty() == cont.getOpr01Qty()) {
				//장부금액 세팅
				bookAmt = book.getBok01BookAmt();
				book.setBok01BookAmt(0l);
				//취득금액 세팅
				book.setBok01PurAmt(0l);
				//보유수량 세팅
				book.setBok01HoldQty(0l);
			}
			//일부매도
			else {
				//장부금액 세팅
				bookAmt = roundDown(book.getBok01BookAmt() / book.getBok01HoldQty() * cont.getOpr01Qty(), 1);	//매도장부금액 세팅
				book.setBok01BookAmt(book.getBok01BookAmt() - bookAmt);	//장부금액 세팅
				
				//취득금액 세팅
				Long purAmt = roundDown(book.getBok01PurAmt() / book.getBok01HoldQty() * cont.getOpr01Qty(), 1);
				book.setBok01PurAmt(book.getBok01PurAmt() - purAmt);
				
				//보유수량 세팅
				book.setBok01HoldQty(book.getBok01HoldQty() - cont.getOpr01Qty());
			}
			cont.setOpr01BookAmt(bookAmt);
		}
		
		//----------------------------------
		//원장변경(평가)처리 데이터 세팅 3
		//----------------------------------
		else if ("3".equals(trInfo.getJnl12InOutType())) {
			//평가금액 반영
			book.setBok01EvalAmt(cont.getOpr01ContAmt());
			
			//평가손익
			book.setBok01EvalPl(cont.getOpr01TrPl());
			
			//평가여부 
			book.setBok01EvalYn("true");
		} 
		//----------------------------------
		else {
			resultMsg = "뭡니까 이건 미정의 처리코드입니다만? 관리팀에 문의하시길.";
			throw new AssetException(resultMsg);
		}
		
		//----------------------------------
		//원장 반영(insert update)
		//----------------------------------
		procCnt = bookRepository.upsert(book);
		
		//체결내역 장부금액 업데이트
		procCnt = contRepository.update(cont);
		
		//분개모듈 호출
		resultMsg = jnlServive.createJournal(cont);
		
		return resultMsg;
	}
	
	
	
	public List<Bok01Book> selectList(QueryAttr condition) {
		return bookRepository.selectList(condition);
	};
	
	public long selectCount(QueryAttr condition) {
		return bookRepository.selectCount(condition);
	};
	
		
	//트렁케이트 원 절사 해서 롱 형으로 리턴해주는 메소드를 인터넷서 긁어다 추가
	private long roundDown(double number ,double place) {
		double result = number/place;
		result = Math.floor(result);
		result *= place;
		return (long)result;
	}
	
	public List<Bok01Book> selectEvalList(QueryAttr condition) {
		return bookRepository.selectEvalList(condition);
	}
	
}
