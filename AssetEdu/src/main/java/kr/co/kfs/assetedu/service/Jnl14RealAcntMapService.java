package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kfs.assetedu.model.Jnl14RealAcntMap;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Jnl14RealAcntMapRepository;

@Service
public class Jnl14RealAcntMapService {

	@Autowired
	private Jnl14RealAcntMapRepository repository;

	public List<Jnl14RealAcntMap> selectList(QueryAttr queryAttr) {
		return repository.selectList(queryAttr);
	}

	public Jnl14RealAcntMap selectOne(Jnl14RealAcntMap realAcntMap) {
		return repository.selectOne(realAcntMap);
	}

	public int insert(Jnl14RealAcntMap realAcntMap) {
		return repository.insert(realAcntMap);
	}
	
	public int update(Jnl14RealAcntMap realAcntMap) {
		return repository.update(realAcntMap);
	}
	
	public int delete(Jnl14RealAcntMap realAcntMap) {
		return repository.delete(realAcntMap);
	}
	
	public Jnl14RealAcntMap selectOne(String jnl14ReprAcntCd) {
		Jnl14RealAcntMap ram = new Jnl14RealAcntMap();
		ram.setJnl14RealAcntCd(jnl14ReprAcntCd);
		return this.selectOne(ram);
	}
	
	

}
