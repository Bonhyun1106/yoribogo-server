package kr.co.yoribogo.repository.vo;
import java.util.Date;

public class CommentVO {
	private int commentNo;
	private int no;
	private int memNo;
	private int commentLikeCnt;
	private Date commentRegDate;
	private String commentContent;
	private int commentReportCount;
	private String memId;
	private String title;
	
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getCommentLikeCnt() {
		return commentLikeCnt;
	}
	public void setCommentLikeCnt(int commentLikeCnt) {
		this.commentLikeCnt = commentLikeCnt;
	}
	public Date getCommentRegDate() {
		return commentRegDate;
	}
	public void setCommentRegDate(Date commentRegDate) {
		this.commentRegDate = commentRegDate;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getCommentReportCount() {
		return commentReportCount;
	}
	public void setCommentReportCount(int commentReportCount) {
		this.commentReportCount = commentReportCount;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
