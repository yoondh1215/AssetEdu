package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kfs.assetedu.model.Condition;
import kr.co.kfs.assetedu.model.Sys02Dict;
import kr.co.kfs.assetedu.repository.Sys02DictRepository;

@Service
public class Sys02DictService  {

	@Autowired
	private Sys02DictRepository dictRepository;

	
	public Sys02Dict selectOne(Sys02Dict user) {
		return dictRepository.selectOne(user);
	}
	
	public List<Sys02Dict> selectList(Condition condition){
		return dictRepository.selectList(condition);
	}
	
	public Integer selectCount(Condition condition){
		return dictRepository.selectCount(condition);
	}
	
	public String getDictId() {
		return dictRepository.getDictId();
	}
	
	@Transactional
	public int insert(Sys02Dict user) {
		return dictRepository.insert(user);
	}
	@Transactional
	public int update(Sys02Dict user) {
		return dictRepository.update(user);
	}
	@Transactional
	public int delete(Sys02Dict  user ) {
		return dictRepository.delete(user);
	}
}
