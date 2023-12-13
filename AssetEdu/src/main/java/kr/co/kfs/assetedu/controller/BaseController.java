package kr.co.kfs.assetedu.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * Controller에서의 유틸리티함수 및 디버깅함수를 갖는 상위Controller
 *  
 * @author KOREA 
 *
 */
@Slf4j
public class BaseController {
	
	protected void printModel(Model model) {
		Map<String, Object> md = model.asMap();
		log.debug("----------------[ Model ]---------------------");
		for (Object modelKey : md.keySet()) {
			Object modelValue = md.get(modelKey);
			log.debug("{} : [{}]",modelKey, modelValue);
		}
		log.debug("--------------------------------------------");
	}
	protected void printParameters(HttpServletRequest request) {
		log.debug("----------------[ Parameters ]--------------------");	
	    java.util.Enumeration<String> reqEnum = request.getParameterNames();
	    String s = null;
	    while (reqEnum.hasMoreElements()) {
	    	s = reqEnum.nextElement();
	    	log.debug("{} : [{}]",s,request.getParameter(s));
	    }	
	}
}
