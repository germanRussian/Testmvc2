<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
</head>
<body>
	홈화면 > 게시판 글쓰기
	<hr>
	<form action="writerAct.jsp" method="post">
		


		<div>
			<span>제목 : </span>
			<input style="width: 450px; border: 0 solid black" type="text" name="title">
		</div>
		<hr>
		<div>
			<span>내용</span><br>
			<textarea rows="10" cols="100"  name="content"></textarea>
			
		</div>
		<hr>
		<div>
			<span>작성자 : </span>
			<input style="width: 450px; border: 0 solid black" type="text" name="writer">
		</div>
		<br>
		<button>글 쓰 기.</button>
	</form>
</body>
</html>