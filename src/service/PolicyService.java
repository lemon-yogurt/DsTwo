package service;

import java.util.List;

import dao.PolicyDao;
import po.Policy;

public class PolicyService {
private PolicyDao policyDao = null;
	
	public PolicyService(){
	}
	
	public void setPolicyDao(PolicyDao policyDao) {
		this.policyDao = policyDao;
	}
	
	//增加
	public void save(Policy policy) {
		policyDao.save(policy);
	}
	//删除
	public void delete(Policy policy) {
		policyDao.delete(policy);
			}
		//查找所有比赛信息
	public List findALL()
		{
			String hql = "from Policy";
			List policys = policyDao.findByHql(hql);
		    return policys;
		}
	
	
	//修改
	public void update(Policy policy) {
		policyDao.update(policy);
		}
	public List findById(int id)
	{
		String hql = "from Policy as policy where id='"+id+ "'";
		List policys = policyDao.findByHql(hql);
	    return policys;
	}
	public List findByEverything(String str)
	{
		String hql = "from Policy as policy where title LIKE'%"+str+ "%'or essay LIKE'%"+str+ "%'";
		List policys = policyDao.findByHql(hql);
	    return policys;
	}
}
