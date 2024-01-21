package kr.co.kfs.assetedu.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kfs.assetedu.model.Jnl12Tr;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Jnl12TrRepository;

@Service
public class Jnl12TrService {

	@Autowired
	private Jnl12TrRepository repository;

	public List<Jnl12Tr> selectList(QueryAttr condition) {
		return repository.selectList(condition);
	}
	
	@Transactional
	public int insert(@Valid Jnl12Tr jnl12Tr) {
		return repository.insert(jnl12Tr);
	}
	@Transactional
	public int update(Jnl12Tr acnt) {
		return repository.update(acnt);
	}

	@Transactional
	public int delete(Jnl12Tr acnt) {
		return repository.delete(acnt);
	}

	public Jnl12Tr selectOne(String jnl12TrCd) {
		Jnl12Tr trMap = new Jnl12Tr();
		trMap.setJnl12TrCd(jnl12TrCd);
		return repository.selectOne(trMap);
	}
	public Jnl12Tr selectOne(Jnl12Tr jnl12Tr) {
		return repository.selectOne(jnl12Tr);
	}

	public int delete(String jnl12TrCd) {
		Jnl12Tr trMap = new Jnl12Tr();
		trMap.setJnl12TrCd(jnl12TrCd);
		return this.delete(trMap);
	}

}
