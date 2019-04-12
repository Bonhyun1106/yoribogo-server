package kr.co.yoribogo.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.common.page.PageResult;
import kr.co.yoribogo.repository.dao.AdminMapper;
import kr.co.yoribogo.repository.vo.BannerVO;
import kr.co.yoribogo.repository.vo.PageVO3;


@WebServlet("/main/main.do")
public class AdminMainformController extends HttpServlet  {
	

private AdminMapper mapper;


public AdminMainformController() {
	mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		BannerVO banner = new BannerVO();
		// DB 저장된 값을 가져와서
		// DB접근해서 배너번호로DB값을 가져오면 ==> DB 뭘 가져올지 where 조건절을 정해야함.
		// no 시퀀스라서 바뀌는 걸 토드 계속확인해야하는 문제점이 있음
		// 이미지링크를 가져오기엔 시스템이름으로 들어가서 그것도 알려면 폴더에 파일명을 확인하던가 토드에 파일명을 확인해야됨.
		// 한 행에있는 데이터를 가져옴
		// 공유영역에 올려주고 jsp 에서 사용
		// src="banner.bannerimglink"
		// 붙일 태그 $("pTag").html(banner.bannertitlew)
		//파일 경로 url
		banner.setNo(1);
		banner.setTitle("쉽게 만드는 빠네");
		banner.setContent("맛있는 빠네빠네 빠네빠네 버렸어요~~");
		banner.setLink("/images/food1.jpg");

		PageVO3 page = new PageVO3();
		
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(
					request.getParameter("pageNo"));
			page.setPageNo(pageNo);
		} catch (Exception e) {}
		
		mapper.insertBanner(banner);
		request.setAttribute("banner", banner);
		request.setAttribute("recipe", mapper.selectListMainImage());
//		request.setAttribute("pageResult", new PageResult(pageNo, 
//				mapper.selectMainCount(page)));
		
		
		request.getRequestDispatcher("main.jsp").forward(request, response);
		
	}

}
