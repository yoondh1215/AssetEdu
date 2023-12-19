package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.model.Sys02Dict;

public interface Sys02DictRepository {
	// list and totalcount
	List<Sys02Dict> selectList(QueryAttr condition);
	Integer selectCount(QueryAttr condition);
	
	String getDictId();
	
	// CRUD
	Sys02Dict selectOne(Sys02Dict user);
	int insert(Sys02Dict user);
	int update(Sys02Dict user);
	int delete(Sys02Dict user);
}
