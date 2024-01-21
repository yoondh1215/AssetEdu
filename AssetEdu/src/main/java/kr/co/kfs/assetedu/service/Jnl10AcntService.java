package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kfs.assetedu.model.Jnl10Acnt;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Jnl10AcntRepository;

@Service
public class Jnl10AcntService {

	@Autowired
	Jnl10AcntRepository repository;
	
	public List<Jnl10Acnt> selectList(QueryAttr queryAttr){
		return repository.selectList(queryAttr);
	}
	
	public Jnl10Acnt selectOne(String jnl10AnctCd) {
		return repository.selectOne(jnl10AnctCd);
	}
	
	public int insert(Jnl10Acnt jnl10Acnt) {
		return repository.insert(jnl10Acnt);
	}
	
	public int selectCount(QueryAttr queryAttr) {
		return repository.selectCount(queryAttr);
	}
	
	public int update(Jnl10Acnt jnl10Acnt) {
		return repository.update(jnl10Acnt);
	}
	
	public int delete (String jnl10AcntCd) {
		return repository.delete(jnl10AcntCd);
	}
}
