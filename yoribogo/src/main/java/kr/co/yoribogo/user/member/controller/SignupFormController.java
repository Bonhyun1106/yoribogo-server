package kr.co.yoribogo.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.SignupMapper;

@WebServlet("/signup/signupform.do")
public class SignupFormController extends HttpServlet{
	SignupMapper mapper;
	public SignupFormController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(SignupMapper.class);
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		//session.setAttribute("category", user);
	
		request.getRequestDispatcher("signupform.jsp").forward(request,response);
		
	}
}
