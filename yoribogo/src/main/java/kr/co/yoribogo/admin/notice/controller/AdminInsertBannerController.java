package kr.co.yoribogo.admin.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.AdminMapper;
import kr.co.yoribogo.repository.vo.BannerVO;



@WebServlet("/admin/insertbanner.do")
public class AdminInsertBannerController extends HttpServlet  {
	

private AdminMapper mapper;


public AdminInsertBannerController() {
	mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 저장경로 
		String uploadRoot = "c:/bit2019/yoribogo/?";
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
				);
		
		
		String path = "/banner" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		
		
		MultipartRequest mRequest = new MultipartRequest(
				request, 
				uploadRoot + path,  
				1024 * 1024 * 100,   
				"utf-8", // 
				new FunnyFileRenamePolicy()
		);
		
		
		BannerVO banner = new BannerVO();
		
		//파일이 있으면 저장하고 
		File f = mRequest.getFile("banner");
		if (f != null) {
			banner.setLink(mRequest.getFilesystemName("banner"));
		}
				
		banner.setTitle(request.getParameter("title"));
		banner.setContent(request.getParameter("content"));
		
		mapper.insertBanner(banner);
		
		
		//작성하고 메인으로 가는지 아니면 걍 다시 배너 등록 창으로 오는지 
//		response.sendRedirect(request.getContextPath() + "/admin/insertbanner.jsp");
		response.sendRedirect("/admin/insertbanner.jsp");
	}
}
