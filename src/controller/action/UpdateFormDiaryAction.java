package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TestService;
import model.UserService;
import model.dto.BoardDTO;
import model.dto.UserDTO;
/**
 * 작성: 2014-05-21
 * 작성자: 최성훈
 * 내용: 일기 수정페이지로 이동시켜주기
 * 		파라미터 brdno에 해당하는 일기정보를 setAttribute해준다.
 * 		brdcontent라는 요소에 내용, 사진경로가 같이 저장되어 있기 때문에
 * 		구분자로 사진경로와 내용을 나누어 setAttribute해준다.
 * 
 * 수정: 2014-05-27, 최성훈
 * 내용: 일기 수정중에 미니홈페이지 메뉴기능 이용이 불가능 했던 오류 수정
 *
 */
public class UpdateFormDiaryAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url="/error.jsp";
		BoardDTO boardDTO = null;
		String brdcontent = null;
		String diaryImg = null;
		String brdno = null;
		String userid = null;
		UserDTO user = null;
		
		try{
			userid = request.getParameter("userid");
			if(userid==null){
				userid = (String) session.getAttribute("userid");
			}
			user = UserService.login(userid);
			brdno = request.getParameter("brdno");
			if(brdno.equals(null) || brdno.trim().length()==0)	throw new Exception("일기정보가 없습니다.");
			boardDTO = TestService.oneDiaryService(Integer.parseInt(brdno));
			brdcontent = boardDTO.getBrdcontent().split("!split!")[1];
			diaryImg = boardDTO.getBrdcontent().split("!split!")[0];
			
			request.setAttribute("user", user);
			request.setAttribute("brdcontent", brdcontent);	//일기내용 setAttribute
			request.setAttribute("diaryImg", diaryImg);		//일기의 사진 setAttribute
			request.setAttribute("oneDiary", boardDTO);
			
			url="miniHome/updateDiary.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
