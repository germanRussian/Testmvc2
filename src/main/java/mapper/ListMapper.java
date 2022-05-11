package mapper;

import java.sql.*;
import java.util.*;


import domain.BoardVO;

public class ListMapper {

	public Collection<BoardVO> read() {
		


		String url = "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String user = "root";
		String password = "smart";

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT num, title, writer, writerDate FROM board ");
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
		return list;
	}

}
