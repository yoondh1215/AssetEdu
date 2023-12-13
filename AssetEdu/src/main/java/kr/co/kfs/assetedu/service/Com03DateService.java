package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kfs.assetedu.model.Com03Date;
import kr.co.kfs.assetedu.model.Condition;
import kr.co.kfs.assetedu.repository.Com03DateRepository;

@Service
public class Com03DateService {
	@Autowired
	private Com03DateRepository dateRepository;

	public Com03Date selectOne(Com03Date date) {
		return dateRepository.selectOne(date);
	}
	
	public List<Com03Date> selectList(Condition condition){
		return dateRepository.selectList(condition);
	}
	
	public Integer selectCount(Condition condition){
		return dateRepository.selectCount(condition);
	}
	
	public String selectBizDate(Condition condition){
		return dateRepository.selectBizDate(condition);
	}
	
	@Transactional
	public int insert(Com03Date date) {
		return dateRepository.insert(date);
	}
	@Transactional
	public int update(Com03Date date) {
		return dateRepository.update(date);
	}
	@Transactional
	public int delete(Com03Date  date ) {
		return dateRepository.delete(date);
	}
}
