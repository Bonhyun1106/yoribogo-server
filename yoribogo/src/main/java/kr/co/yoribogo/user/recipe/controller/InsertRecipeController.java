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
		System.out.println("----------------- 서블릿 호출 -----------------");
		request.setCharacterEncoding("utf-8");
		
		new WriteFileDirectory().makeThumbnail(request, "recipe", 600, 400);
		// 파일 저장 디렉토리 생성
		String uploadRoot = "C:/bit2019/yoribogo/yoribogo-server/yoribogo/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String path = "/recipe" + sdf.format(new Date());
		File file = new File(uploadRoot+path);
		if(file.exists() == false) file.mkdirs();
		MultipartRequest mRequest = new MultipartRequest(
					request,
					uploadRoot + path,///서버 컴퓨터에 저장할 경로
					1024*1024*100, // 100MB 허용
					"utf-8",
					new FunnyFileRenamePolicy() //FileRenamePolicy를 상속
		);
		// 레시피 등록
				RecipeVO recipe = new RecipeVO();
				recipe.setTitle(mRequest.getParameter("title"));
				recipe.setSummary(mRequest.getParameter("summary"));
				recipe.setKcal(Integer.parseInt(mRequest.getParameter("kcal")));
				recipe.setCountry(mRequest.getParameter("country"));
//					mapper.insertRecipe(recipe);
		
		// 메인 사진
		File f1 = mRequest.getFile("mainImg");
		if (f1 != null) {
			// 데이터베이스에 파일 정보 저장
			FileVO fileVO = new FileVO();
			fileVO.setRecipeNo(recipe.getNo());
			fileVO.setBlockCon("메인");
			fileVO.setBlockImg(path);
			System.out.println(f1.toString());
			//mapper.insertFile(fileVO);
//			private String blockImg;	// 이미지링크
		}
		
		
		
		
	}
}
