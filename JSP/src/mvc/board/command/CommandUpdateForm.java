package mvc.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board.model.BoardRec;
import mvc.board.service.ViewArticleService;

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
			BoardRec rec = ViewArticleService.getInstance().getArticleById(articleId);
			request.setAttribute("boardRec", rec);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return next;
	}
}
