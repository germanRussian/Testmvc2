
<%@page import="domain.BoardVO"%>
<%@page import="java.util.*"%>

<%@page import="java.sql.*"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%

Collection<BoardVO> list = (Collection)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목 록 화 면</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>제 목</th>
				<th>작 성 자</th>
				<th>작 성 일</th>
			</tr>
		</thead>
		<tbody>
			<%
			{
				Iterator<BoardVO> it = list.iterator();
				while (it.hasNext()) {
					BoardVO vo = it.next();
			%>
			<tr>
				<th><%=vo.getNum()%></th>
				<th><a href="ViewCon?num=<%=vo.getNum()%>"><%=vo.getTitle()%></a></th>
				<th><%=vo.getWriter()%></th>
				<th><%=vo.getWriterDate()%></th>
			</tr>
			<%
			}
			}
		%>		
		</tbody>
	</table>
	<!-- jsp -->
	<button onclick="location.href='WriterCon'">글 작성하기</button>
	
</body>
</html>