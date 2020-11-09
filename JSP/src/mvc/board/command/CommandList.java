package mvc.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board.model.BoardException;
import mvc.board.model.BoardRec;
import mvc.board.service.ListArticleService;

public class CommandList implements Command 
{
	private String next;

	public CommandList( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException{
		try{
		    ListArticleService service;
		    try {
		    	service = ListArticleService.getInstance();
			    String pNum = request.getParameter("page");
			    
			    List<BoardRec> mList = service.getArticleList(pNum);
			    int totalPageCount = service.getPageTotalCount();

			    request.setAttribute("mList", mList);
			    request.setAttribute("totalPageCount", totalPageCount);
		    }catch(Exception e) {
		    	System.out.println("commandList setattribute");
		    	e.printStackTrace();
		    }
		}catch( Exception ex ){
			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString() ); 
		}
		
		return next;
	}
}
