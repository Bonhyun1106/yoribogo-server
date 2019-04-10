package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.RecipeMapper;

@WebServlet("/recipe/detail.do")
public class DetailRecipeController extends HttpServlet {
	private RecipeMapper mapper;
	public DetailRecipeController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		int no = 36; // 가데이터. request.getParameter("no");
		
		// 게시글 정보
		request.setAttribute("recipe", mapper.selectDetailRecipe(no));
		// 게시글 이미지
		request.setAttribute("image", mapper.selectImageBlock(no));
		System.out.println(mapper.selectImageBlock(no).toString());
		// 재료 정보
		request.setAttribute("ingredient", mapper.selectIngredient(no));
		System.out.println("ingredient="+mapper.selectIngredient(no));
		request.getRequestDispatcher("detail.jsp").forward(request, response);
	}
}
