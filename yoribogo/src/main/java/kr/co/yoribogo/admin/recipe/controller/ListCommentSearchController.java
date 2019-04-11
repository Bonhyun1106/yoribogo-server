package kr.co.yoribogo.admin.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.common.page.AdminPageResult;
import kr.co.yoribogo.repository.dao.AdminMapper;
import kr.co.yoribogo.repository.vo.MemberVO;
import kr.co.yoribogo.repository.vo.PageVO;

@WebServlet("/admin/recipe/listcommentsearch.do")

public class ListCommentSearchController extends HttpServlet {
private AdminMapper mapper;
	

	public ListCommentSearchController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
	}
		
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		
		PageVO page = new PageVO();
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(
					request.getParameter("pageNo"));
			page.setPageNo(pageNo);
		} catch (Exception e) {}
		
		
		// 게시물 목록 가져오기
//		request.setAttribute("comment", mapper.selectListComment(page));
		
//   	request.setAttribute("pageResult", new AdminPageResult(
//				pageNo, mapper.selectCommentCount()
//		));

		
		
		//게시물에 해당되는 파라미터 
		MemberVO member = new MemberVO();
		request.setAttribute("comment", mapper.selectCommentById(member.getMemId()));
		
		request.getRequestDispatcher("listcomment.jsp")
	       .forward(request, response);
		
	}
	
}
