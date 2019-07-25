package dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import po.Contest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ContestDao extends BaseHibernateDao{
	public ContestDao(){
	//	System.out.println("create CustomerDao.");
		}
	
	//增加
	public void save(Contest contest) {
		Transaction tran = null;
		Session session = null;
		try {
			session = getSession();
			tran = session.beginTransaction();
			session.save(contest);
			tran.commit();
		} catch (RuntimeException re) {
			if(tran != null) tran.rollback();
			throw re;
		} finally {
			session.close();
		}
	}
	/*public void update(Product product) {
		Transaction tran = null;
		Session session = null;
		try {
			session = getSession();
			tran = session.beginTransaction();
			session.update(product);
			tran.commit();
		} catch (RuntimeException re) {
			if(tran != null) tran.rollback();
			throw re;
		} finally {
			session.close();
		}
	}*/
	//删除
	public void delete(Contest contest) {
		Transaction tran = null;
		Session session = null;
		try {
			session = getSession();
			tran = session.beginTransaction();
			session.delete(contest);
			tran.commit();
		} catch (RuntimeException re) {
			if(tran != null) tran.rollback();
			throw re;
		} finally {
			session.close();
		}
	}
	//通过hql语句查找
	public List findByHql(String hql)
	{
		Transaction tran = null;
		Session session = null;
		try {
			session = getSession();
			tran = session.beginTransaction();
			Query queryObject = session.createQuery(hql);
			return queryObject.list();
			} catch (RuntimeException re) {
				throw re;
				} finally{
					session.close();
					}
	}

}
