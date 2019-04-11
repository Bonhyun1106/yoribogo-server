package kr.co.yoribogo.repository.dao;

import java.util.List;

import kr.co.yoribogo.repository.vo.RecipeVO;

public interface SearchMapper {
	List<RecipeVO> selectDetail(RecipeVO recipeVO);
	List<RecipeVO> searchRecipe(String title);
}
