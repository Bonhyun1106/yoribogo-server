package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		PrintWriter out = response.getWriter();
		System.out.println(" --- Like 서블릿 호출 --- ");
		System.out.println("------------ memNo : "+request.getParameter("memNo"));
		System.out.println("------------ recipeNo : "+request.getParameter("recipeNo"));
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		
		LikeVO like = new LikeVO();
		like.setMemNo(memNo);
		like.setRecipeNo(recipeNo);
				
		// 중복체크 0이면 없는 것..
		int likeCnt = mapper.checkLikeCnt(like);
		System.out.println("likeCnt 결과!!!! " + likeCnt);
		if(likeCnt == 0) {
			System.out.println("0번. 중복없음.");
			mapper.insertLikeCnt(like);
			out.println(0);
			return;
		}
		System.out.println("1번. 중복있음");
		out.println(1);
		out.close();
		
	}
}
