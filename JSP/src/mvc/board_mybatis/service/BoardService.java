package mvc.board_mybatis.service;

import java.text.DecimalFormat;
import java.util.List;

import mvc.board_mybatis.model.Board;
import mvc.board_mybatis.session.BoardRepository;




public class BoardService {
	private static BoardService service;
	private int recordPerPage=10;
	private BoardService() {}

	public static BoardService getInstance(){
		if( service == null) service = new BoardService();
		return service;
	}
	BoardRepository repo = new BoardRepository();
	
	public List<Board> selectBoardList(String pNum){
		int pageNum=1;
		if(pNum!=null)
			pageNum=Integer.parseInt(pNum);
		int firstRow = (pageNum-1)*recordPerPage+1;
		int lastRow = pageNum*recordPerPage;
		return repo.selectBoardList(firstRow, lastRow);
	}
	public int getPageTotalCount() {
		int totalRecordCount = repo.getRecordCount();
		
		if(totalRecordCount%recordPerPage==0) //페이지당 글 갯수로 나누어 떨어지면
			return totalRecordCount/recordPerPage; // 나눈 몫 그대로 반환
		else								  //나누어 떨어지지 않으면
			return totalRecordCount/recordPerPage+1;// 나눈 몫에 1 더해줌
	}
	public Board getArticleById(String articleId) {
		return repo.getArticleById(articleId);
	}
	public int write(Board board) { // 글을 작성하고 articleId를 반환함
		// 그룹번호(group_id) 지정
		
		int groupId = repo.getGroupId();
		board.setGroupId(groupId);
		// 순서번호(sequence_no) 지정
		DecimalFormat dformat = new DecimalFormat("0000000000");
		board.setSequenceNo( dformat.format(groupId) + "999999");
		//groupId : 1 -> sequenceNo : 0001999999		
		
		
		return repo.write(board);
	}
	public int delete(String articleId, String password) {
		int result = -1;
		
		return repo.delete(articleId, password);
	}
	public int update(Board board) {
		int result = -1;
		return repo.update(board);
	}
	public Board reply(String parentId, Board rec) {
		return repo.reply(parentId, rec);
	}
	public void increaseReadCount(String articleId) {
		repo.increaseReadCount(articleId);
	}
}