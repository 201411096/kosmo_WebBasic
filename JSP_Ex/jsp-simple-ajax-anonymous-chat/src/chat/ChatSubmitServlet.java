package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ChatSubmitServlet")
public class ChatSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); /* 파라미터로 전달되는 데이터 처리 */
		response.setContentType("text/html; charset=UTF-8"); /* 브라우저로 보내지는 데이터 처리 */
		String chatName = URLDecoder.decode(request.getParameter("chatName"), "UTF-8");
		String chatContent = URLDecoder.decode(request.getParameter("chatContent"), "UTF-8");
		if(chatName == null || chatName.equals("") || chatContent==null || chatContent.equals("")) {
			response.getWriter().write("0"); // 오류 발생시 0 출력
		}
		else {
			response.getWriter().write(new ChatDAO().submit(chatName, chatContent) +""); //데이터 전송 //공백 문자를 추가해서 문자열의 형태로 출력할 수 있도록 만듬
		}
	}

}
