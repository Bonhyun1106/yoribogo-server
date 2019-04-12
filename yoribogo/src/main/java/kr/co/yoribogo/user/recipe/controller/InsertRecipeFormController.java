package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.RecipeMapper;
import kr.co.yoribogo.repository.dao.SignupMapper;
import kr.co.yoribogo.repository.vo.CategoryVO;

@WebServlet("/recipe/insertrecipeform.do")
public class InsertRecipeFormController extends HttpServlet {
	RecipeMapper mapper;
	public InsertRecipeFormController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		List<CategoryVO> ingredientList = mapper.getIngredientList();
		HttpSession session = request.getSession();
		session.setAttribute("ingredientList", ingredientList);
		System.out.println("ingredientList size : "+ingredientList.size());
		request.getRequestDispatcher("insertform.jsp").forward(request, response);
		
		
	}
}
