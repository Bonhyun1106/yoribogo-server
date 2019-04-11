package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.RecipeMapper;
import kr.co.yoribogo.repository.vo.CommentVO;

@WebServlet("/recipe/insertcomment.do")
public class InsertCommentController extends HttpServlet{
	private RecipeMapper mapper;
	public InsertCommentController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8"); 
		
		System.out.println("---- insert comment 호출 ---- ");
		System.out.println("!!!!!!!!!!!!!!!!!!" + request.getParameter("commContent"));
		
		CommentVO comm = new CommentVO();
//		comm.setNo(Integer.parseInt(request.getParameter("no")));
		comm.setNo(42);	// 가데이터  글번호42
//		comm.setMemNo(Integer.parseInt(request.getParameter("memNo")));
		comm.setMemNo(1);	// 가데이터 회원번호 1
		comm.setCommentContent(request.getParameter("commContent"));
		mapper.insertComment(comm);
	}
}
