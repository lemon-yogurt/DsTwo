package service;

import java.util.List;

import dao.QuestionDao;
import po.Question;

public class QuestionService {
private QuestionDao questionDao = null;
	
	public QuestionService(){
	}
	
	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}
	
	//增加
	public void save(Question question) {
		questionDao.save(question);
	}
	//删除
	public void delete(Question question) {
		questionDao.delete(question);
			}
		//查找所有比赛信息
	public List findALL()
		{
			String hql = "from Question";
			List questions = questionDao.findByHql(hql);
		    return questions;
		}
	
	
	//修改
	public void update(Question question) {
		questionDao.update(question);
		}
	
	public List findById(int id)
	{
		String hql = "from Question as question where id='"+id+ "'";
		List questions= questionDao.findByHql(hql);
	    return questions;
	}
	public List findByEverything(String str)
	{
		String hql = "from Question as question where describe LIKE'%"+str+ "%'or title LIKE'%"+str+ "%'or humentype LIKE'%"+str+ "%'";
		List questions = questionDao.findByHql(hql);
	    return questions;
	}
}
