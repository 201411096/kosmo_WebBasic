import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HelloServlet() {
    	super(); // 부모 생성자를 부름
    }
    /* default 가 get방식
	   
    */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter(); // 문자형으로 출력하는 스트림을 얻어옴 // writer가 문자로 보내는 ..?
		
		out.write("<html><body>");
		out.write("<h2>나의 첫 웹서버</h2>");
		out.write("</body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
