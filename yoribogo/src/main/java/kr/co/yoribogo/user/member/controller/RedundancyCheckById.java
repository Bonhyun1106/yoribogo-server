package kr.co.yoribogo.user.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.SignupMapper;

@WebServlet("/signup/checkid.do")
public class RedundancyCheckById extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	      SignupMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(SignupMapper.class);
	      String id = request.getParameter("id");
	      int idcnt = mapper.getMemIdOnly(id.trim());
//	      System.out.println(id);
//	      System.out.println(idcnt);
	      
	      PrintWriter out = response.getWriter();
	    
	      out.println(idcnt);
	      out.close();
	}

}
