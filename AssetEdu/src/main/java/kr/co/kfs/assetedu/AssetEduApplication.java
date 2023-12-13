package kr.co.kfs.assetedu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.kfs.assetedu.servlet.converter.YmdAnnotationFormatterFactory;



@SpringBootApplication
@ComponentScan(basePackages = "kr.co.kfs.assetedu")
@EnableAutoConfiguration
@MapperScan(basePackageClasses = AssetEduApplication.class)
public class AssetEduApplication {

	public static void main(String[] args) {
		SpringApplication.run(AssetEduApplication.class, args);
	}
	/**
	 * Ymd Formatter 추가
	 * @author Kim Do Young
	 *
	 */
	@Configuration
    static class MyConfig implements WebMvcConfigurer{
        @Override
        public void addFormatters(FormatterRegistry registry) {
            registry.addFormatterForFieldAnnotation(new YmdAnnotationFormatterFactory()); 
        }
    }
}
