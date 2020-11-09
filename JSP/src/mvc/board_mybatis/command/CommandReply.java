package mvc.board_mybatis.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board_mybatis.model.Board;
import mvc.board_mybatis.service.BoardService;






public class CommandReply implements Command{
	private String next;
	
	public CommandReply( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {

		try {
			String parentId = request.getParameter("parentId");
			Board rec = new Board();
			rec.setWriterName(request.getParameter("writerName"));
			rec.setTitle(request.getParameter("title"));
			rec.setContent(request.getParameter("content"));
			
			request.setAttribute("boardRec", rec);
			
			BoardService.getInstance().reply(parentId, rec);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return next;
	}
}
