package kr.co.kfs.assetedu.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kfs.assetedu.model.Itm01Item;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Com02CodeService;
import kr.co.kfs.assetedu.service.Itm01ItemService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("item")
public class ItemController {
	
	@Autowired
	Itm01ItemService service;
	@Autowired
	Com02CodeService codeService;

	@GetMapping("list")
	public String list(Model model, String searchText) {
		QueryAttr condition = new QueryAttr();
		condition.put("searchText", searchText);
		List<Itm01Item> list = new ArrayList<>();
		list = service.selectList(condition);
		model.addAttribute("list",list);
		model.addAttribute("pageTitle","종목정보-리스트");
		return "/item/list";
	}
	
	@GetMapping("insert")
	public String insert(Model model) {
		model.addAttribute("pageTitle","종목등록");
		model.addAttribute("item",new Itm01Item());
		model.addAttribute("stkListTypeList", codeService.codeList("ListType"));
		model.addAttribute("marketTypeList" , codeService.codeList("MarketType"));
		model.addAttribute("stkTypeList"    , codeService.codeList("StkType"));

		return "/item/insert_form";
	}
	
	@PostMapping("insert")
	public String insert (@Valid @ModelAttribute("itm01Item") Itm01Item itm01Item, BindingResult bindingResult, Model model, RedirectAttributes redirectAttr) {
	
		//@valid 이용한 유효성 검사에 문제 있으면 bindingResult가 오류값 저장.
		if(bindingResult.hasErrors()) {
			model.addAttribute("pageTitle","종목등록");
			model.addAttribute("item",itm01Item);
			model.addAttribute("stkListTypeList", codeService.codeList("ListType"));
			model.addAttribute("marketTypeList" , codeService.codeList("MarketType"));
			model.addAttribute("stkTypeList"    , codeService.codeList("StkType"));
			return "/item/insert_form";
		}
		
		String itm01ItemCd = itm01Item.getItm01ItemCd();
		Itm01Item itemCheck = service.selectOne(itm01ItemCd);
		if (itemCheck == null) {	//중복코드가 없다면
			int i = service.insert(itm01Item);
			String msg = "펀드 등록 성공.";
			redirectAttr.addAttribute("msg",msg);
			return "redirect:/item/list";
		} else {
			String msg = "이미 존재하는 코드입니다.";
			bindingResult.addError(new FieldError("", "", msg));
			model.addAttribute("pageTitle","종목등록");
			model.addAttribute("item",itm01Item);
			model.addAttribute("stkListTypeList", codeService.codeList("ListType"));
			model.addAttribute("marketTypeList" , codeService.codeList("MarketType"));
			model.addAttribute("stkTypeList"    , codeService.codeList("StkType"));
			return "/item/insert_form";
		}
		
		
				
				
	}
	
	@GetMapping("update")
	public String update(Model model, @RequestParam("itm01ItemCd") String itm01ItemCd) {
		Itm01Item item = new Itm01Item();
		item = service.selectOne(itm01ItemCd);
		model.addAttribute("item",item);
		
		model.addAttribute("pageTitle","종목수정");
		model.addAttribute("stkListTypeList", codeService.codeList("ListType"));
		model.addAttribute("marketTypeList" , codeService.codeList("MarketType"));
		model.addAttribute("stkTypeList"    , codeService.codeList("StkType"));
		
		return "/item/update_form";
	}
	
	@PostMapping("update")				//@RequestParam("item") Itm01Item itm01Item <- 이거 왜 안됨??
	public String update (Model model, Itm01Item item) {
		int i = service.update(item);
		return "redirect:/item/list";
	}
	
	@GetMapping("delete")
	public String delete (String itm01ItemCd) {
		int i = service.delete(itm01ItemCd);
		return "redirect:/item/list";
	}
	
}

