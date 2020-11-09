package mvc.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.board.model.BoardRec;
import mvc.board.service.ReplyArticleService;



public class CommandReply implements Command{
	private String next;
	
	public CommandReply( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {

		try {
			String parentId = request.getParameter("parentId");
			BoardRec rec = new BoardRec();
			rec.setWriterName(request.getParameter("writerName"));
			rec.setTitle(request.getParameter("title"));
			rec.setContent(request.getParameter("content"));
			
			request.setAttribute("boardRec", rec);
			
			ReplyArticleService.getInstance().reply(parentId, rec);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return next;
	}
}
