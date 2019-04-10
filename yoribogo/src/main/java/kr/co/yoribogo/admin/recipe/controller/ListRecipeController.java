package kr.co.yoribogo.admin.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.common.page.PageResult;
import kr.co.yoribogo.repository.dao.AdminMapper;
import kr.co.yoribogo.repository.vo.PageVO;


@WebServlet("/admin/recipe/listrecipe.do")
public class ListRecipeController extends HttpServlet {
	
	private AdminMapper mapper;
	

	public ListRecipeController() {
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
		request.setAttribute("recipe", mapper.selectListRecipe(page));
		request.setAttribute("pageResult", new PageResult(
				pageNo, mapper.selectRecipeCount()
		));
//		
		
		request.getRequestDispatcher("listrecipe.jsp")
	       .forward(request, response);
	}
	
}
