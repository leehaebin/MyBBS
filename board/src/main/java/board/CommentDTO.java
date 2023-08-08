package board;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class CommentDTO {
		
	private int num;
	private int bbsnum;
	private String userid;
	private String username;
	private String comment;
	private String uip;
	private String wdate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBbsnum() {
		return bbsnum;
	}
	public void setBbsnum(int bbsnum) {
		this.bbsnum = bbsnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getUip() {
		return uip;
	}
	public void setUip() {
		String uip = null;
		try {
			uip = Inet4Address.getLocalHost().getHostAddress();
		}catch (UnknownHostException e) {
			e.printStackTrace();
		}
		this.uip = uip;
	}
	public void setUip(String uip) {
		this.uip = uip;
	}
	public String getWdate() {
		return wdate;
	}
	
	public void setWdate() {
		Date today = new Date();
		Locale currentLocale = new Locale("KOREAN", "KOREA");
		String pattern = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat formatter = new SimpleDateFormat(pattern, currentLocale);
		this.wdate = formatter.format(today);
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	
}
