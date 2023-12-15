package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kfs.assetedu.model.Condition;
import kr.co.kfs.assetedu.model.Sys01User;
import kr.co.kfs.assetedu.model.Sys02Dict;
import kr.co.kfs.assetedu.repository.Sys01UserRepository;

@Service
public class Sys01UserService  {

	@Autowired
	private Sys01UserRepository userRepository;

	
	public Sys01User selectOne(Sys01User user) {
		return userRepository.selectOne(user);
	}
	
	public List<Sys01User> selectList(){
		return userRepository.selectList();
	}
	
	public Integer selectCount(Condition condition){
		return userRepository.selectCount(condition);
	}
	
	public String getUserId() {
		return userRepository.getUserId();
	}
	
	@Transactional
	public int insert(Sys01User user) {
		return userRepository.insert(user);
	}
	@Transactional
	public int update(Sys01User user) {
		return userRepository.update(user);
	}
	@Transactional
	public int delete(Sys01User  user ) {
		return userRepository.delete(user);
	}
}
