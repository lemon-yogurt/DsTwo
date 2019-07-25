package po;

import java.sql.Date;

public class Question {
	private int id;
	private String title;
	private String describe;
	private int humenid;
	private String humentype;
	private Date date;
    private String img;
   private String ss;
	
	public String getSs() {
		return ss;
	}
	public void setSs(String ss) {
		this.ss = ss;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public int getHumenid() {
		return humenid;
	}
	public void setHumenid(int humenid) {
		this.humenid = humenid;
	}
	public String getHumentype() {
		return humentype;
	}
	public void setHumentype(String humentype) {
		this.humentype = humentype;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
