package kr.co.kfs.assetedu.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kfs.assetedu.model.Jnl13TrMap;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Jnl13TrMapRepository;

@Service
public class Jnl13TrMapService {

	@Autowired
	private Jnl13TrMapRepository repository;

	public List<Jnl13TrMap> selectList(QueryAttr condition) {
		return repository.selectList(condition);
	}
	public List<Jnl13TrMap> selectList(String trCd) {
		QueryAttr condition = new QueryAttr();
		condition.put("jnl13TrCd", trCd);
		return selectList(condition);
	}
	
	@Transactional
	public int insert(@Valid Jnl13TrMap jnl13TrMap) {
		return repository.insert(jnl13TrMap);
	}
	@Transactional
	public int update(Jnl13TrMap jnl13TrMap) {
		return repository.update(jnl13TrMap);
	}

	@Transactional
	public int delete(Jnl13TrMap jnl13TrMap) {
		return repository.delete(jnl13TrMap);
	}
	public Jnl13TrMap selectOne(Jnl13TrMap jnl13TrMap) {

		return repository.selectOne(jnl13TrMap);
	}
	
	public Jnl13TrMap selectOne(String jnl13TrCd, Integer seq) {
		Jnl13TrMap trMap = new Jnl13TrMap();
		trMap.setJnl13TrCd(jnl13TrCd);
		trMap.setJnl13Seq(seq);
		return repository.selectOne(trMap);
	}

	public int delete(String jnl13TrCd) {
		Jnl13TrMap trMap = new Jnl13TrMap();
		trMap.setJnl13TrCd(jnl13TrCd);
		return this.delete(trMap);
	}

}
