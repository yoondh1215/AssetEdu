package kr.co.kfs.assetedu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.kfs.assetedu.model.ApiData;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ApiController {

//	@Autowired
//	private Com02CodeService codeService;
	
//	@GetMapping("/api/code")
//	public ResponseEntity<?> code(
//			@RequestParam(value="comCd",required=true)String comCd, 
//			@RequestParam(value="codeType",required=false)String codeType){

		
		
//		Com02Code com02Code = new Com02Code();
//		com02Code.setCom02ComCd(comCd);
//		com02Code.setCom02CodeType(codeType);
//		com02Code.setCom02UseYn("true");
//
//		Condition condition = new Condition();
//		condition.putClass(com02Code);
//		
//		List<Com02Code> list = codeService.selectList(condition);
////
//		ApiData apiData = new ApiData();
//		apiData.put("aa","Test");
		
//		apiData.put("list",list);
//		apiData.put("codeCd", comCd);
//
//		//---------------------------------- 이름찾기
//		
//		condition.clear();
//		condition.put("com02ComCd", comCd);
//		condition.put("com02DtlCd", "NONE");
//		
//		Com02Code type1 = new Com02Code();
//		type1.setCom02ComCd(comCd);
//		type1.setCom02DtlCd("NONE");
//		type1.setCom02UseYn("true");
//		
//		Com02Code com1 = codeService.selectOne(type1);
//		
//		apiData.put("codeNm", com1.getCom02CodeNm());
//		return ResponseEntity.ok(apiData);
//						
//	}
}
