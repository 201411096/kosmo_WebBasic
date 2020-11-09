package mvc.board_mybatis.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board_mybatis.model.Board;
import mvc.board_mybatis.service.BoardService;




public class CommandList implements Command 
{
	private String next;

	public CommandList( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException{
		try{
				BoardService service = BoardService.getInstance();
			    String pNum = request.getParameter("page");
			    
			    List<Board> mList = service.selectBoardList(pNum);
			    int totalPageCount = service.getPageTotalCount();

			    request.setAttribute("mList", mList);
			    request.setAttribute("totalPageCount", totalPageCount);

		}catch( Exception ex ){
			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString() ); 
		}
		
		return next;
	}
}
