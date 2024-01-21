package kr.co.kfs.assetedu.model;

import lombok.Data;

/**
 * 
 * 거래별 분개맵핑
 *
 */
@Data
public class Jnl13TrMap {
	private String jnl13TrCd;
	private String jnl13TrNm;
	private Integer jnl13Seq;
	private String jnl13ReprAcntCd;
	private String jnl13DrcrType;
	private String jnl13DrcrTypeNm;
	private String jnl13Formula;
	private String jnl11ReprAcntNm;
}
