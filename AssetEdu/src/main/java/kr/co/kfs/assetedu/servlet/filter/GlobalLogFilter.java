package kr.co.kfs.assetedu.servlet.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class GlobalLogFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		ContentCachingRequestWrapper req= new ContentCachingRequestWrapper((HttpServletRequest) request);
		ContentCachingResponseWrapper res = new ContentCachingResponseWrapper((HttpServletResponse) response);
		
		//전처리
		chain.doFilter(req, res);
		
		//후처리 
		//request
		String uri = req.getRequestURI();
		String reqContent = new String(req.getContentAsByteArray());
		log.debug("request uri : {}, request body : {}", uri, reqContent);

		res.copyBodyToResponse();
		
	}

}
