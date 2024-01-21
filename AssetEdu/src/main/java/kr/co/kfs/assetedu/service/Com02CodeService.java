package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kfs.assetedu.model.Com02Code;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Com02CodeRepository;

@Service
public class Com02CodeService {

	@Autowired
	Com02CodeRepository codeRepository;
	
	public Com02Code selectOne(Com02Code code) {
		return codeRepository.selectOne(code);
	}
	
	public List<Com02Code> selectList(QueryAttr condition){
		return codeRepository.selectList(condition);
	}
	
	public Integer selectCount(QueryAttr condition){
		return codeRepository.selectCount(condition);
	}
	
	@Transactional
	public int insert(Com02Code code) {
		return codeRepository.insert(code);
	}
	@Transactional
	public int update(Com02Code code) {
		return codeRepository.update(code);
	}
	@Transactional
	public int delete(Com02Code  code ) {
		return codeRepository.delete(code);
	}

	public List<Com02Code> codeList(String comCd) {
		QueryAttr condition = new QueryAttr();
		condition.put("com02ComCd"   , comCd);
		condition.put("com02CodeType", "D");
		condition.put("com02UseYn"   , "true");
		return codeRepository.selectList(condition);
	}

	public List<Com02Code> selectTrList(String type) {
		return codeRepository.selectTrList(type);
	}
}
