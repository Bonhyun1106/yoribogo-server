package kr.co.yoribogo.utility;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

import net.coobird.thumbnailator.Thumbnails;

public class WriteFileDirectory {

	public void makeThumbnail(HttpServletRequest request,String pathBy, int w, int h) throws IOException,ServletException {
		String uploadRoot = "C:/bit2019/yoribogo/yoribogo-server/yoribogo/upload";
		//1. 모듈 별 디렉토리 생성
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String path = "/"+ pathBy + sdf.format(new Date());
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
		Enumeration<String> fNames = mRequest.getFileNames();
		while(fNames.hasMoreElements()) {
			String fName = fNames.nextElement();
			File f = mRequest.getFile(fName);
			if(f != null) {
				System.out.println(fName + "에 입력된 파일 정보");
				
				System.out.println("파일크기 (Byte) : " + f.length());
				System.out.println("사용자가 올린 파일명 : " + mRequest.getOriginalFileName(fName));
				String systemName = mRequest.getFilesystemName(fName);
				System.out.println("서버에 저장된 실제 파일명 : " + systemName);
				

				Thumbnails.of(new File(f.getParent(),systemName))
					.size(w,h)
					.outputFormat("jpg")
					.toFile(new File(f.getParent(),"thumb_"+systemName));;
			}
			
		}
	}
}
