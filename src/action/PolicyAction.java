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
import po.Policy;
import service.PolicyService;

public class PolicyAction {
	private Policy policy;
	private PolicyService policyService = null;
	
	private  List policys = new ArrayList();
	
	private String checkid;//复选框
	 
	//get/set函数
	public Policy getPolicy() {
		return policy;
	}
	public void setPolicy(Policy policy) {
		this.policy = policy;
	}
	public PolicyService getPolicyService() {
		return policyService;
	}
	public void setPolicyService(PolicyService policyService) {
		this.policyService = policyService;
	}
	
	//比赛信息数组的get/set
	public List getPolicys() {
		return policys;
	}
	public void setPolicys(List policys) {
		this.policys = policys;
	}
	
	//复选框结果的get/set
	public String getCheckid() {
		return checkid;
	}	
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	
	//保存
	public String Psave() {
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
		
		//保存到类
		policy.setDate(dateTime);
		session.setAttribute("cgxs", "保存成功，查看所有的政策信息");
		session.setAttribute("ahref", "PfindallC");
	
		policyService.save(policy);
		return "success";
		}
	
	//查找所有比赛信息
	 public String PfindAll() {
		 List policys1=new ArrayList();
		 policys1=policyService.findALL();
		
		if (policys1!=null && !policys1.isEmpty()) {
			for(int i=0;i<policys1.size();i++)
			{
				policy=(Policy)policys1.get(i);
				String ee=policy.getEssay();
				if(ee.length()>101)
				ee=ee.substring(0, 100);
				policy.setEssay(ee);
				policys.add(policy);
			}
			return "findallPsuccess";
			}
		return "findallPfail";
	}
	//通过id查找
	 public String Pfindbyid() {
		 HttpServletRequest request = ServletActionContext.getRequest();
		  String str=request.getParameter("a"); 
		 // System.out.print(str);
	        int id=Integer.parseInt(str);  
	       policys=policyService.findById(id);
	       policy=(Policy) policys.get(0);
			return "ufsuccess";
	}
	 
	 public String Pfindthree() {
		 List policys1 = new ArrayList();
		 policys1=policyService.findALL();
		if (policys1!=null && !policys1.isEmpty()) {
			
			int x=0;
			if(policys1.size()>5)
			{
				x=5;
				for(int i=0;i<x;i++)
				{	
					policy=(Policy)policys1.get(i);
					policys.add(policy);
				}
			}
			else
				policys=policys1;
			
			return "findallCsuccess";
			}
			
		return "findallCfail";
	}
	//模糊查找
	 public String PfindbyEverything() {
		String str=policy.getSs();
	       policys=policyService.findByEverything(str);
	    if(policys!=null)
	    {
	    	return "Pfindsuccess";
	    }
	    return "Pfindfail";
	}
	 //复选框删除
	 public String Pdelete() {
		 HttpServletRequest request = ServletActionContext.getRequest();
		 HttpSession session=request.getSession();
		  String str=request.getParameter("a"); 
		  int id=Integer.parseInt(str);  
		 Policy policy1=new Policy();
			
				policy1.setId(id);
				policyService.delete(policy1);
				session.setAttribute("cgxs", "删除成功，查看所有的政策信息");
				session.setAttribute("ahref", "PfindallC");
			
			return "dsuccess";
	}
	//修改函数
		public String Pupdate() {
			policyService.update(policy);
			return "usuccess";
			}
}
