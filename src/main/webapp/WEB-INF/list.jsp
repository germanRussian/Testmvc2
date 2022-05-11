
<%@page import="domain.BoardVO"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%

request.setCharacterEncoding("UTF-8");


String url = "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

StringBuffer sql = new StringBuffer();
sql.append(" SELECT num, title, writer, writerDate FROM board ");
/* sql.append(" WHERE writer  "); */
sql.append(" order by num desc");

ArrayList<BoardVO> list = new ArrayList<BoardVO>();

try {

	
	//드라이버로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	//연결
	conn = DriverManager.getConnection(url, user, password);
	//SQL
	stmt = conn.prepareStatement(sql.toString());
	// 출력
	rs = stmt.executeQuery();

	while (rs.next()) {

		BoardVO vo = new BoardVO();

		vo.setNum(rs.getInt("num"));
		vo.setTitle(rs.getString("title"));
		vo.setWriter(rs.getString("writer"));
		vo.setWriterDate(rs.getTimestamp("writerDate"));
		list.add(vo);

	}

} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} finally {
	try {
		if (rs != null)
	rs.close();
		if (stmt != null)
	stmt.close();
		if (conn != null)
	conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
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
				<th><a href="view.jsp?num=<%=vo.getNum()%>"><%=vo.getTitle()%></a></th>
				<th><%=vo.getWriter()%></th>
				<th><%=vo.getWriterDate()%></th>
			</tr>
			<%
			}
			}
		%>		
		</tbody>
	</table>
	<button onclick="location.href='writer.jsp'">글 작성하기</button>
	
</body>
</html>