package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Bok01Book;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Bok01BookRepository {
	// list and totalcount
	List<Bok01Book> selectList(QueryAttr condition);
	Long selectCount(QueryAttr condition);
	
	String getBookId(QueryAttr condition);
	
	String getLastHoldDate();
	int insertByDayBefore(QueryAttr condition);
	
	Bok01Book selectByBookId(QueryAttr bookCondition);
	int upsert(Bok01Book book);
	
	// CRUD
	List<Bok01Book> selectEvalList(QueryAttr condition);
	Bok01Book selectOne(Bok01Book book);
	Bok01Book selectOneByBookId(QueryAttr condition);
	Bok01Book selectByItemCode(QueryAttr condition);

	String newBookId();
	String updateEval(QueryAttr condition);
	String selectOneLastDate();

	int insert(Bok01Book book);

	
	int update(Bok01Book book);

	int deleteByBookId(QueryAttr condition);
	
	int delete(Bok01Book book);
	int deleteByHoldDate(QueryAttr condition);
}
