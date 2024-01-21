package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kfs.assetedu.model.Fnd01Fund;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Fnd01FundRepository;

@Service
public class Fnd01FundService {

	@Autowired
	Fnd01FundRepository repository;
	
	
	public List<Fnd01Fund> selectList (QueryAttr queryAttr) {
		return repository.selectList(queryAttr);
	}
	
	public Long selectCount(QueryAttr queryAttr) {
		return repository.selectCount(queryAttr);
	}
	
	public int insert(Fnd01Fund fnd01Fund) {
		return repository.insert(fnd01Fund);
	}
	
	public Fnd01Fund selectOne(String fnd01FundCd) {
		return repository.selectOne(fnd01FundCd);
	}
	
	public int update (Fnd01Fund fnd01Fund) {
		return repository.update(fnd01Fund);
	}
	
	
	public int delete (String fnd01FundCd) {
		return repository.delete(fnd01FundCd);
	}
}
