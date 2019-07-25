package service;

import java.util.List;

import dao.HrDao;
import po.Hr;

public class HrService {
private HrDao hrDao = null;
	
	public HrService(){
	}
	
	public void setHrDao(HrDao hrDao) {
		this.hrDao = hrDao;
	}
	
	//增加
	public void save(Hr hr) {
		hrDao.save(hr);
	}
	//删除
	public void delete(Hr hr) {
		hrDao.delete(hr);
			}
		//查找所有比赛信息
	public List findALL()
		{
			String hql = "from Hr";
			List hrs = hrDao.findByHql(hql);
		    return hrs;
		}
	
	//通过用户名查找
		public List findByUsername(String username)
		{
			String hql="from Hr as hr where username='"+username+ "'";
			List hrs = hrDao.findByHql(hql);
		    return hrs;
		}
	//修改
	public void update(Hr hr ) {
		hrDao.update(hr);
		}
	
	public List findById(int id)
	{
		String hql = "from Hr as hr where id='"+id+ "'";
		List hrs= hrDao.findByHql(hql);
	    return hrs;
	}
}
