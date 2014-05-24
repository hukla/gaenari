package controller.action;

/**
 * 작성: 2014-05-09
 * 작성자: 최성훈
 * 내용: 달력 페이지로 이동
 * 
 * 수정: 2014-05-24, 최성훈
 * 내용: 달력상의 날짜를 받아서 날짜에 해당하는 
 * 		일정과 일기정보를 화면 우측에 출력해주기
 * 		달력으로 접근하는 경우가 아닐 땐 오늘날짜를 받아서
 * 		화면 우측에 출력해주기
 */
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TestService;
import model.dto.DiaryDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;

public class CalendarAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "login/error.jsp";
		String date,month,year,wrdate,today=null;
		List<DiaryDTO> dlist = null;
		List<PlanDTO> plist = null;
		UserDTO user = null;
		
		try{
			user = (UserDTO) session.getAttribute("user");
			date=request.getParameter("date");
			month=request.getParameter("month");
			year=request.getParameter("year");
			today = (String) session.getAttribute("today");		//로그인체크액션에서 attribute한 오늘날짜받아오기
			
			dlist = TestService.getDiaryBydate(today,user.getUserid());	//오늘날짜와 아이디 넘겨서 일기리스트받기
			plist = TestService.getPlanBydate(today,user.getUserid());	//오늘날짜와 아이디 넘겨서 일정리스트받기
			
			if(date!=null && month!=null && year!=null){					//달력으로 들어오는 경우
				wrdate = year+"-"+month+"-"+date;
				dlist = TestService.getDiaryBydate(wrdate,user.getUserid());//달력에서 받은 날짜로 일기리스트받기
				plist = TestService.getPlanBydate(wrdate,user.getUserid());	//달력에서 받은 날짜로 일정리스트받기
			}
			request.setAttribute("dlist", dlist);
			request.setAttribute("plist", plist);
			url="miniHome/calendar.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
