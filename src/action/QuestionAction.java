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

import po.Greenbuild;
import po.Hr;
import po.Jobseeker;
import po.Question;
import po.Student;
import service.QuestionService;

public class QuestionAction {
	private Question question;
	private QuestionService questionService = null;
	
	//保存图片相关变量
	private File pic;
	private String picContentType;
	private String picFileName;
	
	private  List questions = new ArrayList();
	
	private String checkid;//复选框
	 
	//get/set函数
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public QuestionService getQuestionService() {
		return questionService;
	}
	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	//上传图片相关get/set
	public File getPic() {
		return pic;
	}
	public void setPic(File pic) {
		this.pic = pic;
	}
	public String getPicContentType() {
		return picContentType;
	}
	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}
	public String getPicFileName() {
		return picFileName;
	}
	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}
	
	//比赛信息数组的get/set
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
	public String Qsave() {
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
		
		//保存图片，路径转换
		try {
		String realPath=ServletActionContext.getServletContext().getRealPath("/images");
		
		System.out.println(realPath);
		File file=new File(realPath,picFileName);
		FileUtils.copyFile(pic, file);
		}catch(IOException e) {
			ActionContext.getContext().put("message", "图片上传");
		}
		
		
		
		HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		int id=(int)session.getAttribute("adminid");
			question.setHumenid(id);
			question.setHumentype((String)session.getAttribute("admintype"));
		
		
		
		
		
		//保存到类
		
		question.setImg(picFileName);
		question.setDate(dateTime);
		
		questionService.save(question);
		return "success";
		}
	
	//查找所有比赛信息
	 public String QfindAll() {
		 questions=questionService.findALL();
		
		if (questions!=null && !questions.isEmpty()) {
			
			return "findallQsuccess";
			}
		return "findallQfail";
	}
	//通过id查找
	 public void Qfindbyid(int id) {
		 HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
			HttpSession session=request.getSession();
	       System.out.println(id); 
	       questions=questionService.findById(id);
	       question=(Question) questions.get(0);
	       System.out.println(question.getTitle());
	       session.setAttribute("title", question.getTitle());
			session.setAttribute("des", question.getDescribe());
			session.setAttribute("img", question.getImg());
	}
	 //复选框删除
	 public String Qdelete() {
		 Question question1=new Question();
			 //利用Struts2的属性驱动得到jsp页面传的ids
			String[] id = getCheckid().split(",");
			int x;
			//String[] 数组转化成Integer 数组
			for(int i=0;i<id.length;i++) {
				//注意去掉空格
				x = Integer.parseInt(id[i].trim());
				System.out.println(x);
				question1.setId(x);
				questionService.delete(question1);
			}
			
			return "dsuccess";
	 }
	//模糊查找
	 public String QfindbyEverything() {
		String str=question.getSs();
	       questions=questionService.findByEverything(str);
	    if(questions!=null)
	    {
	    	return "Qfindsuccess";
	    }
	    return "Qfindfail";
	}
	//修改函数
	public String Qupdate() {
				questionService.update(question);
							return "usuccess";
							}
	//因为修改的需要根据id查找
	public void  Qupdatefind(int id) {
		 HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
			HttpSession session=request.getSession();
				//  String str=request.getParameter("a");  
			       // int id=Integer.parseInt(str);  
			        
			        questions=questionService.findById(id);
			        question=(Question) questions.get(0);
			        session.setAttribute("title", question.getTitle());
					session.setAttribute("des", question.getDescribe());
					
							}
}
