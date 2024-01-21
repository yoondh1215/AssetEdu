package kr.co.kfs.assetedu.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kfs.assetedu.model.Jnl14RealAcntMap;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Com02CodeService;
import kr.co.kfs.assetedu.service.Jnl14RealAcntMapService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/jnl/real-acnt")
public class RealAcntController {

	private final String baseUrl = "/jnl/real-acnt";
	
	@Autowired
	private Jnl14RealAcntMapService service;
	@Autowired
	private Com02CodeService codeService;
	
	
	@GetMapping("list")
	public String list(String searchText,   Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("실계정맵핑");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","실계정맵핑");
		
		QueryAttr queryAttr = new QueryAttr();
		queryAttr.put("searchText", searchText);
		List<Jnl14RealAcntMap> list = service.selectList(queryAttr);
		model.addAttribute("list", list);
		return baseUrl + "/list";
	}
	
	@GetMapping("insert")
	public String insert(Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("실계정맵핑 추가 화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","실계정맵핑추가");
		model.addAttribute("jnl14RealAcntMap"     ,new Jnl14RealAcntMap());

		model.addAttribute("listTypeList", codeService.codeList("ListType"));
		model.addAttribute("marketTypeList", codeService.codeList("MarketType"));
		
		return baseUrl + "/insert_form";
	}
	
	@PostMapping("insert")
	public String insert(@Valid @ModelAttribute("jnl14RealAcntMap") Jnl14RealAcntMap realAcntMap, 
					BindingResult bindingResult,  RedirectAttributes redirectAttr, Model model)  {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("실계정맵핑 저장 후 리스트로 이동");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("realAcntMap: {}", realAcntMap);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("listTypeList", codeService.codeList("ListType"));
			model.addAttribute("marketTypeList", codeService.codeList("MarketType"));
			return baseUrl + "/insert_form";	
		}
		
		String msg = null;
		
		//중목체크
		Jnl14RealAcntMap jnl14RealAcntMap = service.selectOne(realAcntMap);
		if(jnl14RealAcntMap != null) {
			msg = String.format("중복오류: 이미 존재하는 데이터입니다.");
			model.addAttribute("listTypeList", codeService.codeList("ListType"));
			model.addAttribute("marketTypeList", codeService.codeList("MarketType"));
			bindingResult.addError(new FieldError("", "", msg));
			return  baseUrl + "/insert_form";
		}
		
		int affectedCount = 0;
		
		affectedCount = service.insert(realAcntMap);
		log.debug("DB에 적용된 갯수 : {}",affectedCount );
		
		//성공화면으로 redirect
		redirectAttr.addFlashAttribute("mode", "insert");
		redirectAttr.addFlashAttribute("realAcntMap", realAcntMap);
		return "redirect:" + baseUrl + "/success";
	}
	
	
	@GetMapping("update")
	public String update(@ModelAttribute("Jnl14RealAcntMap") Jnl14RealAcntMap jnl14RealAcntMap, Model model)  {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("실계정맵핑 수정 form 표시");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		Jnl14RealAcntMap realAcntMap = service.selectOne(jnl14RealAcntMap);
		
		realAcntMap.setJnl14ReprAcntCdOld(realAcntMap.getJnl14ReprAcntCd());
		realAcntMap.setJnl14ListTypeOld(realAcntMap.getJnl14ListType());
		realAcntMap.setJnl14MarketTypeOld(realAcntMap.getJnl14MarketType());
		
		model.addAttribute("jnl14RealAcntMap", realAcntMap);
		model.addAttribute("listTypeList", codeService.codeList("ListType"));
		model.addAttribute("marketTypeList", codeService.codeList("MarketType"));
		
		return baseUrl + "/update_form";
	}
	
	@PostMapping("update")
	public String update_form(@Valid @ModelAttribute("jnl14RealAcntMap") Jnl14RealAcntMap jnl14RealAcntMap, 
			BindingResult bindingResult, Model model, RedirectAttributes redirectAttr) throws UnsupportedEncodingException {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("실계정맵핑 수정");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("realAcntMap: {}", jnl14RealAcntMap);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("listTypeList", codeService.codeList("ListType"));
			model.addAttribute("marketTypeList", codeService.codeList("MarketType"));
			return baseUrl + "/update_form";	
		}
		String msg = null;
		Jnl14RealAcntMap checkRealAcntMap = service.selectOne(jnl14RealAcntMap);		

		if(checkRealAcntMap != null) {
			if(checkRealAcntMap.getJnl14ReprAcntCd().equals(jnl14RealAcntMap.getJnl14ReprAcntCdOld()) &&
			   checkRealAcntMap.getJnl14ListType().equals(jnl14RealAcntMap.getJnl14ListTypeOld()) &&
			   checkRealAcntMap.getJnl14MarketType().equals(jnl14RealAcntMap.getJnl14MarketTypeOld())) {
				log.debug("내꺼 내가 수정하겠음!!!");
			} else {
				msg = String.format("중복오류: 이미 존재하는 데이터입니다.");
				model.addAttribute("listTypeList", codeService.codeList("ListType"));
				model.addAttribute("marketTypeList", codeService.codeList("MarketType"));
				bindingResult.addError(new FieldError("", "", msg));
				return  baseUrl + "/update_form";
			}
		}

		int affectedCount = service.update(jnl14RealAcntMap);
		log.debug("DB에 적용된 갯수 : {}",affectedCount );

		//성공화면을 redirect
		redirectAttr.addFlashAttribute("mode", "update");
		redirectAttr.addFlashAttribute("realAcntMap", jnl14RealAcntMap);
		return "redirect:" + baseUrl +"/success"; 
	}
	
	@GetMapping("delete")
	public String delete(@ModelAttribute("jnl14RealAcntMap") Jnl14RealAcntMap jnl14RealAcntMap) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("acnt삭제할 id : {}",jnl14RealAcntMap);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		
		int deletedCount = service.delete(jnl14RealAcntMap);
		if(deletedCount > 0) {
			log.warn("jnl14RealAcntMap id : {}가 삭제되었습니다");
		}
		return "redirect:" + baseUrl + "/list";
	}
	@GetMapping("success")
	public String success(Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("실계정맵핑 추가 화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");

		//printModel(model);

		return baseUrl +"/success";
	}
	
	@GetMapping("success1")
	public String success1(HttpServletRequest request,String msg, String mode, @ModelAttribute("jnl14RealAcntMap")Jnl14RealAcntMap jnl14RealAcntMap, Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("실계정맵핑 추가 화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		//printModel(model);
		 Map<String,Object> md = model.asMap();
		    for (Object modelKey : md.keySet()) {
		        Object modelValue = md.get(modelKey);
		        System.out.println(modelKey + " -- " + modelValue);
		    }

		    System.out.println("=== Request data ===");

		    java.util.Enumeration<String> reqEnum = request.getParameterNames();
		    while (reqEnum.hasMoreElements()) {
		        String s = reqEnum.nextElement();
		        System.out.println(s);
		        System.out.println("==" + request.getParameter(s));
		    }		
		model.addAttribute("pageTitle","실계정맵핑 관리");
		model.addAttribute("msg", msg);
		model.addAttribute("mode", mode);
		model.addAttribute("jnl14RealAcntMap", jnl14RealAcntMap);
		return baseUrl +"/success";
	}
}
