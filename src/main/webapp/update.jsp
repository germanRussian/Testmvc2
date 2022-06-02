<%@page import="domain.BoardVO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
BoardVO vo = (BoardVO) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>
</head>
<body>
	홈화면 > 게시판 수정하기
	<hr>

	<form action="UpdateCon" method="post" enctype="multipart/form-data">
		<div>
			<!-- <span> 게시글 번호</span> -->
			<input type="hidden" name="num" id="num" value="<%=vo.getNum()%>"
				style="border: 0 solid black" readonly="readonly"> <input
				type="hidden" name="rsfn" id="rsfn"
				value="<%=vo.getRealFileName()%>" style="border: 0 solid black"
				readonly="readonly">
		</div>
		<div>
			<span>제목 : </span> <input style="width: 450px; border: 0 solid black"
				type="text" name="title" value="<%=vo.getTitle()%>">
		</div>
		<hr>
		<div>
			<span>내용</span><br>
			<textarea rows="10" cols="100" name="content"><%=vo.getContent()%></textarea>
		</div>
		<hr>
		<div>
			<span>작성자</span> <input style="width: 450px; border: 0 solid black"
				type="text" name="writer" value="<%=vo.getWriter()%>"
				readonly="readonly">
		</div>
		<hr>
		<div>
			
			기존 파일 : <a href="download.jsp?rsfn=<%=vo.getRealSaveFileName()%>&rfn=<%=vo.getRealFileName()%>"><%=vo.getRealFileName()%></a>
			<br>
			수정 파일 : <input type="file" name="updatefile" class="form-control" value="<%=vo.getRealFileName()%>"> 
		</div>
		</div>
		<hr>
		<br>
		<button onclick="location.href='ListCon'" type="button">목록</button>
		<button>수정</button>


	</form>


</body>
</html>