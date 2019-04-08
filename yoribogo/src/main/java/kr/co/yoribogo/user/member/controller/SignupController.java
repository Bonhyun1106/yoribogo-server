package kr.co.yoribogo.user.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.SignupMapper;
import kr.co.yoribogo.repository.vo.MemberVO;

@WebServlet("/signup/signupsuccess.do")
public class SignupController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SignupMapper mapper;
	public SignupController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(SignupMapper.class);
	}
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8"); 
		
		System.out.println("받긴 함?");
		MemberVO member = new MemberVO(); 
		member.setMemId(request.getParameter("id"));
		member.setMemPassword(request.getParameter("pass"));
		member.setMemEmail(
				request.getParameter("emaila") + "@"
				+ request.getParameter("emailb") + "."
				+ request.getParameter("emailc")
				);
		
		System.out.println("input id : " + member.getMemId() + 
				"| input pass : " + member.getMemPassword()	+
				"| input email : " + member.getMemEmail()				
				);
		
		mapper.insertMember(member);
		
		PrintWriter out = response.getWriter();
		out.println("회원가입이 완료되었습니다.");
		out.close();
	}
}
