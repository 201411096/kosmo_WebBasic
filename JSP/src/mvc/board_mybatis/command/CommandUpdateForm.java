package mvc.board_mybatis.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board_mybatis.model.Board;
import mvc.board_mybatis.service.BoardService;




public class CommandUpdateForm implements Command {
	private String next;
	
	public CommandUpdateForm( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		String articleId="";
		try {
			articleId = request.getParameter("id");
			Board rec = BoardService.getInstance().getArticleById(articleId);
			request.setAttribute("boardRec", rec);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return next;
	}
}
