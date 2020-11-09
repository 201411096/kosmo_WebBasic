package mvc.board_mybatis.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board_mybatis.model.Board;
import mvc.board_mybatis.service.BoardService;




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
			Board rec = new Board();
			rec.setArticleId(Integer.parseInt(articleId));
			rec.setTitle(title);
			rec.setContent(content);
			rec.setPassword(password);
			int result = BoardService.getInstance().update(rec);
			request.setAttribute("boardRec", rec);
			request.setAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		return next+"?id="+articleId;
		return next;
	}
}
