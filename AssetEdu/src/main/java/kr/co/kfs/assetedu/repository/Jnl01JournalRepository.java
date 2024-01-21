package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Jnl01Journal;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Jnl01JournalRepository {

	
	List<Jnl01Journal> selectList(QueryAttr queryAttr);
	int deleteByContId(String contId);
	Long getAmt(QueryAttr amtCondition);
	
	Jnl01Journal selectOne(Jnl01Journal jnl01Journal);
	int update (Jnl01Journal jnl01Journal);
	int insert (Jnl01Journal jnlModel);
	int delete (Jnl01Journal journal);
	
	Long selectCount(QueryAttr condition);
	
	
}
