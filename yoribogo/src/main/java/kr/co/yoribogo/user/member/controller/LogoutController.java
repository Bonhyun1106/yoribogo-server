package kr.co.yoribogo.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login/logout.do")
public class LogoutController extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//  loginform.jsp를 호출하는 클래스
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	
	}
}
