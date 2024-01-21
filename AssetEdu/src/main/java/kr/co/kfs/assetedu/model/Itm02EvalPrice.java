package kr.co.kfs.assetedu.model;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.NumberFormat;

import kr.co.kfs.assetedu.servlet.converter.YmdFormat;
import lombok.Data;

/**
 * 종목정보
 *
 */
@Data
public class Itm02EvalPrice {
                     
	@NotBlank(message="종목코드가 존재하지 않습니다.")
	private String itm02ItemCd;     	//종목코드
	
	@YmdFormat
	private String itm02ApplyDate;    	//적용일자                         

	@NumberFormat(pattern = "#,###")
	private Long   itm02ApplyPrice; 	//적용단가                         
	
	private String itm02ItemNm;    		//종목명         
}
