package kr.co.yoribogo.repository.dao;

import java.util.List;

import kr.co.yoribogo.repository.vo.MemberVO;
import kr.co.yoribogo.repository.vo.RecipeVO;

public interface LoginMapper {
	
	MemberVO selectLogin(MemberVO member);
	List<RecipeVO> selectRecipeByUser(int memNo);
	List<RecipeVO> selectLikeRecipeByUser(int memNo);
	public String checkPassword(String memId);
	//로그인한 계정의 등록 레시피
}
