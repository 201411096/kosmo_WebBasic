package mvc.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board.model.BoardRec;
import mvc.board.service.ViewArticleService;

public class CommandView implements Command{
	private String next;
	
	public CommandView( String _next ){
		next = _next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		String articleId = request.getParameter("id");
		try {
			BoardRec boardRec = ViewArticleService.getInstance().getArticleById(articleId);
			request.setAttribute("boardRec", boardRec);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return next+"?id="+articleId;
	}
	
	

}
