package mvc.board_mybatis.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board_mybatis.service.BoardService;





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
			int result = BoardService.getInstance().delete(articleId, password);
			request.setAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		return next+"?id="+articleId;
		return next;
	}
}
