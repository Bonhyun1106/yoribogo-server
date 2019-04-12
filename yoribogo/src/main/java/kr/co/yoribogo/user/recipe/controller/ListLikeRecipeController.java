package kr.co.yoribogo.user.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.common.page.PageResult;
import kr.co.yoribogo.repository.dao.ListRecipeMapper;
import kr.co.yoribogo.repository.vo.LikeRecipeVO;
import kr.co.yoribogo.repository.vo.PageVO;

@WebServlet("/recipe/likerecipe.do")
public class ListLikeRecipeController  extends HttpServlet {
	private ListRecipeMapper mapper;

	public ListLikeRecipeController(){
		mapper = MyAppSqlConfig.getSqlSession().getMapper(ListRecipeMapper.class);
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PageVO page = new PageVO();
		int pageNo = 1;
		int memNo = 0;
		List<LikeRecipeVO> recipeList = mapper.selectLikeRecipe(memNo);
		try {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
			page.setPageNo(pageNo);
		} catch (Exception e) {
			
		}
		
		PageResult pageResult = new PageResult(pageNo,recipeList.size());
		
		int count = mapper.selectRecipeCount();
		int lastPage = (count%9 == 0) ? count / 9 : count / 9 + 1;
		
		// 요청한 페이지 번호에 해당하는 페이지 블럭 구하기
		int tabSize = 10;
		int currTab = (pageNo - 1) /tabSize + 1;
		
		int beginPage = (currTab - 1) * tabSize + 1;
		int endPage = (currTab * tabSize > lastPage) ? lastPage : currTab * tabSize;
		
		boolean prev = beginPage != 1;
		boolean next = endPage != lastPage;
		
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("count", count);
		request.setAttribute("lastPage", lastPage);

		request.setAttribute("member", mapper.selectMember());
		request.setAttribute("recipe", recipeList);
		
		request.setAttribute("pageResult", pageResult);

		RequestDispatcher rd = request.getRequestDispatcher("likerecipelist.jsp");
		rd.forward(request, response);
	}
}
