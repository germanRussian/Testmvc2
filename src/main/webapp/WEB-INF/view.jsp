
<%@page import="domain.BoardVO"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
/* DB연결 */
request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");
/* 
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");
 */


String url = "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";


Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

StringBuffer sql = new StringBuffer();
sql.append(" SELECT *  FROM board");
sql.append(" where num = ? "); 


String num1 = "";
String title1 = "";
String content1 = "";
String writer1 = "";


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

	/* BoardVO vo = null; */
	
	
	/* 한건에 해당하는 것만 내용을 가져올 것이기 때문에 if문 사용 while문은 여러건을 가져올때.*/
	if (rs.next()) {
		
		num1 = rs.getString("num");
		title1 = rs.getString("title");
		content1 = rs.getString("content");
		writer1 = rs.getString("writer");
		
		
		/* vo = new BoardVO();

		vo.setNum(rs.getInt("num"));
		vo.setTitle(rs.getString("title"));
		vo.setWriter(rs.getString("writer"));
		vo.setWriteDate(rs.getTimestamp("writeDate")); */
		
		
		
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
<title>상세보기 화면</title>
</head>
<body>
	홈화면 > 게시판 글 상세보기
	<hr>
	<form action="update.jsp" method="post">
	
		<div>
			<!-- <span> 게시글 번호</span> --> <input type="hidden" name="num" id="num"
				value="<%=num1%>" style="border: 0 solid black"
				readonly="readonly">
		</div>
		<div>
			<span>제목 : </span> <input style="width: 450px; border: 0 solid black"
				type="text" name="title" value="<%=title1%>" readonly="readonly">
		</div>
		<hr>
		<div>
			<span>내용</span><br> 
			<textarea rows="10" cols="100"  name="content" readonly="readonly"><%=content1%></textarea>
			
			
		</div>
		<hr>
		<div>
			<span>작성자</span> <input style="width: 450px; border: 0 solid black"
				type="text" name="writer" value="<%=writer1%>"	readonly="readonly">
		</div>
		
		<br>
		<button>글 수정</button>
	</form>
	<br>
	<button onclick="location.href='list.jsp'">목록</button>







</body>
</html>