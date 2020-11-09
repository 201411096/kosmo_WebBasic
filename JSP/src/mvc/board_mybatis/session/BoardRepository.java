package mvc.board_mybatis.session;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mvc.board_mybatis.model.Board;
import mvc.board_mybatis.model.BoardException;



public class BoardRepository 
{
	//	private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {
		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mvc-mybatis-board-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	// 연결객체 	- JDBC : connection
	//			- MyBatis : SqlSession
	public List<Board> selectBoardList(int firstRow, int lastRow){
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("firstRow", firstRow);
			map.put("lastRow", lastRow);
			
			List<Board> list = sqlSess.selectList("BoardMapper.selectBoardList", map);
			return list;
		}finally {
			sqlSess.close();
		}
	}
	public int getRecordCount() {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		int result=-1;
		try {
			result = sqlSess.selectOne("BoardMapper.getRecordCount");
			return result;
		}finally {
			sqlSess.close();
		}
	}
	public Board getArticleById(String articleId) {
		int aId = Integer.parseInt(articleId);
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		Board result=null;
		try {
			result = sqlSess.selectOne("BoardMapper.getArticleById", aId);
			return result;
		}finally {
			sqlSess.close();
		}
	}
	public int write(Board board) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {			
			int result = sqlSess.insert("BoardMapper.write", board);
			if(result > 0) sqlSess.commit();
			else sqlSess.rollback();
			return sqlSess.selectOne("BoardMapper.getCurrentArticleVal");
		}finally {
			sqlSess.close();
		}
	}
	public int getGroupId() {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {			
			return sqlSess.selectOne("BoardMapper.getGroupId");
		}finally {
			sqlSess.close();
		}
	}
	public int delete(String articleId, String password) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {			
			HashMap map = new HashMap();
			map.put("articleId", articleId);
			map.put("password", password);
			int result = sqlSess.delete("BoardMapper.delete", map);
			//db가 변동되었다면 커밋
			if(result > 0) sqlSess.commit();
			else sqlSess.rollback();
			
			return result;
		}finally {
			sqlSess.close();
		}
	}
	public int update(Board board) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.update("BoardMapper.update", board);
			//db가 변동되었다면 커밋
			if(result > 0) sqlSess.commit();
			else sqlSess.rollback();
			
			return result;
		}finally {
			sqlSess.close();
		}
	}
	public void increaseReadCount(String articleId) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.update("BoardMapper.increaseReadCount", articleId);
			if(result > 0) sqlSess.commit();
			else sqlSess.rollback();
		}finally {
			sqlSess.close();
		}
	}
	
	public Board reply(String pId, Board rec) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		
		int parentId = 0;
		if( pId != null ) parentId = Integer.parseInt(pId);
		try {
			Board parent = sqlSess.selectOne("BoardMapper.getArticleById", pId);
			// 부모게시글을 체크
			checkParent(parent, parentId);
			
			// 답변글에 순서번호 구하기
			String maxSeqNum = parent.getSequenceNo();
			String minSeqNum = getSearchMinSeqNum( parent );
			
//			String lastChildSeq = sqlSess.selectLastSequenceNumber( maxSeqNum, minSeqNum );
			HashMap map = new HashMap();
			map.put("maxSeqNum", maxSeqNum);
			map.put("minSeqNum", minSeqNum);
			int lastChildSeq = sqlSess.selectOne("BoardMapper.selectLastSequenceNumber", map);
			
			String sequenceNumber = getSequenceNumber( parent,Integer.toString(lastChildSeq));
			
			
			rec.setGroupId(parent.getGroupId()); // 부모의 그룹번호와 동일하게 지정
			rec.setSequenceNo(sequenceNumber);	 // 위에서 구한 답변글의 순서번호 지정
			rec.setPostingDate( (new Date()).toString());	 // 등록일
			
			int result = sqlSess.insert("BoardMapper.write", rec);
			
			if(result > 0) sqlSess.commit();
			else sqlSess.rollback();
			
			int articleId = sqlSess.selectOne("BoardMapper.getCurrentArticleVal");
			rec.setArticleId(articleId);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			sqlSess.close();
		}
		return rec;
	}
	
	
	/* 부모글이 존재하는지 부모글이 마지막 3단계인지 확인하는 함수 */
	private void checkParent( Board parent, int pId ) throws BoardException
	{
		
		if( parent == null ) throw new BoardException("부모글이 존재하지 않음 : " + pId );
		
		int parentLevel = parent.getLevel();
		if( parentLevel == 3 ) throw new BoardException("3단계 마지막 레벨 글에는 답변을 달 수 없습니다.");
	
	}	
	private String getSearchMinSeqNum( Board parent )
	{
		String parentSeqNum = parent.getSequenceNo();
		DecimalFormat dFormat = new DecimalFormat("0000000000000000");
		long parentSeqLongValue = Long.parseLong(parentSeqNum);
		long searchMinLongValue = 0;
		
		switch( parent.getLevel())
		{
		case 0 : searchMinLongValue = parentSeqLongValue / 1000000L * 1000000L; break;
		case 1 : searchMinLongValue = parentSeqLongValue / 10000L * 10000L; break;
		case 2 : searchMinLongValue = parentSeqLongValue / 100L * 100L; break;
		}
		return dFormat.format(searchMinLongValue);
	}
	private String getSequenceNumber( Board parent, String lastChildSeq ) throws BoardException
	{
		long parentSeqLong	= Long.parseLong( parent.getSequenceNo());
		int  parentLevel	= parent.getLevel();
		
		long decUnit = 0;
		if		( parentLevel == 0 ){	decUnit = 10000L;	}
		else if	( parentLevel == 1 ){	decUnit = 100L;		}
		else if ( parentLevel == 2 ){	decUnit = 1L;		}
		
		String sequenceNumber = null;
		
		DecimalFormat dFormat = new DecimalFormat("0000000000000000");
		if( lastChildSeq == null ){			// 답변글이 없다면
			sequenceNumber = dFormat.format(parentSeqLong-decUnit);
		} else {							// 답변글이 있다면, 마지막 답변글인지 확인
			String orderOfLastChildSeq = null;
			if( parentLevel == 0 ){
				orderOfLastChildSeq = lastChildSeq.substring(10,12);
				sequenceNumber = lastChildSeq.substring(0, 12) + "9999";
			}else if( parentLevel == 1 ){
				orderOfLastChildSeq = lastChildSeq.substring(12,14);
				sequenceNumber = lastChildSeq.substring(0, 14) + "99";				
			}else if( parentLevel == 2 ){
				orderOfLastChildSeq = lastChildSeq.substring(14,16);
				sequenceNumber = lastChildSeq;			
			}
			
			if( orderOfLastChildSeq.equals("00")){
				throw new BoardException("마지막 자식 글이 이미 존재합니다.");
			}
			
			long seq = Long.parseLong(sequenceNumber) - decUnit;
			sequenceNumber = dFormat.format(seq);
			
			return sequenceNumber; 
		}
		return sequenceNumber;
	}
}
