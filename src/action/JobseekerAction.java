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
import service.JobseekerService;

public class JobseekerAction {
	private Jobseeker jobseeker;
	private JobseekerService jobseekerService = null;
	
	//保存图片相关变量
	private File pic;
	private String picContentType;
	private String picFileName;

	
	private  List jobseekers = new ArrayList();
	
	private String checkid;//复选框
	 
	//get/set函数
	public Jobseeker getJobseeker() {
		return jobseeker;
	}
	public void setJobseeker(Jobseeker jobseeker) {
		this.jobseeker = jobseeker;
	}
	public JobseekerService getJobseekerService() {
		return jobseekerService;
	}
	public void setJobseekerService(JobseekerService jobseekerService) {
		this.jobseekerService = jobseekerService;
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
	public List getJobseekers() {
		return jobseekers;
	}
	public void setJobseekers(List jobseekers) {
		this.jobseekers = jobseekers;
	}
	
	
	//复选框结果的get/set
	public String getCheckid() {
		return checkid;
	}
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	
	//保存
	public String Jsave() {
		HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		//保存图片，路径转换
		try {
		String realPath=ServletActionContext.getServletContext().getRealPath("/images");
		
		System.out.println(realPath);
		File file=new File(realPath,picFileName);
		FileUtils.copyFile(pic, file);
		}catch(IOException e) {
			ActionContext.getContext().put("message", "图片上传");
		}
		String username=jobseeker.getUsername();
		jobseekers=jobseekerService.findByUsername(username);
			if (jobseekers!=null && !jobseekers.isEmpty()) {
				session.setAttribute("registerfail", "用户名已存在");
				return "registerfail";
			}
		//保存到类
		jobseeker.setImg(picFileName);
		jobseeker.setType("人才");
		jobseekerService.save(jobseeker);
		return "success";
		}
	public String Jlogin() {
		//获取session
		HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		String username=jobseeker.getUsername();
		String password=jobseeker.getPassword();
		jobseekers=jobseekerService.findByUsername(username);
			
			if (jobseekers!=null && !jobseekers.isEmpty()) {
				jobseeker=(Jobseeker) jobseekers.get(0);
				
				 if(jobseeker.getPassword().equals(password))
				 {
					 session.setAttribute("logina",null);
					 session.setAttribute("admin", jobseeker);
					 session.setAttribute("admintype", jobseeker.getType());
					 session.setAttribute("adminname", jobseeker.getName());
					 session.setAttribute("adminid", jobseeker.getId());
					 session.setAttribute("Jloginfail", "");
					 return "loginsuccess";
				 }
				 else
				 {
					 jobseeker.setPassword("");
					 session.setAttribute("logina", 2);
					 session.setAttribute("Jloginfail", "密码错误");
					 return "loginfail";
				 }
					 
			} 
			else
			{
				session.setAttribute("logina", 2);
				session.setAttribute("Jloginfail", "用户名不存在");
				return "loginfail";
			}
	}
	//查找所有比赛信息
	 public String JfindAll() {
		 jobseekers=jobseekerService.findALL();
		
		if (jobseekers!=null && !jobseekers.isEmpty()) {
			
			return "findallJsuccess";
			}
		return "findallJfail";
	}
	//通过id查找
	 public String Jfindbyid() {
		//获取session
			HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
			HttpSession session=request.getSession();
		 
		  String str=request.getParameter("a"); 
		  System.out.print(str);
	        int id=Integer.parseInt(str);  
	       jobseekers=jobseekerService.findById(id);
	       jobseeker=(Jobseeker) jobseekers.get(0);
	       if(jobseeker.getSex()==1)
	       {
	    	   session.setAttribute("sex", "男");
	       }
	       else{
	    	   session.setAttribute("sex", "女");
	       }
			return "ufsuccess";
	}
	//模糊查找
	 public String JfindbyEverything() {
		String str=jobseeker.getSs();
	       jobseekers=jobseekerService.findByEverything(str);
	    if(jobseekers!=null)
	    {
	    	return "Jfindsuccess";
	    }
	    return "Jfindfail";
	}
	 //复选框删除
	 public String Jdelete() {
		 Jobseeker jobseeker1=new Jobseeker();
			 //利用Struts2的属性驱动得到jsp页面传的ids
			String[] id = getCheckid().split(",");
			int x;
			//String[] 数组转化成Integer 数组
			for(int i=0;i<id.length;i++) {
				//注意去掉空格
				x = Integer.parseInt(id[i].trim());
				
				jobseeker1.setId(x);
				jobseekerService.delete(jobseeker1);
			}
			
			return "dsuccess";
	}
	//修改函数
		public String Jupdate() {
			HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			try {
				String realPath=ServletActionContext.getServletContext().getRealPath("/images");
				
				
				System.out.println(realPath);
				File file=new File(realPath,picFileName);
				FileUtils.copyFile(pic, file);
				}catch(IOException e) {
					ActionContext.getContext().put("message", "图片上传");
				}
			jobseeker.setImg(picFileName);
			session.setAttribute("Jloginfail", "修改成功，请重新登陆");
			session.setAttribute("logina", 2);
			jobseeker.setType("人才");
			jobseekerService.update(jobseeker);
			jobseeker.setPassword("");
						return "usuccess";
						}
	    //因为修改的需要根据id查找
		public String  Jupdatefind() {
			//获取session
			HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			
			
		        int id=(int)session.getAttribute("adminid"); 
		        jobseekers=jobseekerService.findById(id);
		        jobseeker=(Jobseeker) jobseekers.get(0);
				return "ufsuccess";
						}
}
