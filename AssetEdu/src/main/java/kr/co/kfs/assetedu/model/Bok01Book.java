package kr.co.kfs.assetedu.model;

import lombok.Data;

/***
 * 보유원장
 *
 */
@Data
public class Bok01Book {
	private String	bok01BookId;   //원장ID    
	private String 	bok01HoldDate; //보유일자    
	private String 	bok01FundCd;   //펀드코드    
	private String 	bok01ItemCd;   //종목코드    
	private Long    bok01HoldQty;  //보유수량    
	private Long 	bok01PurAmt;   //취득금액    
	private Long 	bok01BookAmt;  //장부금액    
	private Long 	bok01EvalAmt;  //평가금액    
	private Long	bok01EvalPl;   //평가손익
	private String  bok01EvalYn;   //평가여부
	
	private Long	bok01EvalPrice;	//평가단가
	private String 	bok01EvalYnStr; //평가여부
	private String 	bok01ContId; 	//평가내역ID

	
	/** 펀드정보 */
	private  String fnd01FundCd         ;/** 펀드코드 */                    
	private  String fnd01FundNm         ;/** 펀드명 */                     
	private  String fnd01FundType       ;/** 펀드유형(FundType) */          
	private  String fnd01PublicCd       ;/** 공모/사모코드(PublicCode) */     
	private  String fnd01UnitCd         ;/** 펀드단위코드(FundUnitCode) */    
	private  String fnd01ParentCd       ;/** 모자구분코드(FundParentCode) */  
	private  String fnd01ParentFundCd   ;/** 모펀드코드 */                   
	private  String fnd01StartDate      ;/** 설정일자 */                    
	private  String fnd01EndDate        ;/** 해지일자 */                    
	private  String fnd01AccPeriod      ;/** 회계기간(개월) */                
	private  String fnd01FirstCloseDate ;/** 최초결산일자 */                  
	private  String fnd01CurCd          ;/** 기준통화(CurCode) */           
	private  String fnd01KsdItemCd      ;/** 예탁원종목코드 */                 
	private  String fnd01KofiaCd        ;/** 협회표준코드 */                  
	private  String fnd01KofiaClassCd   ;/** 협회상품분류코드 */               
	private  String fnd01FssCd          ;/** 금감원펀드코드 */                 
	private  String fnd01Manager        ;/** 주운용역 */                    
	private  String fnd01SubManager     ;/** 부운용역 */                    
	private  String fnd01MngCoCd        ;/** 운용사코드 */                   
	private  String fnd01TrustCoCd      ;/** 수탁사코드 */                   
	private  String fnd01OfficeCoCd     ;/** 사무관리사(주)코드 */             
	private  String fnd01SubOfficeCoCd  ;/** 사무관리사(부)코드 */             
    private  String fnd01FundTypeNm     ;/** 펀드유형명 */                   
    private  String fnd01PublicNm       ;/** 공모/사모코드명 */                
    private  String fnd01UnitNm         ;/** 펀드단위코드명 */                 
    private  String fnd01ParentFundNm   ;/** 모펀드명 */                        
    private  String fnd01MngCoNm        ;/** 운용사명 */           
    private  String fnd01TrustCoNm      ;/** 수탁사명 */           
    private  String fnd01OfficeCoNm     ;/** 사무관리사(주)명 */   
    private  String fnd01SubOfficeCoNm  ;/** 사무관리사(부)명 */
    /** 종목정보 */
	private  String itm01ItemCd       ;/** 종목코드*/                        
	private  String itm01ItemNm       ;/** 종목명*/                         
	private  String itm01ItemEnm      ;/** 영문명*/                         
	private  String itm01ShortCd      ;/** 단축코드*/                        
	private  String itm01IssType      ;/** 발행구분(StkIssType:공모/사모)*/      
	private  String itm01StkType      ;/** 증권종류(StkType:보통주/우선주/..)*/    
	private  String itm01ListType     ;/** 상장구분(ListType:상장/비상장/상장폐지)*/  
	private  String itm01MarketType   ;/** 시장구분(MarketType:코스피/코스닥/..)*/ 
	private  String itm01Par          ;/** 액면가*/                         
	private  String itm01IssCoCd      ;/** 발행기관코드*/
    private  String itm01IssTypeNm    ;/** 발행구분명*/      
    private  String itm01StkTypeNm    ;/** 증권종류명*/    
    private  String itm01ListTypeNm   ;/** 상장구분명*/  
    private  String itm01MarketTypeNm ;/** 시장구분명*/ 
    private  String itm01IssCoNm      ;/** 발행기관코드명*/    	
	
}
