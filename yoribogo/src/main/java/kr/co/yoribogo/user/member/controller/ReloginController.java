package kr.co.yoribogo.user.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/mypage/relogin.do")
public class ReloginController extends HttpServlet {
	private LoginMapper mapper;
	public ReloginController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(LoginMapper.class);	
	}
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO member = new MemberVO(); 
		member.setMemId(request.getParameter("id"));
		member.setMemPassword(request.getParameter("pass"));
		
		System.out.println("input id : " + member.getMemId() + "| input pass : " + member.getMemPassword());
		
		
		MemberVO user = mapper.selectLogin(member);
		if(user == null) {
			System.out.println("LoginCotroller : login fail.");
			response.sendRedirect("reloginform.do");
			return;
		}
		System.out.println("LoginCotroller : login Success.");

		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		response.sendRedirect("updateform.do");
	}
}
