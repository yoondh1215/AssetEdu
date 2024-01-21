package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Fnd01Fund;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Fnd01FundRepository {

	public List<Fnd01Fund> selectList(QueryAttr queryAttr);
	public Long selectCount (QueryAttr queryAttr);
	public int insert(Fnd01Fund fnd01Fund);
	public Fnd01Fund selectOne(String fnd01FundCd);
	public int update(Fnd01Fund fnd01Fund);
	public int delete(String fnd01FundCd);
}
