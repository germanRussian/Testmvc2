package domain;

import java.sql.Timestamp;

public class BoardVO {

	private int num;
	private String title;
	private String content;
	private String writer;
	private Timestamp writerDate;
	//-----------------------------------------------------
	
	
	// 한 화면에 보여줄 리스트 갯수, 페이징 범위의 갯수
	public static final int pagePerList = 10;
	public static final int pagingCount = 10;
	private int page;
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	
	
	//-------------------------------
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getWriterDate() {
		return writerDate;
	}

	public void setWriterDate(Timestamp writerDate) {
		this.writerDate = writerDate;
	}

}
