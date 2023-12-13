package kr.co.kfs.assetedu.model;

import java.util.HashMap;
import java.util.Map;

import kr.co.kfs.assetedu.utils.AssetUtil;


public class Condition extends HashMap<String, Object>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Condition() {
	}
	public void putClass(Object o) {
		Map<String,Object> map = AssetUtil.toMap(o);
		putAll(map);
	}

}
