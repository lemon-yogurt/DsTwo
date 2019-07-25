package service;

import java.util.List;

import dao.JobseekerDao;
import po.Jobseeker;

public class JobseekerService {
private JobseekerDao jobseekerDao = null;
	
	public JobseekerService(){
	}
	
	public void setJobseekerDao(JobseekerDao jobseekerDao) {
		this.jobseekerDao = jobseekerDao;
	}
	
	//增加
	public void save(Jobseeker jobseeker) {
		jobseekerDao.save(jobseeker);
	}
	//删除
	public void delete(Jobseeker jobseeker) {
		jobseekerDao.delete(jobseeker);
			}
		//查找所有比赛信息
	public List findALL()
		{
			String hql = "from Jobseeker";
			List jobseekers = jobseekerDao.findByHql(hql);
		    return jobseekers;
		}
	//通过用户名查找
			public List findByUsername(String username)
			{
				String hql="from Jobseeker as jobseeker where username='"+username+ "'";
				List jobseekers = jobseekerDao.findByHql(hql);
			    return jobseekers;
			}
	
	//修改
	public void update(Jobseeker jobseeker) {
		jobseekerDao.update(jobseeker);
		}
	
	public List findById(int id)
	{
		String hql = "from Jobseeker as jobseeker where id='"+id+ "'";
		List jobseekers= jobseekerDao.findByHql(hql);
	    return jobseekers;
	}
	public List findByEverything(String str)
	{
		String hql = "from Jobseeker as jobseeker where name LIKE'%"+str+ "%'or school LIKE'%"+str+ "%'or worktype LIKE'%"+str+ "%'or education LIKE'%"+str+"%'";
		List jobseekers = jobseekerDao.findByHql(hql);
	    return jobseekers;
	}
}
