package kr.co.yoribogo.user.recipecontroller;

import java.io.IOException;
import java.io.PrintWriter;

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
		System.out.println("===================");
		System.out.println(request.getParameter("sort"));
		System.out.println("===================");
		if (request.getParameter("sort") != null) {
			if (request.getParameter("sort").equals("latestASC")) {
				page.setSortType(request.getParameter("sort"));
			}
		}
		request.setAttribute("recipe", mapper.selectRecipe(page));
		
		PrintWriter out = response.getWriter();
//		String data = new Gson().toJson(mapper.selectRecipe(page));
		out.println(new Gson().toJson(mapper.selectRecipe(page)));
		out.close();
		
		PageResult pageResult = new PageResult(pageNo, mapper.selectRecipeCount());
		request.setAttribute("pageResult", pageResult);

	}
}
