package kr.co.kfs.assetedu.model;

import lombok.Data;

@Data
public class Jnl10Acnt {

	String jnl10AcntCd; //계정 코드
	String jnl10AcntNm; //계정 이름
	String jnl10ParentCd; //상위계정 코드
	String jnl10ParentNm;    //상위계정코드명   
	String jnl10AcntAttrCd; //계정속성
	
	//계정속성명은 코드에서 가져옴
	String jnl10AcntAttrNm;
	
	String jnl10DrcrType; //차대구분
	
	// 차대구문 명도 코드에서 가져옴
	String jnl10DrcrTypeNm;
	
	String jnl10SlipYn; //전표생성여부
	String jnl10UseYn;	//사용여부

	
}
