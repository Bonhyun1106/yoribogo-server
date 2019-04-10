package kr.co.yoribogo.user.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.SignupMapper;
import kr.co.yoribogo.repository.vo.MemberVO;
import kr.co.yoribogo.utility.FunnyFileRenamePolicy;
import net.coobird.thumbnailator.Thumbnails;

@WebServlet("/signup/signupsuccess.do")
public class SignupController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SignupMapper mapper;
	public SignupController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(SignupMapper.class);
	}
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		
		String uploadRoot = "c:/bit2019/upload";
		//1. 모듈 별 디렉토리 생성
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String path = "/profile" + sdf.format(new Date());
		File file = new File(uploadRoot+path);
		if(file.exists() == false) file.mkdirs();
		MultipartRequest mRequest = new MultipartRequest(
					request,
					uploadRoot + path,///서버 컴퓨터에 저장할 경로
					1024*1024*100, // 100MB 허용
					"utf-8",
					new FunnyFileRenamePolicy() //FileRenamePolicy를 상속
				); //파일 처리를 대신함

		
		
		System.out.println("파일 업로드 성공함");
		// <input type="file" name="attach1">
		
		MemberVO member = new MemberVO(); 
		member.setMemId(request.getParameter("id"));
		member.setMemPassword(request.getParameter("pass"));

		File f = mRequest.getFile("profile");
		if(f != null) {
			String systemName = mRequest.getFilesystemName(f.toString());
			Thumbnails.of(new File(f.getParent(),systemName))
			.size(600,400)
			.outputFormat("png")
			.toFile(new File(f.getParent(),"thumb_"+systemName));
			member.setMemProfile(uploadRoot+path+"/thumb_"+systemName);
		}

		member.setMemEmail(request.getParameter("email"));
		System.out.println("input id : " + member.getMemId() + 
				"| input pass : " + member.getMemPassword()	+
				"| input email : " + member.getMemEmail() + 
				"| input profile : " + member.getMemProfile()
				);
		
		mapper.insertMember(member);
		response.sendRedirect("/login/loginform.do");
	}
}
