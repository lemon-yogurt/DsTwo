package po;

import java.sql.Date;

public class Comment {
	private int id;
	private Date date;
	private String comment;
	private int humanid;
	private String humantype;
	private int questionid;
	private String humanname;
	
	public String getHumanname() {
		return humanname;
	}
	public void setHumanname(String humanname) {
		this.humanname = humanname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getHumanid() {
		return humanid;
	}
	public void setHumanid(int humanid) {
		this.humanid = humanid;
	}
	public String getHumantype() {
		return humantype;
	}
	public void setHumantype(String humantype) {
		this.humantype = humantype;
	}
	public int getQuestionid() {
		return questionid;
	}
	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}
	

}
