package service;

import java.util.List;

import dao.CommentDao;
import po.Comment;

public class CommentService {
private CommentDao commentDao = null;
	
	public CommentService(){
	}
	
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	//增加
	public void save(Comment comment) {
		commentDao.save(comment);
	}
	//删除
	public void delete(Comment comment) {
		commentDao.delete(comment);
			}
		//查找所有比赛信息
	public List findALL()
		{
			String hql = "from Comment";
			List comments = commentDao.findByHql(hql);
		    return comments;
		}
	
	
	//修改
	public void update(Comment comment) {
		commentDao.update(comment);
		}
	
	public List findById(int id)
	{
		String hql = "from Comment as comment where questionid='"+id+ "'";
		List comments = commentDao.findByHql(hql);
	    return comments;
	}
}
