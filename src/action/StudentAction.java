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

import po.Hr;
import po.Question;
import po.Student;
import service.StudentService;

public class StudentAction {
	private Student student;
	private StudentService studentService = null;
	
	//保存图片相关变量
	private File pic;
	private String picContentType;
	private String picFileName;
	
	private  List students = new ArrayList();
	
	private String checkid;//复选框
	 
	//get/set函数
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public StudentService getStudentService() {
		return studentService;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
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
	public List getStudents() {
		return students;
	}
	public void setStudents(List students) {
		this.students = students;
	}
	
	//复选框结果的get/set
	public String getCheckid() {
		return checkid;
	}
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	
	//保存
	public String Stsave() {
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
		//判断是否已存在
		String username=student.getUsername();
		students=studentService.findByUsername(username);
			if (students!=null && !students.isEmpty()) {
				session.setAttribute("registerfail", "用户名已存在");
				return "registerfail";
			}
		//保存到类
		student.setImg(picFileName);
		student.setType("学生");
		
		studentService.save(student);
		return "success";
		}
	public String Stlogin() {
		//获取session
		HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		String username=student.getUsername();
		String password=student.getPassword();
		students=studentService.findByUsername(username);
			
			if (students!=null && !students.isEmpty()) {
				student=(Student) students.get(0);
				
				 if(student.getPassword().equals(password))
				 {
					 session.setAttribute("logina", null);
					 session.setAttribute("admin", student);
					 session.setAttribute("admintype", student.getType());
					 session.setAttribute("adminname", student.getName());
					 session.setAttribute("adminid", student.getId());
					 session.setAttribute("Sloginfail", "");
					 return "loginsuccess";
				 }
				 else
				 {
					 student.setPassword("");
					 session.setAttribute("logina", 4);
					 session.setAttribute("Sloginfail", "密码错误");
					 return "loginfail";
				 }
					 
			} 
			else
			{
				session.setAttribute("logina", 4);
				session.setAttribute("Sloginfail", "用户名不存在");
				return "loginfail";
			}
	}
	//查找所有比赛信息
	 public String StfindAll() {
		 students=studentService.findALL();
		
		if (students!=null && !students.isEmpty()) {
			
			return "findallSsuccess";
			}
		return "findallSfail";
	}
	 
	 //复选框删除
	 public String Stdelete() {
		 Student student1=new Student();
			 //利用Struts2的属性驱动得到jsp页面传的ids
			String[] id = getCheckid().split(",");
			int x;
			//String[] 数组转化成Integer 数组
			for(int i=0;i<id.length;i++) {
				//注意去掉空格
				x = Integer.parseInt(id[i].trim());
				System.out.println(x);
				student1.setId(x);
				studentService.delete(student1);
			}
			
			return "dsuccess";
	}
	//修改函数
		public String Stupdate() {
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
			student.setType("学生");
			student.setImg(picFileName);
			session.setAttribute("Sloginfail", "修改成功，请重新登陆");
			session.setAttribute("logina", 4);
			studentService.update(student);
			student.setPassword("");
								return "usuccess";
								}
		//因为修改的需要根据id查找
		public String  Stupdatefind() {
			//获取session
			HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			
			
		        int id=(int)session.getAttribute("adminid"); 
				        
				        students=studentService.findById(id);
				        student=(Student) students.get(0);
						return "ufsuccess";
								}

}
