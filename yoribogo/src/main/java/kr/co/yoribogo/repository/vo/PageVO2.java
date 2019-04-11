package kr.co.yoribogo.repository.vo;

public class PageVO2 {
	private int pageNo = 1;
	private String sortType;
	private String memId;
	
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
		return (this.pageNo - 1) * 20 + 1;
	}
	public int getEnd() {
		return this.pageNo * 20;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
}
