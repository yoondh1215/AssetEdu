package kr.co.kfs.assetedu.model;

import lombok.Data;

/**
 * 임시분개장
 *
 */
@Data
public class Jnl02JournalTmp {
	//jnl02JournalTmp
	private String 	jnl02ContId;    	//체결ID    
	private Integer jnl02Seq;       	//순번      
	private String 	jnl02DrcrType;  	//차대구분  
	private String 	jnl02ReprAcntCd;	//대표계정코드    
	private Long 	jnl02Amt;     		//금액
}
