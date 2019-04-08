package kr.co.yoribogo.repository.dao;

import kr.co.yoribogo.repository.vo.FileVO;
import kr.co.yoribogo.repository.vo.RecipeVO;

public interface RecipeMapper {
	/** ================================ 레 시 피 등 록 ============================================ */
	void insertRecipe(RecipeVO rep);
	
	// 파일등록
	void insertFile(FileVO file);
	
	/** ================================ 레 시 피 상 세 보 기 ============================================ */
	RecipeVO selectDetailRecipe(int no);

}
