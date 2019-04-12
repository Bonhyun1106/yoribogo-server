package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.RecipeMapper;

@WebServlet("/recipe/listcomment.do")
public class ListCommentController extends HttpServlet{
	private RecipeMapper mapper;
	public ListCommentController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println(" ------ comment 호출 ------ ");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("Comment no : " + no);
		System.out.println("Comment DB" + mapper.selectComment(no));
		
		
		PrintWriter out = response.getWriter();
		out.println(new Gson().toJson(mapper.selectComment(no)));
		System.out.println(new Gson().toJson(mapper.selectComment(no)));
		out.close();
	}
}
