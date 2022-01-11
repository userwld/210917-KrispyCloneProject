package customer;

public class CustomerList {
	private int pageNumber;
	private int record;
	private int scroll;
	private int totalPage;
	private int start;
	
	public CustomerList() {
		setScroll();
	}
	// 현재 페이지 번호
	public void setPageNumber(String pn) {
		if(pn == "" || pn == null)
			this.pageNumber = 1;
		else
			this.pageNumber = Integer.parseInt(pn);
		setStart();
	}
	// 게시글 시작인덱스
	private void setStart() {
		start = (pageNumber - 1) * scroll;		
	}
	
	// 총 게시글 수
	public void setRecord(int record) {
		this.record = record;
		setTotalPage();
	}
	// 한 화면에 출력할 게시글 수
	public void setScroll() {
		this.scroll = 4;
	}
	// 총 페이지
	private void setTotalPage() {
		if(record > 0) {
			if(record % scroll == 0)
				totalPage = record / scroll;
			else 
				totalPage = (int)Math.ceil(record / (double)scroll);
		}
		
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public int getRecord() {
		return record;
	}
	public int getScroll() {
		return scroll;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getStart() {
		return start;
	}
	
}
