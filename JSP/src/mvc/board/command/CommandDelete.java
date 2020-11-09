package mvc.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board.service.DeleteArticleService;

public class CommandDelete implements Command {
	private String next;
	
	public CommandDelete( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		String articleId="";
		try {
			articleId = request.getParameter("articleId");
			String password = request.getParameter("password");
			System.out.println(articleId);
			System.out.println(password);
			int result = DeleteArticleService.getInstance().delete(articleId, password);
			System.out.println("result값 :" + result);
			request.setAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		return next+"?id="+articleId;
		return next;
	}
}
