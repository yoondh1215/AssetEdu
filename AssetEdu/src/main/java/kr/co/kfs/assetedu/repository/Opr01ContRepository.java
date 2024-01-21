package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Opr01Cont;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Opr01ContRepository {
	// list and totalcount
	List<Opr01Cont> selectList(QueryAttr condition);
	Long selectCount(QueryAttr condition);
	
	String newContId();
	Opr01Cont selectOne(Opr01Cont cont);
	List<Opr01Cont> selectByBookId(QueryAttr condition);
	
	//새로운 시퀀스 가져오기. db의 f_Seq().
	String getNewSeq();
	
	int insert(Opr01Cont cont);
	int update(Opr01Cont cont);
	int delete(Opr01Cont cont);
	
	
}
