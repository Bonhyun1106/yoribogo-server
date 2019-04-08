package kr.co.yoribogo.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;

@WebServlet("/admin/memberlist.do")
public class AdminListMemberController extends HttpServlet  {
	
//	private BoardMapper mapper;
	
	public AdminListMemberController() {
//		mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
	}
	
	public void service (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		
		
	}
	
}
