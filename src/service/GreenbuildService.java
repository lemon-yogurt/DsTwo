package service;

import java.util.List;

import dao.GreenbuildDao;
import po.Greenbuild;

public class GreenbuildService {
private GreenbuildDao greenbuildDao = null;
	
	public GreenbuildService(){
	}
	
	public void setGreenbuildDao(GreenbuildDao greenbuildDao) {
		this.greenbuildDao = greenbuildDao;
	}
	
	//增加
	public void save(Greenbuild greenbuild) {
		greenbuildDao.save(greenbuild);
	}
	//删除
	public void delete(Greenbuild greenbuild) {
		greenbuildDao.delete(greenbuild);
			}
		//查找所有比赛信息
	public List findALL()
		{
			String hql = "from Greenbuild";
			List greenbuilds = greenbuildDao.findByHql(hql);
		    return greenbuilds;
		}
	
	
	//修改
	public void update(Greenbuild greenbuild) {
		greenbuildDao.update(greenbuild);
		}
	
	public List findById(int id)
	{
		String hql = "from Greenbuild as greenbuilding where id='"+id+ "'";
		List greenbuilds = greenbuildDao.findByHql(hql);
	    return greenbuilds;
	}
	public List findByEverything(String str)
	{
		String hql = "from Greenbuild as greenbuilding where materialname LIKE'%"+str+ "%'or title LIKE'%"+str+ "%'or essay LIKE'%"+str+ "%'";
		List greenbuilds = greenbuildDao.findByHql(hql);
	    return greenbuilds;
	}
}
