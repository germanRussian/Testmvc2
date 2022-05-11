<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");
/* String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer"); */

String url = "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

StringBuffer sql = new StringBuffer();
sql.append(" SELECT *  FROM board");
sql.append(" where num = ? ");

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String num2 = "";
String title2 = "";
String content2 = "";
String writer2 = "";

/* DB정보를 가져와서 화면에 출력*/
try {
	//드라이버로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	//연결
	conn = DriverManager.getConnection(url, user, password);
	//SQL
	stmt = conn.prepareStatement(sql.toString());
	//값 설정(쿼리 문 '?'에 들어 갈 값)
	stmt.setString(1, num);
	// 출력
	rs = stmt.executeQuery();

	/* 한건에 해당하는 것만 내용을 가져올 것이기 때문에 if문 사용 while문은 여러건을 가져올때.*/
	if (rs.next()) {

		num2 = rs.getString("num");
		title2 = rs.getString("title");
		content2 = rs.getString("content");
		writer2 = rs.getString("writer");

	}
} catch (Exception e) {
	e.getLocalizedMessage();

} finally {
	//닫기
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();

}
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
	<table border="">
		<form action="updateAct.jsp" method="post">
			<div>
				<!-- <span> 게시글 번호</span> --> <input type="hidden" name="num" id="num"
					value="<%=num2%>" style="border: 0 solid black" readonly="readonly">
			</div>
			<div>
				<span>제목 : </span> <input
					style="width: 450px; border: 0 solid black" type="text"
					name="title" value="<%=title2%>">
			</div>
			<hr>
			<div>
				<span>내용</span><br> <textarea rows="10" cols="100"  name="content" ><%=content2%></textarea>
			</div>
			<hr>
			<div>
				<span>작성자</span> <input style="width: 450px; border: 0 solid black"
					type="text" name="writer" value="<%=writer2%>" readonly="readonly">
			</div>
			<br>
			<button>수정하기</button>
		</form>
		<br>
			<br>
			<button onclick="location.href='list.jsp'">목록</button>
</body>
</html>