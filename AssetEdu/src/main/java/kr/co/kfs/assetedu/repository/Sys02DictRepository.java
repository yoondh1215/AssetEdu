package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Condition;
import kr.co.kfs.assetedu.model.Sys02Dict;

public interface Sys02DictRepository {
	// list and totalcount
	List<Sys02Dict> selectList(Condition condition);
	Integer selectCount(Condition condition);
	
	String getDictId();
	
	// CRUD
	Sys02Dict selectOne(Sys02Dict user);
	int insert(Sys02Dict user);
	int update(Sys02Dict user);
	int delete(Sys02Dict user);
}
