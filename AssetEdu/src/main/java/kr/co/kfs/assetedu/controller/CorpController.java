package kr.co.kfs.assetedu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kfs.assetedu.model.Com01Corp;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Com01CorpService;
import kr.co.kfs.assetedu.service.Com02CodeService;

@Controller
@RequestMapping("corp")
public class CorpController {

	@Autowired
	Com01CorpService service;
	@Autowired
	Com02CodeService codeService;
	
	@GetMapping("list")
	public String list (Model model, String searchText) {
		QueryAttr queryAttr = new QueryAttr();
		queryAttr.put("searchText", searchText);
		List<Com01Corp> list =  service.selectList(queryAttr);
		model.addAttribute("list",list);
		return "/corp/list";
	}
	
	
	
	
	@GetMapping("insert")
	public String insert(Model model) {
		model.addAttribute("pageTitle","기관등록");
		model.addAttribute("corp",new Com01Corp());
		model.addAttribute("corpTypeList", codeService.codeList("CorpType"));
		return "/corp/insert_form";
	}
	
	@PostMapping("insert")
	public String insert(Com01Corp com01Corp) {
		service.insert(com01Corp);
		return "redirect:/corp/list";
	}
	
	@GetMapping("update")
	public String update(Model model, String com01CorpCd) {
		Com01Corp corp = service.selectOne(com01CorpCd);
		model.addAttribute("corp", corp);
		model.addAttribute("corpTypeList", codeService.codeList("CorpType"));
		return "/corp/update_form";
	}
	
	@PostMapping("update")
	public String update(Com01Corp com01Corp) {
		service.update(com01Corp);
		return "redirect:/corp/list";
	}
	
	@GetMapping("delete")
	public String delete (String com01CorpCd) {
		int i = service.delete(com01CorpCd);
		return "redirect:/corp/list";
	}
	
	
	
}
