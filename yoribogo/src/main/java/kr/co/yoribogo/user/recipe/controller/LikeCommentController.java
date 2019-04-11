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
import kr.co.yoribogo.repository.vo.LikeCommentVO;

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
		System.out.println("---- commentNo : " + request.getParameter("commentNo"));	// 코멘트번호
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int commNo = Integer.parseInt(request.getParameter("commentNo"));
		
		LikeCommentVO likecomment = new LikeCommentVO();
		likecomment.setMemNo(memNo);
		likecomment.setCommentNo(commNo);
				
		// 중복체크 0이면 없는 것..
		int likeCommCnt = mapper.checkLikeCommentCnt(likecomment); 
		System.out.println("likeCnt 결과!!!! " + likeCommCnt);
		if(likeCommCnt == 0) {
			System.out.println("0번. 중복없음.");
			mapper.likeComment(likecomment);
			out.println(0);
			return;
		}
		System.out.println("1번. 중복있음");
		out.println(1);
		out.close();
		
	
	}
	
	
	
}
