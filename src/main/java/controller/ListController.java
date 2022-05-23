package controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.BoardInfo;
import domain.BoardVO;


import service.ListServiceImpl;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/ListCon")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 게시물 목록
		ListServiceImpl service = new ListServiceImpl();
		
		//페이징
		int pageCount = 5;//페이지 수
		int pageRow = 5;//페이지당 보여지는 게시물 수
		int pageNum = 1;
		int pagingNum = 5;
		
		if(request.getParameter("pageNum") != null){
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		//시작 페이지 넘버링
		int startPage = (pageNum-1)*pageRow;
		
		//페이징
		int startNum = (((pageNum-1)/pagingNum)*pagingNum)+1;
		
		BoardInfo boardInfo = service.boardInfo(startPage, pageRow);
		
		
		// 글 넘버링
		int totalNum = boardInfo.getTotalRow()-((pageNum-1)*pageRow);
		
		request.setAttribute("pagingNum", pagingNum);
		request.setAttribute("startNum", startNum);
		
		request.setAttribute("pageRow", pageRow);
		
		request.setAttribute("totalNum", totalNum);
		request.setAttribute("boardInfo", boardInfo);
		request.setAttribute("pageNum", pageNum);
		//
		
		
		
//		Collection<BoardVO> list = service.read();//목록
//		int totalRow = service.totalRow();//페이징 처리 - 갯수 확인
//		
//		
//		request.setAttribute("list", list);//목록
//		request.setAttribute("totalRow", totalRow);//페이징 처리 - 갯수 확인
//		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
