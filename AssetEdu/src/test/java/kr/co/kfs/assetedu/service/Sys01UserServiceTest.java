package kr.co.kfs.assetedu.service;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kfs.assetedu.model.PageCondition;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
@TestInstance(Lifecycle.PER_CLASS)
class Sys01UserServiceTest {

	@Autowired
//	private Sys01UserRepository userRepository;

	@BeforeEach
	@Transactional
	public void setUp() {
//		Sys01User user = new Sys01User();
//		user.setSys01UserId("test1");
//		user.setSys01UserNm("홍길동1");
//		user.setSys01Pwd("1234");
//		userRepository.delete(user);
//		userRepository.insert(user);
	}
	
	@Test
	void testSelectOne() {
//		Sys01User user = new Sys01User();
//		user.setSys01UserId("user1");
//		Sys01User foundUser = userRepository.selectOne(user);
//		assertNotNull(foundUser);
//		log.debug("found user : {}",foundUser.toString());
	}

	@Test
	@DisplayName("Condtion과 PageCondition을 이용한 조회")
	void testSelectList() {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		PageCondition pageCondition = new PageCondition();
		
//		pageCondition.getPageAttr().setOffset(100);
//		List<Sys01User> list = userRepository.selectList(pageCondition);
//		assertNotNull(list);
//		log.debug("count : {}",list.size());
//		
//		Condition condition  = new Condition();
//		condition.put("sys01UserId", "test1");
//		list = userRepository.selectList(condition);
//		assertNotNull(list);
//		int size = userRepository.selectCount(condition);
//		assertEquals(size, list.size());
//		log.debug("count : {}", list.size());
		
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
	}

	@Test
	@Transactional
	void testUpdate() {
//		Sys01User user = new Sys01User();
//		user.setSys01UserId("test1");
//		user.setSys01UserNm("홍길동2");
//		user.setSys01Pwd("1234");
//		
//		int i = userRepository.update(user);
//		Sys01User user2 = userRepository.selectOne(user);
//		assertEquals(user2.getSys01UserNm(), user.getSys01UserNm());
//		log.debug("updated : {}", i);
	}

	@Test
	@Transactional
	void testDelete() {
//		Sys01User user = new Sys01User();
//		user.setSys01UserId("test1");
//		user.setSys01UserNm("홍길동2");
//		user.setSys01Pwd("1234");
//		
//		int i = userRepository.delete(user);
//		log.debug("deleted : {}", i);

	}
	@AfterAll
	@Test
	void testAfterTestClass() {
//		Sys01User user = new Sys01User();
//		user.setSys01UserId("test1");
//		userRepository.delete(user);
	}

}
