package kr.co.kfs.assetedu.servlet.converter;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.stereotype.Indexed;

/**
 * model의 필드에   @YmdFormat("-") 와 같이 사용가능
 * 표현은 yyyy-MM-dd로 하고 값을 받을 때는 yyyyMMdd로 받는다
 * @author Kim Do Young
 *
 */
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Indexed
public @interface YmdFormat {
	String value() default "-";
}
