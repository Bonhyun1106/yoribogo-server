package kr.co.yoribogo.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/admin/notice/noticeform.do")
public class AdminInsertNoticeformController extends HttpServlet{
		
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.getRequestDispatcher("insertnoticeform.jsp")
	       .forward(request, response);
	}
	
}
