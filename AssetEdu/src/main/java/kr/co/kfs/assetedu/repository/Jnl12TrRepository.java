package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Jnl12Tr;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Jnl12TrRepository {
	// list and totalcount
	List<Jnl12Tr> selectList(QueryAttr condition);
	Integer selectCount(QueryAttr condition);
	
	// CRUD
	Jnl12Tr selectOne(Jnl12Tr acnt);
	Jnl12Tr selectOneByTrCd(String trCode);

	Jnl12Tr selectByTrCd(String trCd);
	
	int insert(Jnl12Tr acnt);
	int update(Jnl12Tr acnt);
	int delete(Jnl12Tr acnt);
}
