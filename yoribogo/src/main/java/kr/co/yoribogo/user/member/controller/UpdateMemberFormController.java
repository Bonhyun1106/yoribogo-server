package kr.co.yoribogo.user.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.SignupMapper;
import kr.co.yoribogo.repository.vo.CategoryVO;

@WebServlet("/mypage/updateform.do")
public class UpdateMemberFormController extends HttpServlet{
	SignupMapper mapper;
	public UpdateMemberFormController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(SignupMapper.class);
	}
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		/*
		HttpSession session = request.getSession();
		List<CategoryVO> categoryList = mapper.getCategoryList();
		session.setAttribute("categoryList", categoryList);
		System.out.println("category size : "+categoryList.size());
		*/
		request.getRequestDispatcher("updateform.jsp").forward(request, response);	
		}
}
