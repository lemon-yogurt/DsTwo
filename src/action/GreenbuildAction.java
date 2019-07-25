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

import po.Contest;
import po.Greenbuild;
import service.GreenbuildService;

public class GreenbuildAction {
	private Greenbuild greenbuild;
	private GreenbuildService greenbuildService = null;
	
	//保存图片相关变量
	private File pic;
	private String picContentType;
	private String picFileName;
	
	private  List greenbuilds = new ArrayList();
	
	private String checkid;//复选框
	 
	//get/set函数
	public Greenbuild getGreenbuild() {
		return greenbuild;
	}
	public void setGreenbuild(Greenbuild greenbuild) {
		this.greenbuild = greenbuild;
	}
	public GreenbuildService getGreenbuildService() {
		return greenbuildService;
	}
	public void setGreenbuildService(GreenbuildService greenbuildService) {
		this.greenbuildService = greenbuildService;
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
	public List getGreenbuilds() {
		return greenbuilds;
	}
	public void setGreenbuilds(List greenbuilds) {
		this.greenbuilds = greenbuilds;
	}
	
	//复选框结果的get/set
	public String getCheckid() {
		return checkid;
	}	
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	
	//保存
	public String Gsave() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
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
		
		//保存到类
        greenbuild.setImg(picFileName);
        greenbuild.setDate(dateTime);
        session.setAttribute("cgxs", "保存成功，查看所有的绿建信息");
		session.setAttribute("ahref", "GfindallC");
        greenbuildService.save(greenbuild);
		return "success";
		}
	
	//查找所有比赛信息
	 public String GfindAll() {
		 List greenbuilds1=new ArrayList();
		 greenbuilds1=greenbuildService.findALL();
		
		if (greenbuilds1!=null && !greenbuilds1.isEmpty()) {
			for(int i=0;i<greenbuilds1.size();i++)
			{
				greenbuild=(Greenbuild)greenbuilds1.get(i);
				String ee=greenbuild.getEssay();
				if(ee.length()>101)
				ee=ee.substring(0, 100);
				greenbuild.setEssay(ee);
				greenbuilds.add(greenbuild);
			}
			return "findallGsuccess";
			}
		return "findallGfail";
	}
	//通过id查找
		 public String Gfindbyid() {
			 HttpServletRequest request = ServletActionContext.getRequest();
			  String str=request.getParameter("a"); 
			
		        int id=Integer.parseInt(str);  
		       greenbuilds=greenbuildService.findById(id);
		       greenbuild=(Greenbuild) greenbuilds.get(0);
				return "ufsuccess";
		}
	
		//模糊查找
		 public String GfindbyEverything() {
			String str=greenbuild.getSs();
		       greenbuilds=greenbuildService.findByEverything(str);
		    if(greenbuilds!=null)
		    {
		    	return "Gfindsuccess";
		    }
		    return "Gfindfail";
		}
	 //复选框删除
	 
	 public String Gdelete() {
		 HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session=request.getSession();
		  String str=request.getParameter("a"); 
		//  System.out.print(str);
	        int id=Integer.parseInt(str);  
		 Greenbuild greenbuild1=new Greenbuild();
			
				greenbuild1.setId(id);
				greenbuildService.delete(greenbuild1);
			session.setAttribute("cgxs", "删除成功，查看所有的绿建信息");
			session.setAttribute("ahref", "GfindallC");
			return "dsuccess";
	}
	//修改函数
		public String Gupdate() {
			 HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session=request.getSession();
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
			
			
			
			try {
				String realPath=ServletActionContext.getServletContext().getRealPath("/images");
				
				
				System.out.println(realPath);
				File file=new File(realPath,picFileName);
				FileUtils.copyFile(pic, file);
				}catch(IOException e) {
					ActionContext.getContext().put("message", "图片上传");
				}
			greenbuild.setDate(dateTime);
				greenbuild.setImg(picFileName);
			greenbuildService.update(greenbuild);
			session.setAttribute("cgxs", "修改成功，查看所有的绿建信息");
			session.setAttribute("ahref", "GfindallC");
			return "usuccess";
			}
	//因为修改的需要根据id查找
	public String  Gupdatefind() {
				
				HttpServletRequest request = ServletActionContext.getRequest();
				  String str=request.getParameter("a");  
			        int id=Integer.parseInt(str);  
			        System.out.println(id);
			        greenbuilds=greenbuildService.findById(id);
			        greenbuild=(Greenbuild) greenbuilds.get(0);
					return "ufsuccess";
			}
	public String Gfindthree() {
		HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		 List greenbuilds1 = new ArrayList();
		 greenbuilds1=greenbuildService.findALL();
		if (greenbuilds1!=null && !greenbuilds1.isEmpty()) {
			
			int x=0;
			if(greenbuilds1.size()>=12)
			{
				session.setAttribute("tpnumble",0);
				x=12;
				for(int i=0;i<x;i++)
				{	
					greenbuild=(Greenbuild)greenbuilds1.get(i);
				    greenbuilds.add(greenbuild);
				   
				}
				System.out.println(x);
			}
			else
			{	greenbuilds=greenbuilds1;
			session.setAttribute("tpnumble", greenbuilds1.size());
			System.out.println(greenbuilds1.size());
			//System.out.println(greenbuilds);
			}
			
			session.setAttribute("greenbuilds", greenbuilds);
			
			
			return "findallCsuccess";
		}
			
		return "findallCfail";
	}
}
