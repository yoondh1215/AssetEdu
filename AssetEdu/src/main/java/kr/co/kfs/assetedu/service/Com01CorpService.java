package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kfs.assetedu.model.Com01Corp;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Com01CorpRepository;

@Service
public class Com01CorpService {

	@Autowired
	private  Com01CorpRepository corpRepository;
	
	public List<Com01Corp> selectList(QueryAttr queryAttr){
		return corpRepository.selectList(queryAttr);
	};
	
	public Long selectCount(QueryAttr queryAttr){
		return corpRepository.selectCount(queryAttr);
	}
	
	public int insert(Com01Corp com01Corp) {
		return corpRepository.insert(com01Corp);
	}
	
	public Com01Corp selectOne(String com01CorpCd) {
		return corpRepository.selectOne(com01CorpCd);
	}
	
	public int update(Com01Corp com01Corp) {
		return corpRepository.update(com01Corp);
	}
	
	public int delete (String com01CorpCd) {
		return corpRepository.delete(com01CorpCd);
	}
}
