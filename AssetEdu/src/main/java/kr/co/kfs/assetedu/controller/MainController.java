package kr.co.kfs.assetedu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kfs.assetedu.AssetEduConfig;
import kr.co.kfs.assetedu.servlet.security.UserPrincipal;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class MainController {

	private AssetEduConfig assetEduConfig;
//	private Opr01ContService contService;
	
//	public MainController(AssetEduConfig assetEduConfig, Opr01ContService contService ) {
	public MainController(AssetEduConfig assetEduConfig ) {
		this.assetEduConfig = assetEduConfig;
//		this.contService = contService;
	}
	
	public String home() {
		//return "index";
		 return "redirect:" + "login";
	}
	
	@GetMapping("/main")
	public String  main(Authentication authentication, Model model) throws Exception {
		UserPrincipal userDetails = (UserPrincipal) authentication.getPrincipal();
		log.debug("{} 로그인 됨", userDetails.getUsername());
		
		//보유원장 이월처리(보통 업무개시때 발생시킴)
//		Opr01Cont cont = new Opr01Cont();
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
//		cont.setOpr01ContDate(transFormat.format(new Date())); 
//		
//		String resultMsg = contService.procMain("A", cont);
//		log.debug("resultMsg:{}", resultMsg);
		
		model.addAttribute("title", assetEduConfig.getTitle());
		model.addAttribute("gitSourceUrl", assetEduConfig.getGitSourceUrl());
		log.debug("title:{}", assetEduConfig.getTitle());
		return "main";
	}
	
	@GetMapping("/login")
	public String  login(HttpServletRequest request) {
		if( request.getSession() != null && request.getSession().getAttribute("userId") != null) {
			return "redirect:/main";	
		}
		return "login";
	}	

//	@GetMapping("/logout")
//	public String  logout() {
//		log.debug("====================> logout");
//		return "main";
//	}	
	
}
