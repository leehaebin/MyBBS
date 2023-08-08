<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id = "mem" class="board.MemberDDL" scope="page" />
<jsp:useBean id = "mdto" class="board.MembersDTO" scope="page" />
<jsp:useBean id = "bbs" class="board.BbsDDL" scope="page" />
<jsp:useBean id = "bdto" class="board.BBSDTO" scope="page" />
<%!
	int sNum = 1; //한페이지당 보여줄 목록 수
	int eNum = 5; //한 블럭당 보여줄 페이지 수
%>

<%
	Vector data = bbs.gethitSelect(bdto);
	int size = data.size();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-6 mb-3 p-5">
				<h2 class="text-center mb-4">공지사항</h2>
				<ol class="list-group list-group-numbered">
					<%
						for(int i=0; i< 5; i++){
					%>
					<li class="list-group-item list-group-item-action">
						<a href="#"> 공지사항 1입니다. </a>
					</li>
		           <%
		             }
		           %>  
				</ol>
           
				<h2 class="text-center mb-4 mt-4">자유게시판 인기글</h2>
					<ol class="list-group list-group-numbered">
						<%
								for(int i=0; i < size; i++){
									BBSDTO bdt = (BBSDTO) data.elementAt(i);
									int bbsnum = bdt.getBbsnum();
									String title = bdt.getTitle();
						%>
						<li class="list-group-item list-group-item-action">
							<a href="/board/index.jsp?fname=bbsview&bbsnum=<%=bbsnum%>"> <%=title %> </a>
						</li>    
						<%
							}
						%>  
           			</ol>
			</div>
			<div class="col-md-6 col-6 my-5">
				<h2 class="text-center mb-4">갤러리</h2>
				<div class="row">
					<div class="col-md-4 col-4">
						<figure class="card card-product">
							<div class="img-wrap"><img src="images/01.png" class="img-thumbnail"></div>
							<figcaption class="info-wrap p-3">
								<h5 class="title">Another name of item</h5>
								<p class="desc">Some small description goes here</p>
							</figcaption>
						</figure>                  
					</div>
					<div class="col-md-4 col-4">
						<figure class="card card-product">
							<div class="img-wrap"><img src="images/02.png"  class="img-thumbnail"></div>
							<figcaption class="info-wrap p-3">
								<h5 class="title">Another name of item</h5>
								<p class="desc">Some small description goes here</p>
							</figcaption>
						</figure>                  
					</div>
					<div class="col-md-4 col-4">
						<figure class="card card-product">
							<div class="img-wrap"><img src="images/03.png"  class="img-thumbnail"></div>
							<figcaption class="info-wrap p-3">
								<h5 class="title">Another name of item</h5>
								<p class="desc">Some small description goes here</p>
							</figcaption>
						</figure>                  
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>