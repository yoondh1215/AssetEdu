package kr.co.kfs.assetedu.servlet.validation;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CorrectDateYmdValidation implements ConstraintValidator<CorrectDateYmd, String>{

	@Override
	public boolean isValid(String ymd, ConstraintValidatorContext context) {
		if (ymd == null) {
		      return false;
		}

		boolean result = ymd.matches("\\d{8}");
		if(result) {
			try {
				SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
				dtFormat.parse(ymd);
				result = true;
			}catch (ParseException e) {
				result = false;
			}
		}
		return result;
	}


}
