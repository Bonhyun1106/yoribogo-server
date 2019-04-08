package kr.co.yoribogo.common.page;

public class PageResult {
	private int count;
	private int pageNo;
	private int beginPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public int getCount() {
		return count;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public PageResult(int pageNo, int count) {
		this.pageNo = pageNo;
		this.count = count;
		setPageInfo();
	}
	
	private void setPageInfo() {
		int lastPage;
		if ((count % 10) == 0) {
			lastPage = count / 10;
		} else {
			lastPage = count / 10 + 1;
		}
		
		// 요청한 페이지 번호에 해당하는 페이지 블럭 구하기
		int tabSize = 10;
		int currTab = (pageNo - 1) / tabSize + 1;
		beginPage = (currTab - 1) * tabSize + 1;
		endPage = (currTab * tabSize > lastPage) ? lastPage
											 	 : currTab * tabSize;
		prev = beginPage != 1;
		next = beginPage != lastPage;
	}
}
