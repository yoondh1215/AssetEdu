package kr.co.kfs.assetedu.model;

import kr.co.kfs.assetedu.servlet.converter.YmdFormat;
import lombok.Data;

/**
 * 일자관리 
 * @author Chun Young Im
 *
 */
@Data
public class Com03Date {
	@YmdFormat("-")
	private String 	com03Day 		; //일
	private String 	com03Weekday 	; //요일
	private String 	com03BizYn		; //영업일여부
	private String 	com03Note 		; //비고
}
