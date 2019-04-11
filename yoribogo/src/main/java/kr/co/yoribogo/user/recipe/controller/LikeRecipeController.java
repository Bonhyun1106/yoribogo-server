package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.RecipeMapper;
import kr.co.yoribogo.repository.vo.LikeVO;

@WebServlet("/recipe/like.do")
public class LikeRecipeController extends HttpServlet{
	private RecipeMapper mapper;
	public LikeRecipeController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" --- Like 서블릿 호출 --- ");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
//		int memNo = 1;
		int no = Integer.parseInt(request.getParameter("recipeNo"));
//		int no = 42;
		
		LikeVO like = new LikeVO();
		like.setMemNo(memNo);
		like.setRecipeNo(no);
		mapper.insertLikeCnt(like);
		
		
	}
}
