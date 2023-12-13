package kr.co.kfs.assetedu.servlet.validation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

/**
 * yyyyMMdd 문자열이 정확한 날짜인지 체크
 * 
 * @author Kim Do Young
 *
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = CorrectDateYmdValidation.class)
public @interface CorrectDateYmd {
	String message() default "올바른 날짜가 아닙니다";
	Class<?>[] groups() default{};
	public abstract Class<? extends Payload>[] payload() default{};
}
