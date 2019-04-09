package kr.co.yoribogo.repository.dao;

import java.util.List;

import kr.co.yoribogo.repository.vo.BannerVO;
import kr.co.yoribogo.repository.vo.NoticeVO;
import kr.co.yoribogo.repository.vo.PageVO;
import kr.co.yoribogo.repository.vo.RecipeVO;

public interface AdminMapper {
	
	
	//1. 공지사항 작성
	public void insertNotice(NoticeVO notice);

	//2. 배너등록
	public void insertBanner(BannerVO banner);
	
	//3. 레시피 게시글 조회
	public List<RecipeVO> selectRecipe(PageVO page);
}
