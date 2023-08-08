package board;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class BBSDTO {
	
	private int bbsnum;
	private String title;
	private String userid;
	private String username;
	private String content;
	private int count;
	private String wdate;
	private String uip;
	
	
	public int getBbsnum() {
		return bbsnum;
	}

	public void setBbsnum(int bbsnum) {
		this.bbsnum = bbsnum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
	
	
	
}
