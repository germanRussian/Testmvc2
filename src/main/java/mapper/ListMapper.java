package mapper;

import java.sql.*;
import java.util.*;

import domain.BoardVO;

public class ListMapper {

	// 목록 생성 메소드
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
		BoardVO vo = null;

		try {

			// 드라이버로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 연결
			conn = DriverManager.getConnection(url, user, password);
			// SQL
			stmt = conn.prepareStatement(sql.toString());
			// 출력
			rs = stmt.executeQuery();

			while (rs.next()) {

				vo = new BoardVO();

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

	// 페이지 목록 메소드
	/* private int[] paging(int page) */

	/*
	 * public int[] paging(BoardVO vo) { String url =
	 * "jdbc:mysql://localhost:3306/smart?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
	 * String user = "root"; String password = "smart";
	 * 
	 * Connection conn = null; PreparedStatement stmt = null; ResultSet rs = null;
	 * 
	 * StringBuffer sql = new StringBuffer();
	 * sql.append(" SELECT count(*) FROM board "); sql.append(" order by num desc");
	 * 
	 * int totalContent = 0; int totalPage = 0; int[] startEnd = null;
	 * 
	 * try {
	 * 
	 * // 드라이버로드 Class.forName("com.mysql.cj.jdbc.Driver"); // 연결 conn =
	 * DriverManager.getConnection(url, user, password); // SQL stmt =
	 * conn.prepareStatement(sql.toString()); // 출력 rs = stmt.executeQuery();
	 * 
	 * stmt = conn.createStatement();
	 * 
	 * // 전체 게시물 갯수로 총 페이지 수 산출 (하나도 없으면 null 리턴)
	 * 
	 * 
	 * while (rs.next()) { totalContent += rs.getInt(1); } if (totalContent == 0) {
	 * return null; }
	 * 
	 * 
	 * totalPage = totalContent / BoardVO.pagePerList; // 최종 전체 페이지 갯수 if
	 * (totalContent % BoardVO.pagePerList > 0) { totalPage++; // 나머지가 있다면 1을 더해줌 }
	 * 
	 * 
	 * 
	 * // 페이징 범위 계산 int startPage, endPage; // 시작과 끝 페이지 startPage = ((vo.getPage()
	 * - 1) / BoardVO.pagingCount) * BoardVO.pagingCount + 1; endPage = startPage +
	 * BoardVO.pagingCount - 1; if (endPage > totalPage) { endPage = totalPage; }
	 * startEnd = new int[2]; // 결과를 전달해줄 배열 startEnd[0] = startPage; startEnd[1] =
	 * endPage;
	 * 
	 * 
	 * 
	 * 
	 * } catch (Exception e) { // TODO: handle exception }finally { try { if (rs !=
	 * null) rs.close(); if (stmt != null) stmt.close(); if (conn != null)
	 * conn.close(); } catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } }
	 * 
	 * return startEnd;
	 * 
	 * }
	 */

}
