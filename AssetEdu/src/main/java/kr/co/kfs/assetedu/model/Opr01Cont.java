package kr.co.kfs.assetedu.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.NumberFormat;

import kr.co.kfs.assetedu.servlet.converter.YmdFormat;
//import kr.co.kfs.assetedu.servlet.validation.ContSettleDate;
import lombok.Data;

/**
 *
 * 운용지시
 *
 */
@Data
//@ContSettleDate(message= "결제일자는 체결일자보다 같거나 미래여야합니다")
public class Opr01Cont {
	
    private String  opr01ContId;        //체결ID

    @NotBlank(message="펀드코드가 존재하지 않습니다.")
    private String  opr01FundCd;        //펀드코드

    @NotBlank(message="종목코드가 존재하지 않습니다.")
    private String  opr01ItemCd;        //종목코드
    
    @YmdFormat
    @NotBlank(message="체결일자가 존재하지 않습니다.")
    private String  opr01ContDate;      //체결일자
    
    @NotBlank(message="거래코드가 존재하지 않습니다.")
    private String  opr01TrCd;          //거래코드(TrCode)
    
    @NumberFormat(pattern = "#,###")
    @Min(value=0, message="수량은 0 이상이어야 합니다.")
    private Long    opr01Qty;           //수량

    @NumberFormat(pattern = "#,###")
    private Long    opr01Price;         //단가

    @NumberFormat(pattern = "#,###")
    private Long    opr01ContAmt;       //체결금액

    @NumberFormat(pattern = "#,###")
    private Long    opr01TrPl;          //매매손익

    @NumberFormat(pattern = "#,###")
    private Long    opr01Fee;           //수수료

    @NumberFormat(pattern = "#,###")
    private Long    opr01Tax;           //제세금

    @NumberFormat(pattern = "#,###")
    private Long    opr01SettleAmt;     //결제금액

    @YmdFormat
    private String  opr01SettleDate;    //결제일자
    
    @NotBlank(message="매매처코드가 존재하지 않습니다.")
    private String  opr01TrCoCd;        //매매처코드
    
    private String  opr01BookId;        //보유ID
    
    @NumberFormat(pattern = "#,###")
    private Long    opr01BookAmt;       //장부금액
    
    private String  opr01StatusCd;      //상태코드(TrStatusCode)

    private String  opr01FundNm;        //펀드명
    private String  opr01ItemNm;        //종목명
    private String  opr01TrNm;          //거래명
    private String  opr01TrCoNm;        //매매처명
    private String  opr01BizDate;		//영업일자

    @NumberFormat(pattern = "#,###")
    private Long    opr01HoldQty;       //보유수량
}
