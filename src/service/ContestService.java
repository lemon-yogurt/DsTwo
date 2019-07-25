package service;

import java.util.List;

import dao.ContestDao;
import po.Contest;

public class ContestService {
private ContestDao contestDao = null;
	
	public ContestService(){
	}
	
	public void setContestDao(ContestDao contestDao) {
		this.contestDao = contestDao;
	}
	
	public void save(Contest contest) {
		contestDao.save(contest);
	}
	//删除
	public void delete(Contest contest) {
				contestDao.delete(contest);
			}
		//查找所有比赛信息
	public List findALL()
		{
			String hql = "from Contest";
			List products = contestDao.findByHql(hql);
		    return products;
		}
	public List findbyid(int id)
	{
		String hql = "from Contest as contest where id='"+id+ "'";
		List contests = contestDao.findByHql(hql);
	    return contests;
	}
	public List findByEverything(String str)
	{
		String hql = "from Contest as contest where contesttitle LIKE'%"+str+ "%'or title LIKE'%"+str+ "%'or essay LIKE'%"+str+ "%' or sponsor LIKE'%"+str+ "%'";
		List greenbuilds = contestDao.findByHql(hql);
	    return greenbuilds;
	}
	
	/*public void update(Product product) {
		//	System.out.println("execute --register()-- method.");
			productDao.update(product);
		}
	public void delete(Product product) {
		//	System.out.println("execute --register()-- method.");
			productDao.delete(product);
		}
	public List findId(int id)
	{
		System.out.println(id);
		//int id=product.getId();
		String hql = "from Product as product where id='"+id+ "'";
		//ProductDao dao = new ProductDao();
		List products = productDao.findId(hql);
	    return products;
	}
	/*public List findeve(String message)
	{
		//System.out.println(id);
		//int id=product.getId();
		String hql = "from Product as product where spectext like'%"+message+ "%' or name like '%"+message+ "%' or type like '%"+message+ "%' or text like '%"+message+ "%'";
		//ProductDao dao = new ProductDao();
		List products = productDao.findId(hql);
	    return products;
	}
	public List userfindALL() {
		String hql = "from Product as product where number<>0";
		//ProductDao dao = new ProductDao();
		List products = productDao.findId(hql);
		return products;
	}
	public List findtype(String type)
	{
		//System.out.println(id);
		//int id=product.getId();
		String hql = "from Product as product where type ='"+type+ "' and number<>0";
		//ProductDao dao = new ProductDao();
		List products = productDao.findId(hql);
	    return products;
	}
*/

}
