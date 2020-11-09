package mybatis.guest.service;

import java.util.*;

import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentRepository;

public class CommentService {
	private static CommentService service;
	private CommentService() {}
	
	public static CommentService getInstance(){
		if( service == null) service = new CommentService();
		return service;
	}
	CommentRepository repo = new CommentRepository();
	
	public List<Comment> selectComment() {
		return repo.selectComment();
	}
	public Integer insertComment(Comment c) {
		return repo.insertComment(c);
	}
	public Comment selectCommentByPrimaryKey(Long commentNo) {
		return repo.selectCommentByPrimaryKey(commentNo);
	}
	public Integer deleteComment(Long commentNo) {
		return repo.deleteComment(commentNo);
	}
	public Integer updateComment(Comment c) {
		return repo.updateComment(c);
	}
}