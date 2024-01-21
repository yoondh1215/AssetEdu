package kr.co.kfs.assetedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kfs.assetedu.model.Itm01Item;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.repository.Itm01ItemRepository;

@Service
public class Itm01ItemService {

	@Autowired
	Itm01ItemRepository repository;
	
	public List<Itm01Item> selectList(QueryAttr condition) {
		return repository.selectList(condition);
	};
	
	public Itm01Item selectOne(String itm01ItemCd) {
		return repository.selectOne(itm01ItemCd);
	}
	
	public int insert(Itm01Item itm01Item) {
		return repository.insert(itm01Item);
	}
	
	public int update (Itm01Item itm01Item) {
		return repository.update(itm01Item);
	}
	
	public int delete(String itm01ItemCd) {
		return repository.delete(itm01ItemCd);
	}
	
	public long selectCount(QueryAttr condition){
		return repository.selectCount(condition);
	}

}
