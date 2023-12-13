package kr.co.kfs.assetedu.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageCondition extends Condition {
	private static final long serialVersionUID = 1L;
	
	private PageAttr pageAttr;
	
	public PageCondition() {
		this.pageAttr = new PageAttr();
		put("pageAttr", this.pageAttr);
	}
}
