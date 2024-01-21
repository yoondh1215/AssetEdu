package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Com01Corp;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Com01CorpRepository {

	public List<Com01Corp> selectList(QueryAttr queryAttr);
	
	Long selectCount(QueryAttr queryAttr);
	
	public int insert(Com01Corp com01Corp);
	public Com01Corp selectOne(String com01CorpCd);
	public int update (Com01Corp com01Corp);
	public int delete (String com01CorpCd);
}
