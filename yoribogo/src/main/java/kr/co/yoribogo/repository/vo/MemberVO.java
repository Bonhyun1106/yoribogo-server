package kr.co.yoribogo.repository.vo;

import java.util.Date;

public class MemberVO {
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPassword() {
		return memPassword;
	}
	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemFavor1() {
		return memFavor1;
	}
	public void setMemFavor1(String memFavor1) {
		this.memFavor1 = memFavor1;
	}
	public String getMemFavor2() {
		return memFavor2;
	}
	public void setMemFavor2(String memFavor2) {
		this.memFavor2 = memFavor2;
	}
	public String getMemFavor3() {
		return memFavor3;
	}
	public void setMemFavor3(String memFavor3) {
		this.memFavor3 = memFavor3;
	}
	public String getMemProfile() {
		return memProfile;
	}
	public void setMemProfile(String memProfile) {
		this.memProfile = memProfile;
	}
	public String getMemReportCount() {
		return memReportCount;
	}
	public void setMemReportCount(String memReportCount) {
		this.memReportCount = memReportCount;
	}
	public Date getMemJoinDate() {
		return memJoinDate;
	}
	public void setMemJoinDate(Date memJoinDate) {
		this.memJoinDate = memJoinDate;
	}
	private int memNo;
	private String memId;
	private String memPassword;
	private String memEmail;
	private String memFavor1;
	private String memFavor2;
	private String memFavor3;
	private String memProfile;
	private String memReportCount;
	private Date memJoinDate;
	
}
