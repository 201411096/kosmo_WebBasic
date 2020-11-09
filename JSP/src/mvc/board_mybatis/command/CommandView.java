package mvc.board_mybatis.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board_mybatis.model.Board;
import mvc.board_mybatis.service.BoardService;





public class CommandView implements Command{
	private String next;
	
	public CommandView( String _next ){
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		String articleId = request.getParameter("id");
		try {
			Board boardRec = BoardService.getInstance().getArticleById(articleId);
			BoardService.getInstance().increaseReadCount(articleId);
			request.setAttribute("boardRec", boardRec);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return next+"?id="+articleId;
	}
	
	

}
