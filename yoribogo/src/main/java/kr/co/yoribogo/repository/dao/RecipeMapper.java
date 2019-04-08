package kr.co.yoribogo.repository.dao;

import kr.co.yoribogo.repository.vo.FileVO;
import kr.co.yoribogo.repository.vo.RecipeVO;

public interface RecipeMapper {
	/** ================================ 게 시 글 ============================================ */
	 void insertRecipe(RecipeVO rep);
	
	
	/** ================================ 파 일 ============================================ */
	 void insertFile(FileVO file);
}
