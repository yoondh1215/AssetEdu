package kr.co.kfs.assetedu.servlet.exception;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kfs.assetedu.servlet.view.JsonView;
import lombok.extern.slf4j.Slf4j;

/**
 * Controller global exception handler
 * AssetJsonException 만 처리함.
 * @author Kim Do Young
 *
 */
@Slf4j
@ControllerAdvice
public class AssetEduControllerAdvice {
	
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss");
	
	@ExceptionHandler(AssetJsonException.class)
    public ModelAndView assetEduException2(AssetJsonException e, HttpServletRequest request) {
		log.debug("************************************************");
		log.debug("ControllerAdvice JSON.");
		log.debug("************************************************");
        
		ModelAndView mav = new ModelAndView(new JsonView());
        mav.addObject("msg", e.getMessage() );
        mav.addObject("status", HttpStatus.INTERNAL_SERVER_ERROR.value());
        mav.addObject("timestamp", sdf.format( System.currentTimeMillis()));
        mav.addObject("error", e.getMessage());
        mav.addObject("path", request.getRequestURL().toString());
        return mav;
    }
}
