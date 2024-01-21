package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Jnl11ReprAcnt;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Jnl11ReprAcntRepository {

	
	List<Jnl11ReprAcnt> selectList(QueryAttr queryAttr);
	Jnl11ReprAcnt selectOne(String jnl11ReprAcntCd);
	int selectCount(QueryAttr queryAttr);
	int insert(Jnl11ReprAcnt jnl11ReprAcnt);
	int update (Jnl11ReprAcnt jnl11ReprAcnt);
	int delete (String jnl11ReprAcntCd);
}
