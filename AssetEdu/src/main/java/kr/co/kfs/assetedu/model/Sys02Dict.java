package kr.co.kfs.assetedu.model;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class Sys02Dict{
	
	@NotNull
	private String sys02DictId;		//용어사전ID

	private String sys02Short;  	//영문약어
	private String sys02Full;  		//영문Full명
	private String sys02KorNm;  	//용어한글명
	private String sys02Note;  		//비고
}
