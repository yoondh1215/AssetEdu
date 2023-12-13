package kr.co.kfs.assetedu.servlet.converter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 * YmdFormat의 구현
 * 
 * @author Kim Do Young
 *
 */
@Slf4j
public class YmdFormatter implements Formatter<String> {

	@Getter
	@Setter
	private String gubun;
	
	@Override
	public String print(String s, Locale locale) {
		if(s == null) return "";
		s = s.trim();
		if(s.length() == 8) {
			log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
			log.debug("s: {}",s );
			log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");

			return s.substring(0,4) + gubun + s.substring(4,6) + gubun + s.substring(6);
		}else {
			return s;
		}
	}

	@Override
	public String parse(String text, Locale locale) throws ParseException {
		if(text == null || text.length() < 1) return null;
		return text.replaceAll("\\D", "");
	}
}
