package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.RecipeMapper;

@WebServlet("/recipe/updateform.do")
public class UpdateRecipeFormController extends HttpServlet {
	private RecipeMapper mapper;
	public UpdateRecipeFormController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		int no = 2; // request.getParameter();
		request.setAttribute("recipe", mapper.updateRecipe(no));
		request.setAttribute("ingredient", mapper.selectIngredient(no));
		
		request.getRequestDispatcher("updateform.jsp").forward(request, response);
	}
	
}
