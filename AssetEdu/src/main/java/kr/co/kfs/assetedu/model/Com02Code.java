package kr.co.kfs.assetedu.model;

import javax.validation.constraints.NotBlank;

import lombok.Data;

/**
 * 공통코드 
 * @author Kim Do Young
 *
 */
@Data
public class Com02Code {
	
	@NotBlank(message="공통코드가 존재하지 않습니다.")
	private String 	com02ComCd ; //공통코드

	@NotBlank(message="세부코드가 존재하지 않습니다.")
	private String 	com02DtlCd ; //세부코드
	
	@NotBlank(message="코드명이 존재하지 않습니다.")
	private String 	com02CodeNm ; //코드명
	
	@NotBlank(message="코드구분이 존재하지 않습니다.")
	private String 	com02CodeType ; //코드구분(C/D)

	private Integer com02Seq ; //순번
	private String 	com02UseYn ; //사용여부
	private String 	com02Note ; //비고
}
