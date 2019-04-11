package kr.co.yoribogo.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.common.page.AdminPageResult;
import kr.co.yoribogo.repository.dao.AdminMapper;
import kr.co.yoribogo.repository.vo.PageVO2;

@WebServlet("/admin/member/listmember.do")
public class ListMemberController extends HttpServlet  {

private AdminMapper mapper;
	

	public ListMemberController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
	 
		
		PageVO2 page = new PageVO2();
		
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(
					request.getParameter("pageNo"));
			page.setPageNo(pageNo);
		} catch (Exception e) {}
		
		
		// 게시물 목록 가져오기
		
		page.setMemId(request.getParameter("search"));

		request.setAttribute("member", mapper.selectListMember(page));
		request.setAttribute("pageResult", new AdminPageResult(pageNo, 
				mapper.selectMemberCount(page)));
			
		request.getRequestDispatcher("listmember.jsp").forward(request, response);
			
	}	
}
