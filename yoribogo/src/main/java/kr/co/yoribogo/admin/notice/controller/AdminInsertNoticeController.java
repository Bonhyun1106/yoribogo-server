package kr.co.yoribogo.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.AdminMapper;
import kr.co.yoribogo.repository.vo.NoticeVO;


@WebServlet("/admin/notice/write.do")
public class AdminInsertNoticeController extends HttpServlet {

private AdminMapper mapper;
	
	public AdminInsertNoticeController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 파라미터 정보를 읽어 데이터베이스에 저장하기
		NoticeVO notice = new NoticeVO();
		
		
		notice.setWriter(request.getParameter("writer"));
		notice.setContent(request.getParameter("content"));
		mapper.insertNotice(notice);

		

	//  작성하고 다시 그냥 작성 폼으로 돌아오는지 or 등록한 리스트 메뉴로 가는지 
		response.sendRedirect(request.getContextPath() + "/admin/notice/noticeform.do");
	}
}
