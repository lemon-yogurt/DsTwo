package action;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import po.Comment;
import po.Greenbuild;
import po.Question;
import service.CommentService;
import service.QuestionService;

public class CommentAction {
	private Comment comment;
	private CommentService commentService = null;
	private QuestionService questionService = null;
	
	private  List comments = new ArrayList();
	private  List questions = new ArrayList();
	
	private String checkid;//复选框
	 
	//get/set函数
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public CommentService getCommentService() {
		return commentService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	
	
	public QuestionService getQuestionService() {
		return questionService;
	}
	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}
	//比赛信息数组的get/set
	public List getComments() {
		return comments;
	}
	public void setComments(List comments) {
		this.comments = comments;
	}
	
	public List getQuestions() {
		return questions;
	}
	public void setQuestions(List questions) {
		this.questions = questions;
	}
	
	//复选框结果的get/set
	public String getCheckid() {
		return checkid;
	}	
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	
	//保存
	public String Cmsave() {
		 //获取系统的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String time = sdf.format(new java.util.Date());
		java.util.Date timeDate = null;
		try{
		timeDate = sdf.parse(time);
		} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		java.sql.Date dateTime = new java.sql.Date(timeDate.getTime());
		
		
		
		HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		int id=(int)session.getAttribute("adminid");
			comment.setHumanid(id);
			comment.setHumantype((String)session.getAttribute("admintype"));
			comment.setQuestionid((int)session.getAttribute("quesid"));
		    comment.setHumanname((String)session.getAttribute("adminname"));
		//保存到类
		comment.setDate(dateTime);
		
		commentService.save(comment);
		return "success";
		}
	
	//查找所有比赛信息
	 public String CmfindAll() {
		 comments=commentService.findALL();
		
		if (comments!=null && !comments.isEmpty()) {
			
			return "findallCmsuccess";
			}
		return "findallCmfail";
	}
	 //查找问题的评论
	 public String  Cfindbyqid() {
			
		 HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			String str=request.getParameter("a");  
	        int id=Integer.parseInt(str);  
	        
			 
			 comments=commentService.findById(id);
		        
			 Question question=new Question();
			 questions=questionService.findById(id);
		        question=(Question) questions.get(0);
		        session.setAttribute("quesid", question.getId());
		        session.setAttribute("title", question.getTitle());
				session.setAttribute("des", question.getDescribe());
				session.setAttribute("img", question.getImg());
				
				return "ufsuccess";
		}
	 //复选框删除
	 public String Cmdelete() {
		 HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			String str=request.getParameter("a");  
	        int id=Integer.parseInt(str);  
	        System.out.println(id);
				Comment comment1=new Comment();
				comment1.setId(id);
				commentService.delete(comment1);
			
			
			return "dsuccess";
	}
	//修改函数
		public String Cmupdate() {
			commentService.update(comment);
			return "usuccess";
			}
	//因为修改的需要根据id查找
	public String  Cmupdatefind() {
				
				HttpServletRequest request = ServletActionContext.getRequest();
				  String str=request.getParameter("a");  
			        int id=Integer.parseInt(str);  
			        
			        comments=commentService.findById(id);
			        comment=(Comment) comments.get(0);
					return "ufsuccess";
			}
}
