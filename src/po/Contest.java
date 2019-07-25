package po;

import java.sql.Date;

public class Contest {
	private int id;
	private String essay;
	private Date fbdate;
	private String sponsor;
	private String contestimg;
	private String title;
	private String contesttitle;
   private String ss;
	
	public String getSs() {
		return ss;
	}
	public void setSs(String ss) {
		this.ss = ss;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEssay() {
		return essay;
	}
	public void setEssay(String essay) {
		this.essay = essay;
	}
	public Date getFbdate() {
		return fbdate;
	}
	public void setFbdate(Date fbdate) {
		this.fbdate = fbdate;
	}
	public String getSponsor() {
		return sponsor;
	}
	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}
	public String getContestimg() {
		return contestimg;
	}
	public void setContestimg(String contestimg) {
		this.contestimg = contestimg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContesttitle() {
		return contesttitle;
	}
	public void setContesttitle(String contesttitle) {
		this.contesttitle = contesttitle;
	}
	

}
