<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="java.util.*, board.*, java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id = "mem" class="board.MemberDDL" scope="page" />
<jsp:useBean id = "mdto" class="board.MembersDTO" scope="page" />
<jsp:useBean id = "bbs" class="board.BbsDDL" scope="page" />
<jsp:useBean id = "bdto" class="board.BBSDTO" scope="page" />
<jsp:useBean id = "ment" class="board.CommentDDL" scope="page"/>
<jsp:useBean id = "cdto" class="board.CommentDTO" scope="page"/>

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
	
	Vector cdata = ment.getcomment(bbsnum);
	int csize = cdata.size();
	for(int i=0; i<csize; i++){
		CommentDTO cdt = (CommentDTO) cdata.elementAt(i);
		pageContext.setAttribute("cdto", cdt);
	}
	
%>


<div class="container bbs">
   <h2 class="mt-3 mb-5 text-center">게시글</h2>
   <div class="row">
   <form action="/board/Delete" method="post">
   	<input type="hidden" name = "userid" value="${dto.userid }" >
   	<input type="hidden" name = "bbsnum" value="${bdto.bbsnum }" >
	   <table class="table talbe-striped text-center" style="border: 1px solid #ddd">
	   		<tbody>
	   			<tr>
	   				<th>글제목</th>
	   				<td colspan="2">${bdto.title } </td>
	   			</tr>
	   			<tr>
	   				<th>작성자</th>
	   				<td colspan="2">${bdto.userid }(${bdto.username })</td>
	   			</tr>
	   			<tr>
	   				<th>작성일자</th>
	   				<td colspan="2">${bdto.wdate }</td>
	   			</tr>
				<tr>
	   				<th>조회수</th>
	   				<td colspan="2">${bdto.count }</td>
	   			</tr>
	   			<tr>
	   				<th>내용</th>
	   				<td colspan="2" style="height: 200px">${bdto.content }</td>
	   			</tr>
	   		</tbody>
	   </table>
	   
	   <div class="justify-content-flex-end px-3 my-3 button-group">
		<a href="index.jsp?fname=bbslist" class="btn btn-primary">목록</a>
		<a href="index.jsp?fname=bbslist" class="btn btn-warning">댓글</a>
		<c:if test="${dto.userid eq bdto.userid }">
			<a href="index.jsp?fname=bbsupdate&bbsnum=${bdto.bbsnum }" class="btn btn-success">수정</a>
			<button onclick="return confirm('삭제하시겠습니까?')" type="submit" class="btn btn-danger" >삭제</button>
		</c:if>
	</div>
	</form>
	
	<form action="/board/reply" class="row g-3 pb-5 reply">
		<label for="inputEmail4" class="form-label">${dto.userid }(${dto.username } )</label>
	  	<div class="col-md-10">	    
	    	<input type="email" class="form-control" id="inputEmail4">
	  	</div>
	  	<div class="col-md-2">
	    	<button type="submit" class="btn btn-primary">댓글쓰기</button>
	  	</div>
  	</form>
	
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<tbody>
		<% 
			for(int i=0; i < csize; i++){
			CommentDTO cdt = (CommentDTO) cdata.elementAt(i);
			bbsnum = cdt.getBbsnum();
			String userid = cdt.getUserid();
			String username = cdt.getUsername();
			String comment = cdt.getComment();
			String wdate = cdt.getWdate();
		%>
			<tr>						
				<td align="left"> <%=userid %>(<%=username %>) | <%=wdate %></td>		
				
				<td align="right">
				<c:if test="${dto.userid eq cdto.userid }">
					<a href="#" type="button" class="btn btn-success">수정</a>
					<a onclick="return confirm('삭제하시겠습니까?')" type="submit" class="btn btn-danger" >삭제</a>
				</c:if>
				</td>
				
			</tr>
			<tr>
				<td colspan="12" align="left"><%=comment %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
	
   </div>
	
	
	
</div> 
