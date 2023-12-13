package kr.co.kfs.assetedu.model;

import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class PageAttrTest {

	@Test
	void test() {
		PageAttr pageAttr = new PageAttr(0L,10,1);
		log.debug(pageAttr.toString());
		
		pageAttr = new PageAttr(13L,10,1);
		log.debug(pageAttr.toString());
		
		String s= "20221103";
		System.out.println(s.substring(0,4));
		System.out.println(s.substring(4,6));
		System.out.println(s.substring(6));
	}

}
