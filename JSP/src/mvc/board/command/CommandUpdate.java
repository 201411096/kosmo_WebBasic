package mvc.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board.model.BoardRec;
import mvc.board.service.ModifyArticleService;

public class CommandUpdate  implements Command {
	private String next;
	
	public CommandUpdate( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {

		try {
			String articleId = request.getParameter("articleId");
			String title = request.getParameter("title");
			String password = request.getParameter("password");
			String content = request.getParameter("content");
			BoardRec rec = new BoardRec();
			rec.setArticleId(Integer.parseInt(articleId));
			rec.setTitle(title);
			rec.setContent(content);
			rec.setPassword(password);
			int result = ModifyArticleService.getInstance().update(rec);
			request.setAttribute("boardRec", rec);
			request.setAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		return next+"?id="+articleId;
		return next;
	}
}
