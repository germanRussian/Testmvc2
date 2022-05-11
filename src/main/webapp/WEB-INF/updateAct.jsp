<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%



request.setCharacterEncoding("UTF-8");//데이터 한글 깨짐 방지

String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");

String num = request.getParameter("num"); 


//JDBC 프로그래밍
String url = "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";


StringBuffer sql = new StringBuffer();
sql.append(" UPDATE board SET title = ?, content = ?, writer = ?, writerDate = (now()) ");
sql.append(" where num = ? ");




Connection conn = null;
PreparedStatement stmt = null;
int res = 0;


try {
	//드라이버로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	//연결
	conn = DriverManager.getConnection(url, user, password);
	//SQL
	stmt = conn.prepareStatement(sql.toString());
	//값 설정(쿼리 문 '?'에 들어 갈 값)
	stmt.setString(1, title);
	stmt.setString(2, content);
	stmt.setString(3, writer);
	
	stmt.setString(4, num);
	
	// 출력
	res = stmt.executeUpdate();

} catch (Exception e) {
e.getLocalizedMessage();
} finally {
	//닫기
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
}
%>



<script>
<%
if(res <= 0){
%>
	alert("게시글 수정에 실패했습니다.");
	history.go(-1);
<%
} else {
%>
	location.href="list.jsp";
<%	
}
%>
</script>

