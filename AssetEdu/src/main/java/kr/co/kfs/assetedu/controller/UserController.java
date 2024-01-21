package kr.co.kfs.assetedu.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kfs.assetedu.model.PageAttr;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.model.Sys01User;
import kr.co.kfs.assetedu.service.Sys01UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/user")
public class UserController {

	@Autowired
	private Sys01UserService service;
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@GetMapping("list")
	public String list(String searchText, Model model, @RequestParam(value="currentPageNo", required=false, defaultValue="1") Integer currentPageNo) {
		log.debug("===================================");
		log.debug("사용자리스트");
		log.debug("===================================");
		
		QueryAttr queryAttr = new QueryAttr();
		queryAttr.put("searchText", searchText);
		Integer totalCountInteger = service.selectCount(queryAttr);
		int pageSize = 10;
		
		int currentPageNumber = currentPageNo;
		Integer startCount = (currentPageNumber - 1) * pageSize +1;
		Long totalCount = Long.valueOf(totalCountInteger);
		PageAttr pageAttr = new PageAttr(totalCount, pageSize, currentPageNumber);
		log.debug("pageAttr:{}", pageAttr);
		queryAttr.put("pageAttr", pageAttr);
		
		
		
		List<Sys01User> list = service.selectList(queryAttr);
		model.addAttribute("list", list);
		model.addAttribute("pageAttr",pageAttr);
		model.addAttribute("startCount",startCount);
		return "/admin/user/list";
	}

	@GetMapping("insert")
	public String insert(Model model) {
		log.debug("===================================");
		log.debug("사용자 추가");
		log.debug("===================================");
		model.addAttribute("pageTitle","사용자추가");
		model.addAttribute("user", new Sys01User());
		return "/admin/user/insert_form";
	}
	
	@PostMapping("insert")
	public String inseret(@Valid @ModelAttribute Sys01User user, RedirectAttributes redirectAttr) {
		log.debug("===================================");
		log.debug("사용자 정보 저장하고 리스트로 이동");
		log.debug("===================================");
		String pwd = user.getSys01Pwd();
		user.setSys01Pwd(passwordEncoder.encode(pwd));
		
		int affectedCount = service.insert(user);
		log.debug("DB에 적용된 갯수 : {}", affectedCount);
		
		String msg = String.format("사용자 %s 님이 추가되었습니다", user.getSys01UserNm());
		redirectAttr.addAttribute("mode", "insert");
		redirectAttr.addAttribute("msg",msg);
		return "redirect:/admin/user/success";
	}
		
	
	@GetMapping("success")
	public String success(String msg, String mode, String userId, Model model) {
		model.addAttribute("pageTitle", "사용자추가");
		model.addAttribute("msg", msg);
		model.addAttribute("mode",mode);
		model.addAttribute("userId", userId);
		log.debug("===================================");
		log.debug("사용자 추가 확인");
		log.debug("===================================");
		return "/admin/user/success";
	}

	
	@GetMapping("update")
	public String update(String sys01UserId, Model model) {
		Sys01User user = new Sys01User();
		user.setSys01UserId(sys01UserId);
		user = service.selectOne(user);
		model.addAttribute("user",user);
		return "/admin/user/update";
	}
	
	@PostMapping("update")
	public String update(Sys01User user, Model model) {
		int i = service.update(user);
		model.addAttribute("userId", user.getSys01UserId());
		return "redirect:/admin/user/list";
	}
	
	
	
	@GetMapping("delete")
	public String delete(String sys01UserId) {
		Sys01User user = new Sys01User();
		user.setSys01UserId(sys01UserId);
		service.delete(user);
		return "redirect:/admin/user/list";
	}
	
	
	}
	


