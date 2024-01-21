package kr.co.kfs.assetedu.model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Data;

/**
 * 기관정보
 */
@Data
public class Com01Corp {

	@NotBlank(message="기관코드가 존재하지 않습니다.")
	@Pattern(regexp = "{5}")	//5글자로 제한??
	private String com01CorpCd; //기관코드

	@NotBlank(message="기관구분이 존재하지 않습니다.")
	private String com01CorpType; //기관구분

	@NotBlank(message="기관명이 존재하지 않습니다.")
	private String com01CorpNm; //기관명

	private String com01CorpEnm; //기관영문명
	private String com01ExtnCorpCd; //대외기관코드
	private String com01CorpTypeNm; //기관구분명
}
