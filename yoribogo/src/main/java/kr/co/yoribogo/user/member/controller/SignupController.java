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
import kr.co.yoribogo.repository.vo.FileVO;
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
		
		MemberVO member = new MemberVO(); 
		member.setMemId(mRequest.getParameter("id"));
		member.setMemPassword(mRequest.getParameter("pass"));
		member.setMemEmail(mRequest.getParameter("email"));
		File f = mRequest.getFile("profile");
		
		String[] tmp = mRequest.getParameterValues("favor");
		
		String [] move = tmp[0].replaceAll(","," ").split("#");
		String [] favArr = new String[3];
		for(int i = 0; i < move.length;i++) {
			if(i == 0) {
				continue;
			}
			favArr[i-1] = move[i]; 
		}
		
		System.out.println("favArr length : " + favArr.length);
		if(favArr!=null) {
			for(int i = 0 ; i < favArr.length; i++) {
				if(favArr[i] == null) {
					favArr[i] = " ";
				}
			}
			member.setMemFavor1(favArr[0]);
			member.setMemFavor2(favArr[1]);
			member.setMemFavor3(favArr[2]);				
			System.out.println("favor1 : " + member.getMemFavor1());
			System.out.println("favor2 : " + member.getMemFavor2());
			System.out.println("favor3 : " + member.getMemFavor3());
			
		}
		
		if(f != null) {
			String systemName = mRequest.getFilesystemName("profile");
			Thumbnails.of(new File(f.getParent(),systemName))
			.size(600,400)
			.outputFormat("png")
			.toFile(new File(f.getParent(),member.getMemId()+"_thumb_"+systemName));
			member.setMemProfile(uploadRoot+path+"/"+member.getMemId()+"_thumb_"+systemName);
			System.out.println("input profile : " + member.getMemProfile());
		}

		System.out.println("input id : " + member.getMemId() + 
				"| input pass : " + member.getMemPassword()	+
				"| input email : " + member.getMemEmail()
				);
		if(f == null) {
			member.setMemProfile(uploadRoot+"/profile/default/profileDefault.png");
		}
		
		mapper.insertMember(member);
		PrintWriter out = response.getWriter();
		out.println("회원가입을 완료하였습니다.");
		out.close();
	}
}
