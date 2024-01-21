package kr.co.kfs.assetedu.repository;

import java.util.List;

import kr.co.kfs.assetedu.model.Itm01Item;
import kr.co.kfs.assetedu.model.QueryAttr;

public interface Itm01ItemRepository {

	public List<Itm01Item> selectList(QueryAttr condition);
	public Itm01Item selectOne(String itm01ItemCd);
	public int insert(Itm01Item itm01Item);
	public int update (Itm01Item itm01Item);
	public int delete (String itm01ItemCd);
	public long selectCount(QueryAttr condition);
}
