package service;

import java.util.List;

import dao.EmploymentDao;
import po.Employment;

public class EmploymentService {
private EmploymentDao employmentDao = null;
	
	public EmploymentService(){
	}
	
	public void setEmploymentDao(EmploymentDao employmentDao) {
		this.employmentDao = employmentDao;
	}
	
	//增加
	public void save(Employment employment) {
		employmentDao.save(employment);
	}
	//删除
	public void delete(Employment employment) {
		employmentDao.delete(employment);
			}
		//查找所有比赛信息
	public List findALL()
		{
			String hql = "from Employment";
			List employments = employmentDao.findByHql(hql);
		    return employments;
		}
	
	
	//修改
	public void update(Employment employment) {
		employmentDao.update(employment);
		}
	
	public List findById(int id)
	{
		String hql = "from Employment as employment where id='"+id+ "'";
		List employments = employmentDao.findByHql(hql);
	    return employments;
	}
	public List findByEverything(String str)
	{
		String hql = "from Employment as employment where education LIKE'%"+str+ "%'or workduty LIKE'%"+str+ "%'or companyname LIKE'%"+str+ "%'or workname LIKE'%"+str+ "%'";
		List employments = employmentDao.findByHql(hql);
	    return employments;
	}
}
