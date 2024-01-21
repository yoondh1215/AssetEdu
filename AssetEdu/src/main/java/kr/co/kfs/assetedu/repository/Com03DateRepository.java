package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Com03Date;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Com03DateRepository {
	// list and totalcount
	List<Com03Date> selectList(QueryAttr condition);
	Integer selectCount(QueryAttr condition);
	
	// CRUD
	List<Com03Date> selectListByPeriod(QueryAttr condition);
	Com03Date selectOne(Com03Date date);

	int insert(Com03Date date);
	int update(Com03Date date);
	int delete(Com03Date date);
	
	String selectBizDate(QueryAttr condition);
	String getDate(QueryAttr condition);
}
