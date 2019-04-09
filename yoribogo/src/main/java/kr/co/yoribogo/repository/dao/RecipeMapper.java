package kr.co.yoribogo.repository.dao;

import java.util.List;

import kr.co.yoribogo.repository.vo.FileVO;
import kr.co.yoribogo.repository.vo.RecipeVO;

public interface RecipeMapper {
	
	/** ================================ 레 시 피 등 록 ============================================ */
	void insertRecipe(RecipeVO rep);
	
	// 파일등록
	void insertFile(FileVO file);
	
	/** ================================ 레 시 피 상 세 보 기 ============================================ */
	RecipeVO selectDetailRecipe(int no);
	
	// 재료 조회
	List<RecipeVO> selectIngredient(int no);
	
	
	/** ================================ 레 시 피 수 정 ============================================ */
	RecipeVO updateRecipe(int no);
	
	// 재료 수정
	List<Integer> updateIngredient(int no);
	
}
