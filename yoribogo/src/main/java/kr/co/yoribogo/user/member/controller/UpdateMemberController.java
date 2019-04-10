package kr.co.yoribogo.user.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.yoribogo.common.db.MyAppSqlConfig;
import kr.co.yoribogo.repository.dao.MemberMapper;
import kr.co.yoribogo.repository.vo.MemberVO;
import kr.co.yoribogo.utility.FunnyFileRenamePolicy;
import net.coobird.thumbnailator.Thumbnails;

@WebServlet("/mypage/update.do")
public class UpdateMemberController extends HttpServlet{
	MemberMapper mapper;
	public UpdateMemberController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(MemberMapper.class);
	}
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html; charset=utf-8");
		System.out.println("updateform으로부터 값을 받아왔는지?");

		String uploadPath = request.getServletContext().getRealPath("/images");
		System.out.println("uploadPath : ");
		System.out.println(uploadPath);
		String uploadRoot = "/images";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String path = "/profile" + sdf.format(new Date());
		
		File file = new File(uploadPath+path);
		if(file.exists() == false) {
			System.out.println("경로를 생성합니다");
			file.mkdirs();
		}
		MultipartRequest mRequest = new MultipartRequest(
				request,
				uploadPath + path,
				1024*1024*100, 
				"utf-8",
				new FunnyFileRenamePolicy()
	);
	
		
		System.out.println("파일 업로드 성공함");
		MemberVO memTmp = mapper.selectBySessionId(Integer.parseInt(mRequest.getParameter("memNo")));
		
		String sessionId = memTmp.getMemId();
		String inputEmail = mRequest.getParameter("email");
		String sessionEmail = mRequest.getParameter("sessionEmail");
		
		System.out.println("session id : "+sessionId);
		System.out.println("input email : " + inputEmail);
		System.out.println("session email : " + sessionEmail);
		
		MemberVO member = new MemberVO(); 
		member.setMemId(sessionId);
		member.setMemPassword(mRequest.getParameter("pass"));
		File f = mRequest.getFile("profile");
		if(inputEmail == null) {
			member.setMemEmail(sessionEmail);			
		}else {
			member.setMemEmail(inputEmail);			
		}
		
		if(f != null) {
			String systemName = mRequest.getFilesystemName("profile");
			Thumbnails.of(new File(f.getParent(),systemName))
			.size(600,400)
			.outputFormat("png")
			.toFile(new File(f.getParent(),memTmp.getMemId() + "_thumb_"+systemName));
			member.setMemProfile(uploadRoot+path+"/"+memTmp.getMemId()+"_thumb_"+systemName);
			System.out.println("input profile : " + member.getMemProfile());
		}else {
			member.setMemProfile(memTmp.getMemProfile());			
		}

		System.out.println("input id : " + member.getMemId() + 
				"| input pass : " + member.getMemPassword()	+
				"| input email : " + member.getMemEmail() + 
				"| input profile : " + member.getMemProfile()
				);
		
		mapper.updateMember(member);
		PrintWriter out = response.getWriter();
		out.println("회원가입을 완료하였습니다.");
		out.close();
	}
}
