package mvc.board_mybatis.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board_mybatis.model.Board;
import mvc.board_mybatis.service.BoardService;



public class CommandInput implements Command{
	private String next;
	
	public CommandInput( String _next ){
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {

		String articleId = "";
		Board board = new Board();
		board.setContent(request.getParameter("content"));
		board.setPassword(request.getParameter("password"));
		board.setWriterName(request.getParameter("writerName"));
		board.setTitle(request.getParameter("title"));
		try {
			articleId = Integer.toString(BoardService.getInstance().write(board));
			request.setAttribute("articleId", articleId);
		}catch(Exception e){
			e.printStackTrace();
		}
		return next;
	}
	
	

}
