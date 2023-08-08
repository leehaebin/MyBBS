

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import board.MembersDTO;
import board.DBConnect;
import board.MemberDDL;
import board.BBSDTO;
import board.BbsDDL;

@WebServlet("/writeOk")
public class writeOk extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		MembersDTO mdto = new MembersDTO();
		MemberDDL mddl = new MemberDDL();
		BBSDTO bdto = new BBSDTO();
		BbsDDL bddl = new BbsDDL();
		HttpSession session = req.getSession();
		String user = (String) session.getAttribute("user");
		
		String ip = req.getRemoteAddr();
		
		bdto.setTitle(req.getParameter("title"));
		mdto.setUserid(req.getParameter("userid"));
		mdto.setUsername(req.getParameter("username"));
		bdto.setContent(req.getParameter("content"));
		bdto.setUip();
		bdto.setWdate();
		boolean isSuccess = bddl.write(bdto, mdto);
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		String script = null;
		if(isSuccess) {
			System.out.println("업데이트 성공");
			script = "<script>alert('글이 등록되었습니다.');"
					+"document.location.href='/board/index.jsp?fname=bbslist';"
					+"</script>";
		}else {
			System.out.println("업데이트 실패");
			script = "<script>alert('문제가 발생했습니다. \n 관리자에게 문의해도 모릅니다.');"
					+"document.location.href='/board';"
					+"</script>";
		}
		out.println("<html><head></head><body>");
		out.println(script);
		out.println("</body></html>");
		
		doGet(req, res);
	}

}
