package kr.co.kfs.assetedu.model;

import lombok.Data;

/**
 * 
 * 거래코드
 *
 */
@Data
public class Jnl12Tr {
	private String jnl12TrCd; // 거래코드
	private String jnl12TrNm; // 거래명
	private String jnl12InOutType; // 원장입출고구분(BookInOutType)
	private String jnl12InOutTypeNm; // 원장입출고구분(BookInOutType)명
	private String jnl12UsePageType; // 사용화면구분
	private String jnl12UseYn; // 사용여부
}
