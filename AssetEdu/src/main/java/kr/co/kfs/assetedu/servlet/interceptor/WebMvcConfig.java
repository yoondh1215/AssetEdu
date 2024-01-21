package kr.co.kfs.assetedu.servlet.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new TimeCheckInterceptor()).addPathPatterns("/*");
	}
}
