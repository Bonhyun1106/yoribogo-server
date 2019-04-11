package kr.co.yoribogo.user.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.LoginMapper;
import kr.co.yoribogo.repository.vo.MemberVO;
import kr.co.yoribogo.repository.vo.RecipeVO;

@WebServlet("/login/login.do")
public class LoginController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private LoginMapper mapper;
	public LoginController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(LoginMapper.class);
	}
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO member = new MemberVO(); 
		member.setMemId(request.getParameter("id"));
		member.setMemPassword(request.getParameter("pass"));
		
		System.out.println("input id : " + member.getMemId() + "| input pass : " + member.getMemPassword());
		
		
		MemberVO user = mapper.selectLogin(member);
		if(user == null) {
			System.out.println("LoginCotroller : login fail.");
			response.sendRedirect("loginform.do");
			return;
		} 
		int memNo = user.getMemNo();
		System.out.println("LoginCotroller : login Success.");
		List<RecipeVO> userRecipeList = mapper.selectRecipeByUser(memNo);
		List<RecipeVO> userLikeRecipeList = mapper.selectLikeRecipeByUser(memNo);

		System.out.println("작성한 레시피 개수 : " + userRecipeList.size());
		System.out.println("좋아요 누른 레시피 개수 : " + userLikeRecipeList.size());
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		session.setAttribute("userRecipe", userRecipeList);
		//session.setAttribute("userLikeRecipe", userLikeRecipeList);
		
		response.sendRedirect(request.getContextPath() + "/mypage/mypage.do");
	
	}
	
}
