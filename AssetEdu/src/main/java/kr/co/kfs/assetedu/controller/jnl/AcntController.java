package kr.co.kfs.assetedu.controller.jnl;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kfs.assetedu.model.Jnl10Acnt;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Com02CodeService;
import kr.co.kfs.assetedu.service.Jnl10AcntService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/jnl/acnt")
public class AcntController {

	@Autowired
	Jnl10AcntService service;
	@Autowired
	Com02CodeService codeService;
	
	
	private final String baseUrl = "/jnl/acnt";
	
	
	@GetMapping("list")
	public String list(Model model, String searchText) {
		model.addAttribute("pageTitle","계정과목");
		
		QueryAttr queryAttr = new QueryAttr();
		queryAttr.put("searchText", searchText);
		
		List<Jnl10Acnt> list = new ArrayList<Jnl10Acnt>();
		list = service.selectList(queryAttr);
		model.addAttribute("list", list);
		return "/jnl/acnt/list";
	}
	
	
	@GetMapping("insert")
	public String insert(Model model) {
		model.addAttribute("pageTitle","계정과목추가");
		model.addAttribute("jnl10Acnt"     ,new Jnl10Acnt());
		model.addAttribute("acntAttrCodeList", codeService.codeList("AcntAttrCode"));
		model.addAttribute("drcrTypeList", codeService.codeList("DrcrType"));
		return "/jnl/acnt/insert_form";
	}
	
	@PostMapping("insert")
	public String insert(@Valid @ModelAttribute("jnl10Acnt") Jnl10Acnt jnl10Acnt, BindingResult bindingResult, RedirectAttributes redirectAttr, Model model) {
		
		String jnl10AcntCd = jnl10Acnt.getJnl10AcntAttrCd();
		Jnl10Acnt checkAcnt = new Jnl10Acnt();
		checkAcnt = service.selectOne(jnl10AcntCd);
		
		if (checkAcnt == null) {	//중복이 아니라면 인서트
			int i = service.insert(jnl10Acnt);
			String msg = "등록 성공";
			redirectAttr.addAttribute("msg",msg);
			redirectAttr.addAttribute("mode", "insert");
			return "redrirect:" + baseUrl + "/success";
			
		} else {	//중복이라면 바인딩에러에 에러 넣어서 돌려보냄
			String msg = "중복인 코드가 존재합니다";
			bindingResult.addError(new FieldError("", "", msg));
			model.addAttribute("jnl10Acnt",jnl10Acnt);
			model.addAttribute("acntAttrCodeList", codeService.codeList("AcntAttrCode"));
			model.addAttribute("drcrTypeList", codeService.codeList("DrcrType"));
			return "/jnl/acnt/insert_form";
		}
	}
	
	@GetMapping("update/{jnl10AcntCd}")
	public String update(Model model, @PathVariable("jnl10AcntCd") String jnl10AcntCd ) {
		
		Jnl10Acnt jnl10Acnt = new Jnl10Acnt();
		jnl10Acnt = service.selectOne(jnl10AcntCd);
		model.addAttribute("jnl10Acnt", jnl10Acnt);
		
		model.addAttribute("acntAttrCodeList", codeService.codeList("AcntAttrCode"));
		model.addAttribute("drcrTypeList", codeService.codeList("DrcrType"));		
		return "/jnl/acnt/update_form";
	}
	
	@PostMapping("update")
	public String update (@ModelAttribute("jnl10Acnt") Jnl10Acnt jnl10Acnt, RedirectAttributes redirectAttr) {
		int i = service.update(jnl10Acnt);
		
		String msg = String.format("\" %s \"   계정과목이 수정되었습니다. ", jnl10Acnt.getJnl10AcntNm());
		redirectAttr.addAttribute("mode","update");
		redirectAttr.addAttribute("msg",msg);
		redirectAttr.addAttribute("jnl10AcntCd", jnl10Acnt.getJnl10AcntCd());
		return "/jnl/acnt/success";
	}
	
	@GetMapping("/delete/{jnl10AcntCd}")
	public String delete (@PathVariable("jnl10AcntCd") String jnl10AcntCd) {
		int i = service.delete(jnl10AcntCd);
		return "redirect:/jnl/acnt/list";
	}
}
