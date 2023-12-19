package kr.co.kfs.assetedu.model;

import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class ConditionTest {

	@Test @Disabled
	void test() {
//		Condition condition = new Condition();
//		assertNotNull( condition);
		PageAttr pageAttr = new PageAttr(130L, 10);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("key1", 1);
		map.put("key2", "abv");
		map.put("key3", "스레도");
		map.put("name", "사호성");
		map.put("pageAttr", pageAttr);
		
	//	String name = (String)map.get("name");
	//	System.out.println(name);
		
		PageAttr pageAttr1 = (PageAttr)map.get("pageAttr");
		Long totalCount = pageAttr1.getTotalItemCount();
		System.out.println("totalCount" + totalCount);
		
		
		
	}
	
	@Test
	void test2() {
		QueryAttr condition = new QueryAttr();
		PageAttr pageAttr = new PageAttr(130L, 10);
		
		condition.put("name", "홍길동");
		condition.put("pageAttr", pageAttr);
		PageAttr pageAttr2 = (PageAttr)condition.get("pageAttr");
				
		int pageSize = pageAttr.getPageSize();
		System.out.println("앞은 토탈카운트 뒤는 페이지사이즈" + pageSize);
	}
	
	
	
	
	
	
//	@Test
//	void test1() {
//		Com02Code code = new Com02Code();
//		code.setCom02ComCd("1");
//		code.setCom02DtlCd("2");
//		Condition condition = new Condition();
//		condition.putClass(code);
//		String s = (String) condition.get("com02ComCd");
//		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
//		log.debug("s: {}", s);
//		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");

//	}

}
