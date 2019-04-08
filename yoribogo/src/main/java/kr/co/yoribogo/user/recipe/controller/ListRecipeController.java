package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.common.page.PageResult;
import kr.co.yoribogo.repository.dao.ListRecipeMapper;
import kr.co.yoribogo.repository.vo.PageVO;

@WebServlet("/recipe/list.do")
public class ListRecipeController extends HttpServlet {

	private ListRecipeMapper mapper;

	public ListRecipeController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(ListRecipeMapper.class);
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PageVO page = new PageVO();
		
		int pageNo = 1;
		
		try {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
			page.setPageNo(pageNo);
		} catch (Exception e) {

		}
		
		request.setAttribute("member", mapper.selectMember());
		request.setAttribute("recipe", mapper.selectRecipe(page));
		
		PageResult pageResult = new PageResult(pageNo, mapper.selectRecipeCount());
		request.setAttribute("pageResult", pageResult);

		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
		rd.forward(request, response);
	}
}