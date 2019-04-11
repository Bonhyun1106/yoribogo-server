package kr.co.yoribogo.common.page;

public class AdminPageResult {
	private int count;
	private int pageNo;
	private int begin;
	private int end;
	private boolean prev;
	private boolean next;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getBegin() {
		return begin;
	}

	public int getEnd() {
		return end;
	}

	public AdminPageResult(int pageNo, int count) {
		this.pageNo = pageNo;
		this.count = count;
		setPageInfo();
	}
	
	private void setPageInfo() {
		int lastPage;
		if ((count % 2) == 0) {
			lastPage = count / 2;
		} else {
			lastPage = count / 2 + 1;
		}
		
		// 요청한 페이지 번호에 해당하는 페이지 블럭 구하기
		int tabSize = 10;
		int currTab = (pageNo - 1) / tabSize + 1;
		begin = (currTab - 1) * tabSize + 1;
		end = (currTab * tabSize > lastPage) ? lastPage
											 	 : currTab * tabSize;
		prev = begin != 1;
		next = end != lastPage;
	}
}
