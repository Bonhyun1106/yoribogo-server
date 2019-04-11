package kr.co.yoribogo.repository.dao;

import java.util.List;

import kr.co.yoribogo.repository.vo.CommentVO;
import kr.co.yoribogo.repository.vo.FileVO;
import kr.co.yoribogo.repository.vo.RecipeVO;

public interface RecipeMapper {
	
	/** ===== 등 록 ===== */
	void insertRecipe(RecipeVO rep);
	
	// 파일등록
	void insertFile(FileVO file);
	
	/** ===== 상 세 보 기 ===== */
	RecipeVO selectDetailRecipe(int no);
	
	// 재료 조회
	List<RecipeVO> selectIngredient(int no);
	
	// 이미지 파일 조회
	List<FileVO> selectImageBlock(int no);
	
	/** ===== 수 정 ===== */
	RecipeVO updateRecipe(int no);
	
	// 재료 수정
	List<Integer> updateIngredient(int no);
	
	
	
	/** ================================ 댓 글  ============================================ */
	List<CommentVO> selectComment(int no);
	
	// 댓글 등록
	int insertComment(CommentVO comment);


}
