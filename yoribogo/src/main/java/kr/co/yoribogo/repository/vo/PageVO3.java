package kr.co.yoribogo.repository.vo;

public class PageVO3 {
	private int pageNo = 1;
	private String sortType;
	private int memNo;
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (this.pageNo - 1) * 9 + 1;
	}
	public int getEnd() {
		return this.pageNo * 9;
	}
}
