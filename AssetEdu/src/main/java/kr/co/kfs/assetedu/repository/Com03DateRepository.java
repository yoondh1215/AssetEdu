package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Com03Date;
import kr.co.kfs.assetedu.model.Condition;

public interface Com03DateRepository {
	// list and totalcount
	List<Com03Date> selectList(Condition condition);
	Integer selectCount(Condition condition);
	
	// CRUD
	List<Com03Date> selectListByPeriod(Condition condition);
	Com03Date selectOne(Com03Date date);

	int insert(Com03Date date);
	int update(Com03Date date);
	int delete(Com03Date date);
	
	String selectBizDate(Condition condition);
	String getDate(Condition condition);
}
