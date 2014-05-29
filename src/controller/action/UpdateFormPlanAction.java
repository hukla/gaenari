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
 * 내용: 일정 수정페이지로 이동시켜주기
 * 		파라미터 brdno에 해당하는 일정정보를 setAttribute해준다.
 * 		기존에 선택했던 날짜정보가 jsp문서상에서 mm/dd/yyyy 형식으로 표현되어
 * 		BoardDTO의 wrdate인 yyyy-mm-dd 형식과 다르기 때문에 등록할 때 선택했던
 * 		날짜정보 wrdate를 mm/dd/yyyy형식으로 바꾸어 setAttribute해준다.
 * 
 * 수정: 2014-05-27, 최성훈
 * 내용: 일기 수정중에 미니홈페이지 메뉴기능 이용이 불가능 했던 오류 수정
 */
public class UpdateFormPlanAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url="/error.jsp";
		BoardDTO boardDTO = null;
		String chosenDate = null;	//등록할 때 선택했던 날짜형태(yyyy-mm-dd)
		String date = null;			//수정페이지에서 보여줄 날짜형태(mm/dd/yyyy)
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
			if(brdno.equals(null) || brdno.trim().length()==0)	throw new Exception("일정정보가 없습니다.");
			boardDTO = TestService.onePlanService(Integer.parseInt(brdno));
			chosenDate = boardDTO.getWrdate();	//저장된 wrdate(yyyy-mm-dd)를 가져옴
			date = chosenDate.substring(5,7)+"/"+chosenDate.substring(8)+"/"+chosenDate.substring(0, 4);
			//wrdate를 (mm/dd/yyyy)형태의 날짜형식으로 바꿔줌
			request.setAttribute("onePlan", boardDTO);
			request.setAttribute("date", date);
			request.setAttribute("user", user);
			
			url="miniHome/updatePlan.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
