package kr.co.kfs.assetedu.servlet.validation;

import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;


@WebMvcTest(CorrectDateYmd.class)
class CorrectDateYmdValidationTest {

//	@Autowired
//	private MockMvc mockMvc;
//	
//	@Autowired
//	private ObjectMapper objMapper;
	
//	@Test
//	void test() throws JsonProcessingException {
//		// /opr/buy_insert
//		Opr01Cont opr01Cont = new Opr01Cont();
//		opr01Cont.setOpr01ContDate("20221109");
//		opr01Cont.setOpr01SettleDate("20221109");
//		String content = objMapper.writeValueAsString(opr01Cont);
//		
//		mockMvc.perform("/opr/buy_insert")
//			.content(content)
//			.contentType(MediaType.APPLICATION_FORM_URLENCODED_VALUE)
//			.accept(MediaType.TEXT_HTML)
//			and
//	}

}
