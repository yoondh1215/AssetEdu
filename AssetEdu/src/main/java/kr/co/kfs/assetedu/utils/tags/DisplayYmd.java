package kr.co.kfs.assetedu.utils.tags;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class DisplayYmd extends SimpleTagSupport  {

	
	private String ymd;
	private String seperator = "-";
	
	public String getYmd() {
		return ymd;
	}
	

	public void setYmd(String ymd) {
		if(ymd != null) {
			this.ymd = ymd.replaceAll("[^0-9]", "");
		}
	}
	public void setSeperator(String seperator) {
		this.seperator = seperator;
	}
	

	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		String s = "";
		if(ymd.length() >= 8) {
			s = ymd.substring(0,4) + seperator + ymd.substring(4,6)+seperator + ymd.substring(6);
		}
		out.print(s);
	}
}
