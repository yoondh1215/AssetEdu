package kr.co.kfs.assetedu.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kfs.assetedu.model.ApiData;
import kr.co.kfs.assetedu.model.Com02Code;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Com02CodeService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/code")
public class CodeController {

	@Autowired
	private Com02CodeService service;
	
	/**
	 * 공통코드 리스트
	 * @param searchText 검색어
	 * @param lastComCd 마지막 선택된 공통코드
	 * @param model
	 * @return
	 */
	@GetMapping("list")
	public String list(String searchText, String lastComCd, Model model) {
		log.debug("공통코드 리스트 ");
		
		QueryAttr condition = new QueryAttr();
		condition.put("searchText", searchText);
		List<Com02Code> listCategory = selectComCds(condition);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("lastComCd", lastComCd);
		
		return "/code/list";
	}

	/**
	 * 공통코드 리스트
	 * @param condition
	 * @return
	 */
	private  List<Com02Code> selectComCds(QueryAttr condition) {
		Com02Code code = new Com02Code();
		code.setCom02CodeType("C");
		//code.setCom02UseYn("true");
		
		condition.putClass(code);
		List<Com02Code>list = service.selectList(condition);
		return list;
	}
	

	/**
	 * ajax로 insert 모달에서 처리함으로
	 * 
	 * @param data
	 * @return
	 */
	@ResponseBody
	@PostMapping("insert")
	public String insert(@Valid @RequestBody Com02Code com02Code) {
		ApiData apiData = new ApiData();
		try {
			log.debug("Com02Code : {}", com02Code);
			int count = service.insert(com02Code);
			apiData.put("count", count);
			apiData.put("result", "OK");
			apiData.put("com02Code", com02Code);
			apiData.put("msg", "추가되었습니다. 추가된 레코드갯수 : "+count );
		} catch (Exception e) {
			apiData.put("result", "NK:" + e.getMessage());
		}
		return apiData.toJson();
	}	
	/**
	 * ajax로 insert 모달에서 처리함으로
	 * 
	 * @param data
	 * @return
	 */
	@ResponseBody
	@PostMapping("update")
	public String update(@Valid @RequestBody Com02Code com02Code) {
		ApiData apiData = new ApiData();
		try {
			log.debug("Com02Code : {}", com02Code);
			int count = service.update(com02Code);
			apiData.put("count", count);
			apiData.put("result", "OK");
			apiData.put("com02Code", com02Code);
			apiData.put("msg", "수정되었습니다. 수정된 레코드갯수 : "+count );
			
		} catch (Exception e) {
			apiData.put("result", "NK:" + e.getMessage());
		}
		return apiData.toJson();
	}	
	/**
	 * 공통코드 또는 상세코드 삭제 
	 * 공콩코드를 삭제하면 딸려있는 상세코드도 삭제됨
	 * @param comCd
	 * @param dtlCd
	 * @param rttr
	 * @return
	 */
	@GetMapping("delete")
	public String delete(
			@RequestParam(value="comCd", required=true) String comCd,
			@RequestParam(value="dtlCd", required=false) String dtlCd, RedirectAttributes rttr) {
		log.debug("코드삭제.... ");
		Com02Code code = new Com02Code();
		code.setCom02ComCd(comCd);
		code.setCom02DtlCd(dtlCd);
		int count = service.delete(code);
		log.debug("deleted count : {}", count);
		rttr.addAttribute("lastComCd", comCd); //마지막 선택된 공통코드
		return "redirect:/code/list";
	}	

	/**
	 * ajax로 호출됨
	 * 공통코드로 상세코드목록을 찾아서 리턴해준다
	 * @param comCd
	 * @param codeType
	 * @return
	 */
	@ResponseBody
	@GetMapping("find")
	public String find(
			@RequestParam(value="comCd",required=true)String comCd, 
			@RequestParam(value="codeType",required=false)String codeType){
		
		Com02Code com02Code = new Com02Code();
		com02Code.setCom02ComCd(comCd);
		com02Code.setCom02CodeType(codeType);
		//com02Code.setCom02UseYn("true");

		QueryAttr condition = new QueryAttr();
		condition.putClass(com02Code);
		
		List<Com02Code> list = service.selectList(condition);

		ApiData apiData = new ApiData();
		apiData.put("list",list);
		apiData.put("codeCd", comCd);

		//공통코드의 이름을 찾는다
		condition.clear();
		condition.put("com02ComCd", comCd);
		condition.put("com02DtlCd", "NONE");
		
		Com02Code type1 = new Com02Code();
		type1.setCom02ComCd(comCd);
		type1.setCom02DtlCd("NONE");
		type1.setCom02UseYn("true");
		
		Com02Code com1 = service.selectOne(type1);
		
		apiData.put("codeNm", com1.getCom02CodeNm());
		
		String json = apiData.toJson();
		return json;
						
	}
}
