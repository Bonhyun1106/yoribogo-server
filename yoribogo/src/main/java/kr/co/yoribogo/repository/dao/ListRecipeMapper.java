package kr.co.yoribogo.repository.dao;

import java.util.List;

import kr.co.yoribogo.repository.vo.MemberVO;
import kr.co.yoribogo.repository.vo.PageVO;
import kr.co.yoribogo.repository.vo.RecipeVO;

public interface ListRecipeMapper {
	List<RecipeVO> selectRecipe(PageVO pageVO);
	int selectRecipeCount();
	List<MemberVO> selectMember();
	List<RecipeVO> selectRecipeSortByRegDateASC(PageVO pageVO);
	
}
