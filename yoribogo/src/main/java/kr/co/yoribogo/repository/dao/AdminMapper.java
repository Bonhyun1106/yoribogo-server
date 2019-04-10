package kr.co.yoribogo.repository.dao;

import java.util.List;

import kr.co.yoribogo.repository.vo.BannerVO;
import kr.co.yoribogo.repository.vo.CommentVO;
import kr.co.yoribogo.repository.vo.MemberVO;
import kr.co.yoribogo.repository.vo.NoticeVO;
import kr.co.yoribogo.repository.vo.PageVO;
import kr.co.yoribogo.repository.vo.RecipeVO;

public interface AdminMapper {
	
	
	// ===================1. 회원 관리 ==============================	
	//1. 회원 조회
	public List<MemberVO> selectListMember(PageVO page);
	
	//2. 경고 회원 조회
	public List<MemberVO> selectListReportMember(PageVO page);
	
	//1-1. 페이징
	public int selectMemberCount();
	
	//1-2. 회원 검색
	public List<MemberVO> selectListId(PageVO page);

	// ===================2. 게시글 관리 =============================
	//1. 공지사항 작성
	public void insertNotice(NoticeVO notice);

	//2. 배너등록
	public void insertBanner(BannerVO banner);
	
	//3. 레시피 게시글 조회
	public List<RecipeVO> selectListRecipe(PageVO page);
	
	//3-1. 페이징
	public int selectRecipeCount();
	
	// ===================3. 댓글 관리 ==============================
	//1. 댓글 관리
	public List<CommentVO> selectListComment(PageVO page);
	
	//2. 베스트 댓글 조회
	public List<CommentVO> selectListBestComment(PageVO page);
	
	//1-1. 페이징
	public int selectCommentCount();
}
