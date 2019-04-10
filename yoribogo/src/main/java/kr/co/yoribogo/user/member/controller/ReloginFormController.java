package kr.co.yoribogo.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/reloginform.do")
public class ReloginFormController extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getSession().invalidate();
//		response.sendRedirect(request.getContextPath() + "mypage/reloginform.jsp");

		request.getRequestDispatcher("reloginform.jsp").forward(request, response);
	}
}
