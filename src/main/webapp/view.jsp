
<%@page import="domain.BoardVO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");

BoardVO vo = (BoardVO)request.getAttribute("vo");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 화면</title>
</head>
<body>
	홈화면 > 게시판 글 상세보기
	<hr>
	<form action="UpdateCon?num=<%=vo.getNum() %>" method="get">
	
		<div>
			<!-- <span> 게시글 번호</span> --> <input type="hidden" name="num" id="num"
				value="<%=vo.getNum()%>" style="border: 0 solid black"
				readonly="readonly">
		</div>
		<div>
			<span>제목 : </span> <input style="width: 450px; border: 0 solid black"
				type="text" name="title" value="<%=vo.getTitle()%>" readonly="readonly">
		</div>
		<hr>
		<div>
			<span>내용</span><br> 
			<textarea rows="10" cols="100"  name="content" readonly="readonly"><%=vo.getContent()%></textarea>
			
			
		</div>
		<hr>
		<div>
			<span>작성자</span> <input style="width: 450px; border: 0 solid black"
				type="text" name="writer" value="<%=vo.getWriter()%>"	readonly="readonly">
		</div>
		
		<br>
		<button>글 수정</button>
	</form>
	<br>

	<button onclick="location.href='ListCon'">목록</button>







</body>
</html>