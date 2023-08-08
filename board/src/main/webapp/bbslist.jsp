<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="java.util.*, board.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id = "mem" class="board.MemberDDL" scope="page" />
<jsp:useBean id = "mdto" class="board.MembersDTO" scope="page" />
<jsp:useBean id = "bbs" class="board.BbsDDL" scope="page" />
<jsp:useBean id = "bdto" class="board.BBSDTO" scope="page" />
<%!
	int listNum = 10; //한페이지당 보여줄 목록 수
	int pageNum = 15; //한 블럭당 보여줄 페이지 수
%>
<%
   String pg = request.getParameter("page");
   int mypg = 1;
   try{
	   mypg = Integer.parseInt(pg);
	   if(mypg < 1) mypg = 1;
   }catch(Exception e){
	   mypg = 1;
   }
   int limitNum = (mypg -1)*listNum;
   
   Vector data = bbs.getSelect(limitNum, listNum);
   int maxColumn = bbs.getAllSelect();
   int size = data.size();  
 
   /*
      1. 전체페이지 수  2. 전체블록수  3. 현재 블록번호 4. 블록당 시작번호 5. 블록당 마지막 번호
   */
   int totalPage = (int) Math.ceil(maxColumn / (double) listNum);
   int totalBlock = (int) Math.ceil(totalPage / (double) pageNum);
   int nowBlock = (int) Math.ceil(mypg / (double)pageNum);
   int startNum = (nowBlock - 1)*pageNum + 1;
   int endNum = nowBlock * pageNum;
   if(endNum > totalPage) endNum = totalPage;
%> 

<div class="container lmember">
   <h2 class="mt-3 mb-5 text-center">자유게시판</h2>
   <div class="text-end">
       총 게시글 : <%=maxColumn %>개/<%=totalPage%>페이지.
   </div>
   <div class="row">
      <table class="table table-striped memberstbl">
         <thead>
            <tr class="text-center">
               <th class="col-xs-1">번호</th>
               <th class="col-xs-5">제목</th>
               <th class="col-xs-3">작성자</th>
               <th class="col-xs-1">조회수</th>
               <th class="col-xs-2">작성일자</th>
            </tr>
         </thead>
         <tbody>
<%  

		for(int i=0; i < size; i++){
		BBSDTO dt = (BBSDTO) data.elementAt(i);
		int bbsnum = dt.getBbsnum();
		String title = dt.getTitle();
		String userid = dt.getUserid();
		String username = dt.getUsername();
		String content = dt.getContent();
		int count = dt.getCount(); 
		String wdate = dt.getWdate();
%>

       <tr class="text-center">
          <td><%=bbsnum %></td>
          <td><a href="/board/index.jsp?fname=bbsview&bbsnum=<%=bbsnum%>"><%=title %></a></td>
          <td><%=userid %>(<%=username %>)</td>
          <td><%=count %></td>
          <td><%=wdate %></td>
       </tr>
<%
         }
%>
         </tbody>

       </table>
       
   </div>
   
   <div class="mt-2 row ">
       <ul class="pagination justify-content-center mb-2">
          <%
             //이전 페이지
             if(startNum > 1){
            	 int prevPage = startNum -1;
            	 out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"?fname=bbslist&page="+prevPage+"\">이전</a></li>");
             }else{
            	 out.print("<li class=\"page-item\"><a class=\"page-link text-muted\" href=\"javascript:void(0)\">이전</a></li>");
             }
           
             //페이지 출력
             for(int i = startNum; i<= endNum; i++) {
            	 String act="";
            	 if(mypg == i) act = "active";
          %>
             <li class="page-item <%=act %>"><a class="page-link" href="?fname=bbslist&page=<%=i %>"><%=i %></a></li>
          <%
             }
             
             //다음 페이지
             if(endNum < totalPage) {
            	 int nextPage=endNum + 1;
            	 out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"?fname=bbslist&page="+nextPage+"\">다음</a></li>");
             }else{
            	 out.print("<li class=\"page-item\"><a class=\"page-link text-muted\" href=\"javascript:void(0)\">다음</a></li>");
             }
          %>
       </ul>
   </div>
   
   <div><a href="index.jsp?fname=bbswrite"class="btn btn-primary px-5"> 글쓰기 </a></div>
</div>
