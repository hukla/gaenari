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
import model.UserService;
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
		String userid = null;
		
		try{
			user = (UserDTO) session.getAttribute("user");
			userid = user.getUserid();
			//다른 아이디를 클릭할 때
			if(request.getParameter("userid")!=null){				//만약 userid 파라미터를 넘겨 받았다면
				if(userid!=request.getParameter("userid")){			//그리고 만약 세션 userid와 파라미터userid가 다르다면
					userid = request.getParameter("userid");		//userid에 파라미터userid를 저장하기
					user = UserService.login(userid);
				}
			}

			date=request.getParameter("date");
			month=request.getParameter("month");
			year=request.getParameter("year");
			today = (String) session.getAttribute("today");		//로그인체크액션에서 attribute한 오늘날짜받아오기
			
			dlist = TestService.getDiaryBydate(today,userid);	//오늘날짜와 아이디 넘겨서 일기리스트받기
			plist = TestService.getPlanBydate(today,userid);	//오늘날짜와 아이디 넘겨서 일정리스트받기
			
			if(date!=null && month!=null && year!=null){					//달력으로 들어오는 경우
				wrdate = year+"-"+month+"-"+date;
				dlist = TestService.getDiaryBydate(wrdate,userid);//달력에서 받은 날짜로 일기리스트받기
				plist = TestService.getPlanBydate(wrdate,userid);	//달력에서 받은 날짜로 일정리스트받기
			}
			request.setAttribute("dlist", dlist);
			request.setAttribute("plist", plist);
			request.setAttribute("user", user);
			
			request.setAttribute("date", date);
			request.setAttribute("month", month);
			request.setAttribute("year", year);
			
			url="miniHome/calendar.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
