package controller.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DogDAO;
import model.dto.DogDTO;
import model.dto.UserDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
/**
 * 작성자: 최성훈
 * 작성: 2014-06-04
 * 내용: 강아지 정보 수정
 */
public class DogModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String dogName,dogInfo,dogno,realPath,dogImg=null;
		int maxSize=0;
		UserDTO user = null;
		DogDTO dog = null;
		try{
			user = (UserDTO)session.getAttribute("user");
			
			maxSize = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB(메가)로 제한
			
			realPath = session.getServletContext().getRealPath("image")+"/"+user.getUserid();//경로지정: 리얼패스밑에 폴더명을 사용자id로 주기
			File targetDir = new File(realPath); 	//경로를 가진 파일객체 생성하기
			if (!targetDir.exists()) {				//파일이 존재하지 않는다면
				targetDir.mkdirs();					//새로운 디렉토리를 만들어준다.
			}
			MultipartRequest multi = new MultipartRequest(request, realPath,
					maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			dogName = multi.getParameter("dogname");
			dogInfo = multi.getParameter("doginfo");	
			dogno = multi.getParameter("dogno");
			
			//이미지 파일 업로드 됨.
			if(dogName.equals(null) || dogName.trim().length()==0)	throw new Exception("이름은 꼭 입력해주세요.");
			dog = new DogDTO(Integer.parseInt(dogno),dogName,dogInfo);
			
			System.out.println("dogname="+dogName);
			System.out.println("dogInfo="+dogInfo);
			System.out.println("dogno="+dogno);
			System.out.println("dogImg="+dogImg);
			DogDAO.updateDog(dog);
			request.setAttribute("dog", dog);
			request.setAttribute("user", user);
			url = "/miniHome/dogmodCom.jsp";
			
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
