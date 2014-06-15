package controller.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.dao.InsertDAO;
import model.dao.TestDAO;
import model.dto.BoardDTO;
import model.dto.DogDTO;
import model.dto.UserDTO;
/**
 * 작성자: 최성훈
 * 작성: 2014-05
 * 내용: 강아지 정보추가
 * 
 * 수정: 2014-06-04, 최성훈
 * 내용: 강아지 사진, 설명추가(DogDTO와 dog테이블에 dogimg,doginfo 추가)
 */
public class DogInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String dogName,dogBirth,dogType,dogImg,dogInfo=null;
		String fileName,realPath = null;
		int prmYear,prmMonth,nowYear,nowMonth,dogage,maxSize=0;
		UserDTO user = null;
		List<DogDTO> dog = null;
		
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
			dogBirth = multi.getParameter("dogbirth");
			dogType = multi.getParameter("dogtype");
			dogInfo = multi.getParameter("doginfo").replaceAll("\r\n", "<br/>");	
			
			fileName = multi.getFilesystemName("dogimg"); 				// 파일의 이름 얻기
			
			dogImg = "/gaenari/image/"+user.getUserid()+"/"+fileName;	//방금등록한 이미지실제경로(사용자별 폴더)
			if (fileName == null) { // 파일이 업로드 되지 않았을때
				dogImg = "/gaenari/image/usericon.jpg";
			}
			//이미지 파일 업로드 됨.
			
			if(dogName.equals(null) || dogName.trim().length() == 0 
					|| dogBirth.equals(null) || dogBirth.trim().length() == 0
					|| dogType.equals("unchosen")){
				throw new Exception("입력정보가 불충분합니다.");
			}
			
			prmYear = Integer.parseInt(dogBirth.substring(6, 10));
			nowYear = (int) session.getAttribute("toYear");
			prmMonth = Integer.parseInt(dogBirth.substring(0, 2));
			nowMonth = (int) session.getAttribute("toMonth");
			dogage = nowYear - prmYear + 1;
			if(nowMonth-prmMonth<0){
				dogage = (dogage*12 - Math.abs(nowMonth-prmMonth))/12;//강아지 나이 계산
			}
			InsertDAO.insertDoginfo(new DogDTO(dogName,dogage,dogType,user.getUserno(),dogImg,dogInfo));
			dog = TestDAO.getMyDogInfo(user.getUserno());
			request.setAttribute("user", user);
			request.setAttribute("dog", dog);
			url="dogComplete.jsp";
			
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
