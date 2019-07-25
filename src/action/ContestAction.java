package action;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import po.Contest;
import service.ContestService;

public class ContestAction {
	private Contest contest;
	private ContestService contestService = null;
	
	//保存图片相关变量
	private File pic;
	private String picContentType;
	private String picFileName;
	
	private  List contests = new ArrayList();
	
	private String checkid;//复选框
	 
	//get/set函数
	public Contest getContest() {
		return contest;
	}
	public void setContest(Contest contest) {
		this.contest = contest;
	}
	public ContestService getContestService() {
		return contestService;
	}
	public void setContestService(ContestService contestService) {
		this.contestService = contestService;
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
	public List getContests() {
		return contests;
	}
	public void setContests(List contests) {
		this.contests = contests;
	}
	//复选框结果的get/set
	public String getCheckid() {
		return checkid;
	}
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	//退出登陆
	public String tc() {
		
		HttpServletRequest request=(HttpServletRequest) ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		session.setAttribute("admin", null);
		return "tcsuccess";
	}
	//保存
	public String save() {
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
		contest.setContestimg(picFileName);
		contest.setFbdate(dateTime);
		session.setAttribute("cgxs", "添加成功，查看所有的赛事信息");
		session.setAttribute("ahref", "findallC");
		contestService.save(contest);
		return "success";
		}
	
	//查找所有比赛信息
	 public String findAll() {
		 List contests1 = new ArrayList();
			contests1=contestService.findALL();
			
		if (contests1!=null && !contests1.isEmpty()) {
			for(int i=0;i<contests1.size();i++)
			{
				contest=(Contest)contests1.get(i);
				String ee=contest.getEssay();
				if(ee.length()>101)
				ee=ee.substring(0, 100);
				contest.setEssay(ee);
				contests.add(contest);
			}
			return "findallCsuccess";
			}
		return "findallCfail";
	}
	//查找所有比赛信息
		 public String findthree() {
			 List contests1 = new ArrayList();
			contests1=contestService.findALL();
			if (contests1!=null && !contests1.isEmpty()) {
				if( contests1.size()>0) {
					
				contest=(Contest)contests1.get(0);
				String ee=contest.getEssay();
				if(ee.length()>31)
				ee=ee.substring(0, 30);
				contest.setEssay(ee);
				contests.add(contest);
				
				if(contests1.size()>1) {
				contest=(Contest)contests1.get(1);
				ee=contest.getEssay();
				if(ee.length()>31)
				ee=ee.substring(0, 30);
				contest.setEssay(ee);
				contests.add(contest);
				}
				contest=null;
				if(contests1.size()>2)
				contest=(Contest)contests1.get(2);
				ee=contest.getEssay();
				if(ee.length()>31)
				ee=ee.substring(0, 30);
				contest.setEssay(ee);
				
				
				//GreenbuildAction greenbuildaction=new GreenbuildAction();
				//greenbuildaction.Gfindthree();
				//PolicyAction policyaction=new PolicyAction();
				//policyaction.Pfindthree();
				
				
				return "findallCsuccess";
				}
				}
			return "findallCfail";
		}
	 //通过id查找
		 public String findbyid() {
			 HttpServletRequest request = ServletActionContext.getRequest();
			  String str=request.getParameter("a"); 
			  System.out.print(str);
		        int id=Integer.parseInt(str);  
		       contests=contestService.findbyid(id);
		        contest=(Contest) contests.get(0);
				return "ufsuccess";
		}
		//模糊查找
		 public String findbyEverything() {
			String str=contest.getSs();
		       contests=contestService.findByEverything(str);
		    if(contests!=null)
		    {
		    	return "findsuccess";
		    }
		    return "findfail";
		}
	 //复选框删除
	 public String delete() {
		 HttpServletRequest request = ServletActionContext.getRequest();
		 HttpSession session=request.getSession();
		  String str=request.getParameter("a"); 
		  Contest contest1=new Contest();
	        int id=Integer.parseInt(str);  
	        contest1.setId(id);
	       contestService.delete(contest1);
	       session.setAttribute("cgxs", "删除成功，查看所有的赛事信息");
			session.setAttribute("ahref", "findallC");
			return "dsuccess";
	}

}
