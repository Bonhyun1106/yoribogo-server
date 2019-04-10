package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.RecipeMapper;
import kr.co.yoribogo.repository.vo.CommentVO;
import kr.co.yoribogo.repository.vo.RecipeVO;

@WebServlet("/recipe/detail.do")
public class DetailRecipeController extends HttpServlet {
	private RecipeMapper mapper;
	public DetailRecipeController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		int no = 42; // 가데이터. request.getParameter("no");
		
		// 게시글 정보
		RecipeVO rv = mapper.selectDetailRecipe(no);
		System.out.println("레시피 메인 사진 : "+rv.getPhoto());
		request.setAttribute("recipe", rv);
		// 게시글 이미지
		request.setAttribute("image", mapper.selectImageBlock(no));
		// 재료 정보
		request.setAttribute("ingredient", mapper.selectIngredient(no));
		
		/* ================ 댓 글 ================== */
		List<CommentVO> commentList =  mapper.selectComment(no);
		for(CommentVO cv : commentList) {
			System.out.println("댓글 확인 : " +cv.getCommentContent());
		}
		
		request.setAttribute("commentList",commentList);
		
		request.getRequestDispatcher("detail.jsp").forward(request, response);
	}
}
