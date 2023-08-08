<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="java.util.*, board.*, java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id = "mem" class="board.MemberDDL" scope="page" />
<jsp:useBean id = "mdto" class="board.MembersDTO" scope="page" />
<jsp:useBean id = "bbs" class="board.BbsDDL" scope="page" />
<jsp:useBean id = "bdto" class="board.BBSDTO" scope="page" />

<!-- 로그인된 사용자가 아니라면 로그인창으로 돌려줌 -->
<%
	String user = (String) session.getAttribute("user");
	Vector data = mem.getSelect(user);
	int size = data.size();
	for(int i =0; i<size; i++) {
		MembersDTO dt = (MembersDTO) data.elementAt(i);
		pageContext.setAttribute("dto", dt);
	}
	// 로그인 한사람만 볼수있음
	if(user == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("document.location.href='/board/index.jsp?fname=member/login'");
		script.println("</script>");
	}
	
	int bbsnum = 0;
	if(request.getParameter("bbsnum") != null){
		bbsnum = Integer.parseInt(request.getParameter("bbsnum"));
	}

	if(bbsnum == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류..')");
		script.println("document.location.href='/board/index.jsp?fname=bbslist'");
		script.println("</script>");
	}
	
	Vector bdata = bbs.getbbs(bbsnum);
	int bsize = bdata.size();
	for(int i=0; i<bsize; i++){
		BBSDTO bdt = (BBSDTO) bdata.elementAt(i);
		pageContext.setAttribute("bdto", bdt);
	}

%>


<div class="container bbs">
   <h2 class="mt-3 mb-5 text-center">게시글</h2>
   <div class="row">
   
   <form action="/board/bbsUpdate" method="post">
    <input type="hidden" name="bbsnum" value="${bdto.bbsnum }">
	<input type="hidden" name="userid" value="${dto.userid }">
	<input type="hidden" name="username" value="${dto.username }">
	<input type="text" name="title" id="title" class="form-control mt-4 mb-2" value="${bdto.title }" required>
	
	<div class="form-group">
		<textarea class="form-control" rows="10" name="content" id="content" required>
		${bdto.content }
		</textarea>
	</div>
	<br />
	<button type="submit" class="btn btn-primary mb-3">제출하기</button>
</form>
   </div>
</div> 
