package kr.co.kfs.assetedu.controller;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.web.servlet.error.AbstractErrorController;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kfs.assetedu.servlet.exception.AssetException;
import kr.co.kfs.assetedu.servlet.view.JsonView;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustomErrorController extends AbstractErrorController {

	public CustomErrorController(ErrorAttributes errorAttributes) {
		super(errorAttributes);
	}
	private boolean isAjax(HttpServletRequest request) {
	    String requestedWithHeader = request.getHeader("X-Requested-With");
	    return "XMLHttpRequest".equals(requestedWithHeader);
	}
	@RequestMapping("/error")
	public ModelAndView error(HttpServletRequest request, Model model) {
		
		ModelAndView mav = null ;
		if(isAjax(request)) {
			System.out.println("이것은 ajax request...................");
			mav = new ModelAndView(new JsonView());
		}else {
			mav = new ModelAndView("error");
		}
		
		String msg = null;
		Exception e = (Exception) request.getAttribute(RequestDispatcher.ERROR_EXCEPTION);
		if(e != null && e.getCause() instanceof AssetException) {
			msg = e.getMessage();
			msg = msg.substring(msg.lastIndexOf(":")+1);
		}
			
        ErrorAttributeOptions options = ErrorAttributeOptions
        	    .defaults()
        	    .including(ErrorAttributeOptions.Include.STACK_TRACE)
        	;
        Map<String, Object> errorAttributes = getErrorAttributes(request, options);
        log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		errorAttributes.forEach((attribute, value) -> {			
			log.debug("attribute : {}, value:{}", attribute, value);
		});

		mav.addObject("timestamp", errorAttributes.get("timestamp"));
		mav.addObject("status", errorAttributes.get("status"));
		mav.addObject("error", errorAttributes.get("error"));
		mav.addObject("path", errorAttributes.get("path"));
		mav.addObject("trace", errorAttributes.get("trace"));
		mav.addObject("msg", msg);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
        
		return mav;
		
	}
}
