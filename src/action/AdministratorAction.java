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

import po.Administrator;
import service.AdministratorService;

public class AdministratorAction {
	private Administrator administrator;
	private AdministratorService administratorService = null;
	
	//保存图片相关变量
	private File pic;
	private String picContentType;
	private String picFileName;
	
	private  List administrators = new ArrayList();
	
	//复选框
	private String checkid;
	 
	//get/set函数
	public Administrator getAdministrator() {
		return administrator;
	}
	public void setAdministrator(Administrator administrator) {
		this.administrator = administrator;
	}
	public AdministratorService getAdministratorService() {
		return administratorService;
	}
	public void setAdministratorService(AdministratorService administratorService) {
		this.administratorService = administratorService;
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
	public List getAdministrators() {
		return administrators;
	}
	public void setAdministrators(List administrators) {
		this.administrators = administrators;
	}
	
	//复选框结果的get/set
	public String getCheckid() {
		return checkid;
	}	
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	
	//保存
	public String Asave() {
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
		
		String username=administrator.getUsername();
		administrators=administratorService.findByUsername(username);
			
			if (administrators!=null && !administrators.isEmpty()) {
				session.setAttribute("registerfail", "用户名已存在");
				return "registerfail";
			}
		
		//保存到类
		administrator.setImg(picFileName);
		administrator.setType("管理员");
		
		administratorService.save(administrator);
		return "success";
		}
	//登陆
	public String Alogin() {
		//获取session
		HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		String username=administrator.getUsername();
		String password=administrator.getPassword();
		administrators=administratorService.findByUsername(username);
			
			if (administrators!=null && !administrators.isEmpty()) {
				 administrator=(Administrator) administrators.get(0);
				
				 if(administrator.getPassword().equals(password))
				 {
					 session.setAttribute("logina", null);
					 session.setAttribute("admin", administrator);
					 session.setAttribute("admintype", administrator.getType());
					 session.setAttribute("adminname", administrator.getUsername());
					 session.setAttribute("adminid", administrator.getId());
					 session.setAttribute("Aloginfail", "");
					 return "loginsuccess";
				 }
				 else
				 {
					 administrator.setPassword("");
					 session.setAttribute("logina", 1);
					 session.setAttribute("Aloginfail", "密码错误");
					 return "loginfail";
				 }
					 
			} 
			else
			{
				session.setAttribute("logina", 1);
				session.setAttribute("Aloginfail", "用户名不存在");
				return "loginfail";
			}
	}
	//查找所有比赛信息
	 public String AfindAll() {
		 administrators=administratorService.findALL();
		
		if (administrators!=null && !administrators.isEmpty()) {
			
			return "findallAsuccess";
			}
		return "findallAfail";
	}
	 
	 //复选框删除
	 public String Adelete() {
		 Administrator administrator1=new Administrator();
			 //利用Struts2的属性驱动得到jsp页面传的ids
			String[] id = getCheckid().split(",");
			int x;
			//String[] 数组转化成Integer 数组
			for(int i=0;i<id.length;i++) {
				//注意去掉空格
				x = Integer.parseInt(id[i].trim());
				
				administrator1.setId(x);
				administratorService.delete(administrator1);
			}
			
			return "dsuccess";
	}
	//修改函数
		public String Aupdate() {
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
			administrator.setType("管理员");
			administrator.setImg(picFileName);
			session.setAttribute("Aloginfail", "修改成功，请重新登陆");
			session.setAttribute("logina", 1);
			administratorService.update(administrator);
			administrator.setPassword("");
			return "usuccess";
			}
	//因为修改的需要根据id查找
	public String  Aupdatefind() {
		//获取session
				HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
				HttpSession session=request.getSession();
				
				
			        int id=(int)session.getAttribute("adminid");  
			        
			        administrators=administratorService.findById(id);
			        administrator=(Administrator) administrators.get(0);
					return "ufsuccess";
			}
}
