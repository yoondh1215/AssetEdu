package kr.co.kfs.assetedu.model;

import lombok.Data;

@Data
public class Jnl01Journal {

	//jnl01Journal
		private String 	jnl01ContId;    //체결ID    
		private Integer jnl01Seq;        //순번      
		private String 	jnl01DrAcntCd; //차변계정코드  
		private Long 	jnl01DrAmt;     //차변금액    
		private String 	jnl01CrAcntCd; //대변계정코드  
		private Long 	jnl01CrAmt;     //대변금액

//		private Jnl10Acnt drAcnt; //차변 계정
//		private Jnl10Acnt crAcnt
//		
		private String drAcnt; //차변 계정
		private String crAcnt; //대변 계정
		private Opr01Cont oprCont ;  //운용지시
		private Fnd01Fund fund;   //펀드
		private Itm01Item item;   //item 
		
		//차변계정
		private String drJnl10AcntCd;      //계정코드               
		private String drJnl10AcntNm;      //계정명                
		private String drJnl10ParentCd;    //상위계정코드             
		private String drJnl10AcntAttrCd; //계정속성(AcntAttrCode) 
		private String drJnl10DrcrType;    //차대구분(DrcrType)     
		private String drJnl10SlipYn;      //전표생성여부             
		private String drJnl10UseYn;       //사용여부

		//대변계정
		private String crJnl10AcntCd;      //계정코드               
		private String crJnl10AcntNm;      //계정명                
		private String crJnl10ParentCd;    //상위계정코드             
		private String crJnl10AcntAttrCd; //계정속성(AcntAttrCode) 
		private String crJnl10DrcrType;    //차대구분(DrcrType)     
		private String crJnl10SlipYn;      //전표생성여부             
		private String crJnl10UseYn;       //사용여부
		
		//운용지시
	    private String  opr01ContId;        //체결ID
	    private String  opr01FundCd;        //펀드코드
	    private String  opr01ItemCd;        //종목코드    
	    private String  opr01ContDate;      //체결일자	
	    private String  opr01BookId;        //보유ID
	    private String  opr01TrCd;          //거래코드
	    private String  opr01TrNm;          //거래코드명
	    
	    
	    //펀드
		private String  fnd01FundNm;          /** 펀드명 */
		
		//종목
		private String  itm01ItemNm	;   /**종목명*/
	
	
}
