package kr.co.kfs.assetedu.model;

import org.springframework.format.annotation.NumberFormat;

import lombok.Data;
@Data
public class Itm01Item {

	
	private String itm01ItemCd;     //종목코드                        
	private String itm01ItemNm;     //종목명                         
	private String itm01ItemEnm;    //영문명                         
	private String itm01ShortCd;    //단축코드                        
	private String itm01IssType;    //발행구분(IssType:공모/사모)         
	private String itm01StkType;    //증권종류(StkType:보통주/우선주/..)    
	private String itm01ListType;   //상장구분(ListType:상장/비상장/상장폐지)  
	private String itm01MarketType; //시장구분(MarketType:코스피/코스닥/..) 

	@NumberFormat(pattern = "#,###")
	private Long   itm01Par;         //액면가                         

	private String itm01IssCoCd;   //발행기관코드
	
	//이상으로 itm01_item 테이블 정보
	//이하는 sql function/procedure 로 가져옴.
	
	private String itm01IssTypeNm;    //발행구분명         
	private String itm01StkTypeNm;    //증권종류명    
	private String itm01ListTypeNm;   //상장구분명  
	private String itm01MarketTypeNm; //시장구분명 
	private String itm01IssCoNm;   	  //발행기관명
	
	
}
