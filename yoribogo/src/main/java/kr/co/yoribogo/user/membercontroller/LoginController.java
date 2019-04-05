package kr.co.yoribogo.user.membercontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.LoginMapper;
import kr.co.yoribogo.repository.vo.MemberVO;

@WebServlet("/login/login.do")
public class LoginController extends HttpServlet {
	private LoginMapper mapper;
	public LoginController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(LoginMapper.class);
	}
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO member = new MemberVO(); 
		member.setMemId(request.getParameter("id"));
		member.setMemPassword(request.getParameter("pass"));
		
		System.out.println("input id : " + member.getMemId() + "| input pass : " + member.getMemPassword());
		
		// DB에서 해당 정보를 가져온다
		
		MemberVO user = mapper.selectLogin(member);
		
		// 로그인 실패 : 사용자 입력이 정확하지 않은 경우
		if(user == null) {
			// 다시 로그인 하도록 로그인폼으로 보낸다
			System.out.println("LoginCotroller : login fail.");
			response.sendRedirect("loginform.do");
			return;
		}
		System.out.println("LoginCotroller : login Success.");
		
		// 로그인 성공시 : 세션에 사용자 정보를 등록시킨다!!!!
		HttpSession session = request.getSession();
		// DB에서 가져온 정보를 session 공유영역에 올린다.
		// 즉, 공유영역에 이름객체가 등록된 경우, 로그인한 상태임을 알 수 있다.
		session.setAttribute("user", user);
		
		// 로그인 성공시 메인페이지로 이동(url변경)
		response.sendRedirect(request.getContextPath() + "/main/main.jsp");
	
	}
	
}
