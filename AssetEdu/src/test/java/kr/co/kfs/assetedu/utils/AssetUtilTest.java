package kr.co.kfs.assetedu.utils;

import org.junit.jupiter.api.Test;

class AssetUtilTest {

	@Test
	void test() {
		System.out.println(AssetUtil.ymd());
	
		System.out.println(AssetUtil.displayYmd("20231215"));
		System.out.println(AssetUtil.today());
		
	}

}
