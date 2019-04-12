package kr.co.yoribogo.repository.dao;

import java.util.List;

import kr.co.yoribogo.repository.vo.LikeRecipeVO;
import kr.co.yoribogo.repository.vo.MemberVO;
import kr.co.yoribogo.repository.vo.PageVO;
import kr.co.yoribogo.repository.vo.PageVO3;
import kr.co.yoribogo.repository.vo.RecipeVO;

public interface ListRecipeMapper {
	List<RecipeVO> selectRecipe(PageVO pageVO);
	List<LikeRecipeVO> selectLikeRecipe(PageVO3 pageVO3);
	int selectRecipeCount();
	List<MemberVO> selectMember();

}
