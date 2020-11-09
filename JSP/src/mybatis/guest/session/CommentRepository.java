package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class CommentRepository 
{
	//	private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {
		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	// 연결객체 	- JDBC : connection
	//			- MyBatis : SqlSession
	
	public List<Comment> selectComment() {
		SqlSession sqlSess = getSqlSessionFactory().openSession(); // factory를 가져오고 session을 염
		try {
			List<Comment> list = sqlSess.selectList("CommentMapper.selectComment");
			return list;
			// catch 문을 작성하면 에러가 발생함
		}finally {
			sqlSess.close(); // 연결을 끊는 것이 아니라 반환하는 개념	
		}
	}
	public Integer insertComment(Comment c) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.insert("CommentMapper.insertComment", c);
			if(result > 0) sqlSess.commit();
			else sqlSess.rollback();
			return result;
		}finally {
			sqlSess.close();
		}
	}
	public Comment selectCommentByPrimaryKey(Long commentNo) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
//			개인적으로 사용한 방법
//			Comment result = sqlSess.selectOne("CommentMapper.selectCommentByPrimaryKey", commentNo);
//			select 하는 부분이라 commit rollback이 의미가 없음
//			if(result !=null) sqlSess.commit();
//			else sqlSess.rollback();
//			return result;
			HashMap map = new HashMap();
			map.put("commentNo", commentNo);
			Comment c = sqlSess.selectOne("CommentMapper.selectCommentByPrimaryKey", map);
			return c;
		}finally {
			sqlSess.close();
		}		
	}
	public Integer deleteComment(Long commentNo) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("commentNo", commentNo);
			int result = sqlSess.delete("CommentMapper.deleteComment", map);
			if(result==1)
				sqlSess.commit();
			else
				sqlSess.rollback();
			return result;
		}finally {
			sqlSess.close();
		}
	}
	public Integer updateComment(Comment c) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.update("CommentMapper.updateComment", c);
			if(result==1)
				sqlSess.commit();
			else
				sqlSess.rollback();
			return result;
		}finally {
			sqlSess.close();
		}
	}
}
