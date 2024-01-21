package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Jnl14RealAcntMap;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Jnl14RealAcntMapRepository {

	
	String selectByReprAcntCd(QueryAttr condition);
	
	public List<Jnl14RealAcntMap> selectList(QueryAttr queryAttr);
	public Jnl14RealAcntMap selectOne(Jnl14RealAcntMap realAcntMap);
	public int insert(Jnl14RealAcntMap realAcntMap);
	public int update(Jnl14RealAcntMap realAcntMap);
	public int delete(Jnl14RealAcntMap realAcntMap);
	




}
