package kr.co.kfs.assetedu.servlet.converter;

import java.util.HashSet;
import java.util.Set;

import org.springframework.format.AnnotationFormatterFactory;
import org.springframework.format.Parser;
import org.springframework.format.Printer;

/**
 * YmdFormat의 Factory
 * @author Kim Do Young
 *
 */
public class YmdAnnotationFormatterFactory implements AnnotationFormatterFactory<YmdFormat> {

	@Override
	public Set<Class<?>> getFieldTypes() {
		 Set<Class<?>> setTypes = new HashSet<Class<?>>();
		    setTypes.add(String.class);
		    return setTypes;
	}

	@Override
	public Printer<?> getPrinter(YmdFormat annotation, Class<?> fieldType) {
		YmdFormatter ymdFormatter =  new YmdFormatter();
		ymdFormatter.setGubun(annotation.value());
		return ymdFormatter;
	}

	@Override
	public Parser<?> getParser(YmdFormat annotation, Class<?> fieldType) {
		return new YmdFormatter();
	}
}
