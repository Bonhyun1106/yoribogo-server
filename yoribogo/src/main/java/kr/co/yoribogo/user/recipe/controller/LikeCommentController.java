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

@WebServlet("/recipe/likecomment.do")
public class LikeCommentController extends HttpServlet {
	private RecipeMapper mapper;
	public LikeCommentController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	// 중복확인 후 mapper에 cnt추가.
	// 매개변수로 좋아요 개수 넘겨주기..
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		System.out.println(" --- LikeComment 서블릿 호출 --- ");
		System.out.println("---- memNo : " + request.getParameter("memNo"));		// 로그인 회원 번호
		System.out.println("---- recipeNo : " + request.getParameter("commentNo"));	// 코멘트번호
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int commNo = Integer.parseInt(request.getParameter("commentNo"));
	
	}
	
	
	
}
