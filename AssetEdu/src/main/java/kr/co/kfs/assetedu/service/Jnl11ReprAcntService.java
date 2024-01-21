package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kfs.assetedu.model.Jnl11ReprAcnt;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Jnl11ReprAcntRepository;

@Service
public class Jnl11ReprAcntService {
	
	@Autowired
	Jnl11ReprAcntRepository repository;

	public List<Jnl11ReprAcnt> selectList(QueryAttr queryAttr) {
		return repository.selectList(queryAttr);
	};
	
	public long selectCount(QueryAttr queryAttr) {
		return repository.selectCount(queryAttr); 
	}
	
	public Jnl11ReprAcnt selectOne (String jnl11ReprAcntCd) {
		return repository.selectOne(jnl11ReprAcntCd);
	}
	
	@Transactional
	public int insert(Jnl11ReprAcnt jnl11ReprAcnt) {
		return repository.insert(jnl11ReprAcnt);
	}
	
	@Transactional
	public int update(Jnl11ReprAcnt jnl11ReprAcnt) {
		return repository.update(jnl11ReprAcnt);
	}
	
	@Transactional
	public int delete(String jnl11ReprAcntCd) {
		return repository.delete(jnl11ReprAcntCd);
	}
	
}
