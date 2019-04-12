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

@WebServlet("/recipe/deletecomment.do")
public class DeleteCommentController extends HttpServlet{
	private RecipeMapper mapper;
	public DeleteCommentController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int commWriterNo = Integer.parseInt(request.getParameter("commWriter"));
		
		System.out.println("---- delete comment Controller ---- ");
		System.out.println("------------ memNo : "+request.getParameter("memNo"));
		System.out.println("------------ commWriter : "+request.getParameter("commWriter"));
		
		PrintWriter out = response.getWriter();

		// 삭제할 댓글 번호
		int commNo = Integer.parseInt(request.getParameter("commNo"));
		System.out.println("삭제 댓글번호 : " + commNo);
		
		// 조건 체크
		if(memNo == commWriterNo) {
			mapper.deleteComment(commNo);
			out.println(1);
			return;
		};
		out.println(0);
		out.close();
	}
}
