package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.common.page.PageResult;
import kr.co.yoribogo.repository.dao.ListRecipeMapper;
import kr.co.yoribogo.repository.vo.PageVO;

@WebServlet("/recipe/listajax.do")
public class ListSortRecipeController extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		ListRecipeMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ListRecipeMapper.class);
		PageVO page = new PageVO();
		
		int pageNo = 1;

		try {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
			page.setPageNo(pageNo);
		} catch (Exception e) {

		}
		
		if (request.getParameter("sort") != null) {
				page.setSortType(request.getParameter("sort"));
		}
		
		String recipe = new Gson().toJson(mapper.selectRecipe(page));
		String member = new Gson().toJson(mapper.selectMember());
		List<String> list = new ArrayList<>();
		list.add(recipe);
		list.add(member);
		PrintWriter out = response.getWriter();
		out.println(list);
		out.close();
		
		PageResult pageResult = new PageResult(pageNo, mapper.selectRecipeCount());
		request.setAttribute("pageResult", pageResult);

	}
}
