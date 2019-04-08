package kr.co.yoribogo.user.membercontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.SignupMapper;

@WebServlet("/signup/checkemail.do")
public class RedundancyCheckByEmail extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	      SignupMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(SignupMapper.class);
	      String email = request.getParameter("email");
	      int emailCnt = mapper.getMemEmailOnly(email);
//	      System.out.println("이것좀 출력해줘 제발:" + email);
	      
	      PrintWriter out = response.getWriter();
	    
	      out.println(emailCnt);
	      out.close();
	}

}
