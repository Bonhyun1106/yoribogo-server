package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.RecipeMapper;

@WebServlet("/recipe/deletecomment.do")
public class DeleteCommentController extends HttpServlet{
	private RecipeMapper mapper;
	public DeleteCommentController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("---- delete comment Controller ---- ");
		
		// 삭제할 댓글 번호
		int commNo = Integer.parseInt(request.getParameter("commentNo"));
		System.out.println("삭제 댓글 : " + commNo);
		mapper.deleteComment(commNo);
	}
}
