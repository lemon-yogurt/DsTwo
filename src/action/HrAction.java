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
import po.Employment;
import po.Hr;
import service.HrService;

public class HrAction {
	private Hr hr;
	private HrService hrService = null;
	
	//保存图片相关变量
	private File pic;
	private String picContentType;
	private String picFileName;
	
	private  List hrs = new ArrayList();
	
	private String checkid;//复选框
	 
	//get/set函数
	public Hr getHr() {
		return hr;
	}
	public void setHr(Hr hr) {
		this.hr = hr;
	}
	public HrService getHrService() {
		return hrService;
	}
	public void setHrService(HrService hrService) {
		this.hrService = hrService;
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
	public List getHrs() {
		return hrs;
	}
	public void setHrs(List hrs) {
		this.hrs = hrs;
	}
	//复选框结果的get/set
	public String getCheckid() {
		return checkid;
	}
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	
	//保存
	public String Hsave() {
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
		String username=hr.getUsername();
		hrs=hrService.findByUsername(username);
			if (hrs!=null && !hrs.isEmpty()) {
				session.setAttribute("registerfail", "用户名已存在");
				return "registerfail";
			}
			else {
		//保存到类
		hr.setImg(picFileName);
		hr.setType("hr");
		hrService.save(hr);
		return "success";}
		}
	
	//查找所有比赛信息
	 public String HfindAll() {
		hrs=hrService.findALL();
		
		if (hrs!=null && !hrs.isEmpty()) {
			
			return "findallHsuccess";
			}
		return "findallHfail";
	}
	//登陆
		public String Hlogin() {
			//获取session
			HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			
			String username=hr.getUsername();
			String password=hr.getPassword();
			hrs=hrService.findByUsername(username);
				
				if (hrs!=null && !hrs.isEmpty()) {
					 hr=(Hr) hrs.get(0);
					
					 if(hr.getPassword().equals(password))
					 {
						 session.setAttribute("logina", null);
						 session.setAttribute("admin", hr);
						 session.setAttribute("admintype", hr.getType());
						 session.setAttribute("adminname", hr.getName());
						 session.setAttribute("hrid", hr.getId());
						 session.setAttribute("adminid", hr.getId());
						 session.setAttribute("Hloginfail", "");
						 return "loginsuccess";
					 }
					 else
					 {
						 hr.setPassword("");
						 session.setAttribute("logina", 3);
						 session.setAttribute("Hloginfail", "密码错误");
						 return "loginfail";
					 }
						 
				} 
				else
				{
					
					session.setAttribute("logina", 3);
					session.setAttribute("Hloginfail", "用户名不存在");
					return "loginfail";
				}
		}
	 //复选框删除
	 public String Hdelete() {
			Hr hr1=new Hr();
			 //利用Struts2的属性驱动得到jsp页面传的ids
			String[] id = getCheckid().split(",");
			int x;
			//String[] 数组转化成Integer 数组
			for(int i=0;i<id.length;i++) {
				//注意去掉空格
				x = Integer.parseInt(id[i].trim());
				System.out.println(x);
				hr1.setId(x);
				hrService.delete(hr1);
			}
			
			return "dsuccess";
	}
	//修改函数
	public String Hupdate() {
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
		hr.setImg(picFileName);
		hr.setType("hr");
			hrService.update(hr);
			session.setAttribute("Hloginfail", "修改成功，请重新登陆");
			session.setAttribute("logina", 3);
			hr.setPassword("");
					return "usuccess";
					}
    //因为修改的需要根据id查找
	public String  Hupdatefind() {
		//获取session
		HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		
	        int id=(int)session.getAttribute("adminid");  
	        hrs=hrService.findById(id);
	        hr=(Hr) hrs.get(0);
			return "ufsuccess";
					}

}
