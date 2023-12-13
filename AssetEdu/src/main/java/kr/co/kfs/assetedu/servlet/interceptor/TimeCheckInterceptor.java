package kr.co.kfs.assetedu.servlet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TimeCheckInterceptor implements HandlerInterceptor {
	
	private final static String ATTR_NAME = "timecheck_interceptor_start_time";
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Long startTime = System.currentTimeMillis();
		//log.debug("TimeCheck PreHandler===> Request uri: {} start time : {}", request.getRequestURL().toString(), startTime);
		request.setAttribute(ATTR_NAME, startTime);
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//log.debug("TimeCheck PostHandler===> Request uri: {} current time : {}", request.getRequestURL().toString(), System.currentTimeMillis());
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		Long startTime = (Long) request.getAttribute(ATTR_NAME);
		log.debug("TimeCheck AfterHandler===> Request uri: {} end time : {}, elapse time : {}", request.getRequestURL().toString(), System.currentTimeMillis(), System.currentTimeMillis() - startTime);
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
