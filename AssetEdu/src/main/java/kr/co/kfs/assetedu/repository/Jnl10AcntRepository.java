package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Jnl10Acnt;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Jnl10AcntRepository {

	
	
	
	public List<Jnl10Acnt> selectList(QueryAttr queryAttr);
	public Jnl10Acnt selectOne(String jnl10AcntCd);
	public int insert(Jnl10Acnt jnl10Acnt);
	public int selectCount(QueryAttr queryAttr);
	public int update(Jnl10Acnt jnl10Acnt);
	public int delete(String jnl10AcntCd);
}
