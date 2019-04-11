/**		레시피 등록 form 태그 처리 클래스		*/

package kr.co.yoribogo.user.recipe.controller;

import java.io.File;
import java.io.IOException;
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
import kr.co.yoribogo.repository.dao.RecipeMapper;
import kr.co.yoribogo.repository.vo.FileVO;
import kr.co.yoribogo.repository.vo.RecipeVO;
import kr.co.yoribogo.utility.FunnyFileRenamePolicy;
import kr.co.yoribogo.utility.WriteFileDirectory;

@WebServlet("/recipe/insertrecipe.do")
public class InsertRecipeController extends HttpServlet{
	private RecipeMapper mapper;
	public InsertRecipeController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf-8");
		
		String uploadPath = request.getServletContext().getRealPath("/images");
		System.out.println("uploadPath : ");
		System.out.println(uploadPath);
		// 파일 저장 디렉토리 생성
		String uploadRoot = "/images";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String path = "/recipe" + sdf.format(new Date());
		File file = new File(uploadRoot+path);
		if(file.exists() == false) file.mkdirs();
		MultipartRequest mRequest = new MultipartRequest(
					request,
					uploadPath + path,///서버 컴퓨터에 저장할 경로
					1024*1024*100, // 100MB 허용
					"utf-8",
					new FunnyFileRenamePolicy() //FileRenamePolicy를 상속
		);
		
		// 레시피 등록
		RecipeVO recipe = new RecipeVO();
		recipe.setNo(recipe.getNo());
		recipe.setMemNo(Integer.parseInt(mRequest.getParameter("memNo")));	// 가데이터 1번 회원
		recipe.setTitle(mRequest.getParameter("title"));
		recipe.setSummary(mRequest.getParameter("summary"));
		recipe.setCountry(mRequest.getParameter("country"));
		recipe.setType(mRequest.getParameter("type"));
		recipe.setKcal(Integer.parseInt(mRequest.getParameter("kcal")));
		recipe.setWeather(mRequest.getParameter("weather"));
		recipe.setLevel(mRequest.getParameter("level"));
		recipe.setTime(Integer.parseInt(mRequest.getParameter("time")));
//		File f1 = mRequest.getFile("mainImg");	// 메인 사진
//		recipe.setPhoto(f1.toString());
//		mapper.insertRecipe(recipe);
		
		// 내용 등록..
		int fileCnt = 1;
		Enumeration<String> fNames = mRequest.getFileNames();
		while (fNames.hasMoreElements()) {
			System.out.println("hasMore Elements : " + fileCnt);

			String fName = fNames.nextElement();
			File f = mRequest.getFile(fName);
			// 파일을 선택하지 않은 경우 null
			if (f != null) {
				// 첫번째 파일은 recipe photo에 저장.
				if(fileCnt == 1) {
					System.out.println("첫번째 파일..."+fileCnt);
					recipe.setPhoto(uploadRoot + path + "/" + f.getName());
					mapper.insertRecipe(recipe);
					fileCnt++;
					continue;
				}
				// 파일 등록
				FileVO fileVO = new FileVO();
				fileVO.setRecipeNo(recipe.getNo());
				fileVO.setBlockCon(mRequest.getParameter("con-txt1"));
				fileVO.setBlockImg(uploadRoot + path + "/" + f.getName());
				mapper.insertFile(fileVO);
				fileCnt++;
			}
		}
		
		
		
		
		response.sendRedirect("list.do");
	}
}
