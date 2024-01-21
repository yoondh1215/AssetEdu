package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Jnl13TrMap;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Jnl13TrMapRepository {
	
	
	

	// list and totalcount
	List<Jnl13TrMap> selectList(QueryAttr condition);
	Integer selectCount(QueryAttr condition);
	
	List<Jnl13TrMap> selectByTrCode(String trCode);
	Long getAmt(QueryAttr condition);
	
	// CRUD
	Jnl13TrMap selectOne(Jnl13TrMap acnt);
	int insert(Jnl13TrMap acnt);
	int update(Jnl13TrMap acnt);
	int delete(Jnl13TrMap acnt);
}
