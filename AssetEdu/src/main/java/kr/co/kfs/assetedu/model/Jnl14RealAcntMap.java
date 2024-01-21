package kr.co.kfs.assetedu.model;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

/**
 * 
 * 실계정맵핑
 *
 */
@Data
public class Jnl14RealAcntMap {
	
	
	@NotEmpty(message = "대표계정코드는 비어 있을 수 없습니다") 
	private String jnl14ReprAcntCd;
	private String jnl14ReprAcntNm;
	@NotEmpty(message = "상장구분는 비어 있을 수 없습니다")  
	private String jnl14ListType;
	
	private String jnl14ListTypeNm;
	
	@NotEmpty(message = "시장구분은 비어 있을 수 없습니다")  
	private String jnl14MarketType;
	
	private String jnl14MarketTypeNm;
	private String jnl14RealAcntCd;
	private String jnl14RealAcntNm;

	
	private String jnl14ReprAcntCdOld;
	private String jnl14ListTypeOld;
	private String jnl14MarketTypeOld;
	
}
