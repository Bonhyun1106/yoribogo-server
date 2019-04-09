/**		레시피 등록 form 태그 처리 클래스		*/

package kr.co.yoribogo.user.recipe.controller;

import java.io.File;
import java.io.IOException;

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

@WebServlet("/recipe/insertrecipe.do")
public class InsertRecipeController extends HttpServlet{
	private RecipeMapper mapper;
	public InsertRecipeController() {
		mapper = MyAppSqlConfig.getSqlSession().getMapper(RecipeMapper.class);
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		System.out.println("----------------- 서블릿 호출 -----------------");
		request.setCharacterEncoding("utf-8");
		
//		 이미지 저장 경로 동적 생성
		String uploadRoot = "c:/bit2019/upload";
		String path = "/recipe";
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		
		MultipartRequest mRequest = new MultipartRequest(
				request, 
				uploadRoot + path,
				1024 * 1024 * 100,
				"utf-8",
				new FunnyFileRenamePolicy()
		);
		try {
			// 레시피 등록
			RecipeVO recipe = new RecipeVO();
			recipe.setTitle(mRequest.getParameter("title"));
			recipe.setSummary(mRequest.getParameter("summary"));
						System.out.println(mRequest.getParameter("kcal"));
			recipe.setKcal(Integer.parseInt(mRequest.getParameter("kcal")));
			recipe.setCountry(mRequest.getParameter("country"));
//			mapper.insertRecipe(recipe);
			
			// 이미지 저장
			String name = "attach";
			File f = mRequest.getFile(name);
			if (f != null) {
				//String oriName = mRequest.getOriginalFileName(name);
				//String systemName = mRequest.getFilesystemName(name);
				//long fileSize = f.length();
				
				// 데이터베이스에 파일 정보 저장
				FileVO fileVO = new FileVO();
				fileVO.setRecipeNo(recipe.getNo());
				fileVO.setBlockImg(path);
				System.out.println(path);
				System.out.println(fileVO);
				//mapper.insertFile(fileVO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
