package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import po.Hr;

public class HrDao extends BaseHibernateDao{
	public HrDao(){
		//	System.out.println("create CustomerDao.");
			}
		
		//����
		public void save(Hr hr) {
			Transaction tran = null;
			Session session = null;
			try {
				session = getSession();
				tran = session.beginTransaction();
				session.save(hr);
				tran.commit();
			} catch (RuntimeException re) {
				if(tran != null) tran.rollback();
				throw re;
			} finally {
				session.close();
			}
		}
		//�޸�
		public void update(Hr hr) {
			Transaction tran = null;
			Session session = null;
			try {
				session = getSession();
				tran = session.beginTransaction();
				session.update(hr);
				tran.commit();
			} catch (RuntimeException re) {
				if(tran != null) tran.rollback();
				throw re;
			} finally {
				session.close();
			}
		}
		//ɾ��
		public void delete(Hr hr) {
			Transaction tran = null;
			Session session = null;
			try {
				session = getSession();
				tran = session.beginTransaction();
				session.delete(hr);
				tran.commit();
			} catch (RuntimeException re) {
				if(tran != null) tran.rollback();
				throw re;
			} finally {
				session.close();
			}
		}
		//ͨ��hql������
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