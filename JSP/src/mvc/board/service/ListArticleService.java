package mvc.board.service;

import java.util.List;

import mvc.board.model.BoardDao;
import mvc.board.model.BoardException;
import mvc.board.model.BoardRec;

public class ListArticleService {
	private static ListArticleService instance;
	private int recordPerPage=10;
	
	public static ListArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ListArticleService();
		}
		return instance;
	}
	// 모든 레코드를 다 가져오는 함수
	public List <BoardRec> getArticleList() throws BoardException
	{
		// 
		 List <BoardRec> mList = BoardDao.getInstance().selectList();			
		return mList;
	}
	// 해당 페이지에 속하는 레코드를 가져오는 함수
	public List <BoardRec> getArticleList(String pageNum) throws BoardException
	{
		int pNum=1;
		if(pageNum!=null)
			pNum=Integer.parseInt(pageNum);
		int firstRow = (pNum-1)*recordPerPage+1;
		int lastRow = pNum*recordPerPage;
		
		List <BoardRec> mList = BoardDao.getInstance().selectList(firstRow, lastRow);			
		return mList;
	}
	// 총 페이지 수를 구하는 함수
	public int getPageTotalCount() throws BoardException {
		int totalRecordCount = BoardDao.getInstance().getTotalRecordCount();
		
		if(totalRecordCount%recordPerPage==0) //페이지당 글 갯수로 나누어 떨어지면
			return totalRecordCount/recordPerPage; // 나눈 몫 그대로 반환
		else								  //나누어 떨어지지 않으면
			return totalRecordCount/recordPerPage+1;// 나눈 몫에 1 더해줌
		
	}
	// 페이지 그룹을 얻는 함수
	public int getPagingGroup(int currentPage) throws BoardException{
		int pagingGroup=-1;
		
		if(currentPage%10==0)
			pagingGroup=currentPage/10;
		else
			pagingGroup=currentPage/10+1;
		
		return pagingGroup;
	}
		
}
