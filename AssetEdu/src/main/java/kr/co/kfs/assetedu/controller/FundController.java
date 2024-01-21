package kr.co.kfs.assetedu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kfs.assetedu.model.Fnd01Fund;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Com02CodeService;
import kr.co.kfs.assetedu.service.Fnd01FundService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("fund")
public class FundController {

	@Autowired
	Fnd01FundService service;
	@Autowired
	Com02CodeService codeService;
	
	@GetMapping("list")
	public String list(Model model) {
		List<Fnd01Fund> list = new ArrayList<>();
		QueryAttr queryAttr = new QueryAttr();
		//필요해서 QueryAttr queryAttr 추후 서치텍스트 등 넣던가 하지.
		
		list = service.selectList(queryAttr);
		model.addAttribute("list",list);
		return "/fund/list";
	}
	
	@GetMapping("insert")
	public String insert(Model model) {
		model.addAttribute("fund",new Fnd01Fund());
		model.addAttribute("pageTitle","펀드등록");
		model.addAttribute("fundTypeList", codeService.codeList("FundType"));
		model.addAttribute("publicCdList", codeService.codeList("PublicCode"));
		model.addAttribute("unitCdList"  , codeService.codeList("FundUnitCode"));
		model.addAttribute("parentCdList", codeService.codeList("FundParentCode"));
		return "/fund/insert_form";
	}
	
	@PostMapping("insert")
	public String insert(@Valid @ModelAttribute("fnd01Fund") Fnd01Fund fnd01Fund, BindingResult bindingResult, Model model, RedirectAttributes redirectAttr) {

		//@valid 이용한 유효성 검사에 문제 있으면 bindingResult가 오류값 저장.
		if(bindingResult.hasErrors()) {
			model.addAttribute("fundTypeList", codeService.codeList("FundType"));
			model.addAttribute("publicCdList", codeService.codeList("PublicCode"));
			model.addAttribute("unitCdList"  , codeService.codeList("FundUnitCode"));
			model.addAttribute("parentCdList", codeService.codeList("FundParentCode"));
			model.addAttribute("fund",fnd01Fund);
			return "/fund/insert_form";	
		}
		
		
		//펀드코드 중복을 체크하여 구분
		String fnd01FundCd = fnd01Fund.getFnd01FundCd();
		Fnd01Fund fundCheckObject = service.selectOne(fnd01FundCd);
		
		if (fundCheckObject == null) {	//중복코드가 없다면
			int j = service.insert(fnd01Fund);
			String msg = "펀드 등록 성공.";
			redirectAttr.addAttribute("msg",msg);
			return "redirect:/fund/list";
		} else {	//중복코드가 있다면
			String msg = "이미 존재하는 코드입니다.";
			
			//FiledError 예시 (객체명, 필드명, 메세지)
			//bindingResult.addError(new FieldError("item", "itemName", "상품이름은 필수입니다."));
			
			bindingResult.addError(new FieldError("", "", msg));
			
			log.debug("바인딩에러");
			
			model.addAttribute("fundTypeList", codeService.codeList("FundType"));
			model.addAttribute("publicCdList", codeService.codeList("PublicCode"));
			model.addAttribute("unitCdList"  , codeService.codeList("FundUnitCode"));
			model.addAttribute("parentCdList", codeService.codeList("FundParentCode"));
			model.addAttribute("fund",fnd01Fund);
			
			return "/fund/insert_form";
		}
	}
	
	@GetMapping("update")
	public String update(Model model, @RequestParam("fnd01FundCd") String fnd01FundCd) {
		Fnd01Fund fund = new Fnd01Fund();
		fund = service.selectOne(fnd01FundCd);
		model.addAttribute("fund",fund);
	
		model.addAttribute("pageTitle","펀드등록");
		model.addAttribute("fundTypeList", codeService.codeList("FundType"));
		model.addAttribute("publicCdList", codeService.codeList("PublicCode"));
		model.addAttribute("unitCdList"  , codeService.codeList("FundUnitCode"));
		model.addAttribute("parentCdList", codeService.codeList("FundParentCode"));
		
		return "/fund/update_form";
	}
	
	@PostMapping("update")
	public String update(Model model, Fnd01Fund fund) {
		Fnd01Fund fnd01Fund = new Fnd01Fund();
		fnd01Fund = fund;
		int i = service.update(fund);
		return "redirect:/fund/list";
	}
	
	@GetMapping("delete")
	public String delete (@RequestParam("fnd01FundCd") String fnd01FundCd) {
		service.delete(fnd01FundCd);
		return "redirect:/fund/list";
	}
}
