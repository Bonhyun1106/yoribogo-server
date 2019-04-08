package kr.co.yoribogo.repository.dao;

import kr.co.yoribogo.repository.vo.BannerVO;
import kr.co.yoribogo.repository.vo.NoticeVO;

public interface AdminMapper {
	
	
	//1. 공지사항 작성
	public void insertNotice(NoticeVO notice);

	//2. 배너등록
	public void insertBanner(BannerVO banner);
}
