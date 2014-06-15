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
 * 
 * 수정: 2014-05-26, 최성훈
 * 내용: 달력상에 날짜 누를 때 선택한 날짜에 음영처리해주기
 * 		 다음월, 이전월 등 현재아닌 다른 월의 날짜 클릭시에 다시 현재 월로 돌아오는 문제 해결
 */
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DiaryDAO;
import model.dao.PlanDAO;
import model.dao.UserDAO;
import model.dto.DiaryDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;

public class CalendarAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		int date,month,year=0;
		String wrdate,today=null;
		List<DiaryDTO> dlist = null;
		List<PlanDTO> plist = null;
		UserDTO user = null;
		String userid = null;
		
		try{
			user = (UserDTO) session.getAttribute("user");
			userid = user.getUserid();
			if(request.getParameter("userid")!=null){				//만약 userid 파라미터를 넘겨 받았다면
				if(userid!=request.getParameter("userid")){			//그리고 만약 세션 userid와 파라미터userid가 다르다면
					userid = request.getParameter("userid");		//userid에 파라미터userid를 저장하기
					user = UserDAO.logCheck(userid);
				}
			}
			//14-05-26 성훈추가: 세션에서 현재 날짜, 월, 년도, 오늘날짜 받아오기
			date=(int) session.getAttribute("toDate");				
			month = (int) session.getAttribute("toMonth");
			year = (int) session.getAttribute("toYear");
			today = (String) session.getAttribute("today");	
			
			dlist = DiaryDAO.getDiaryBydate(today, userid);		//오늘날짜와 아이디 넘겨서 일기리스트받기
			plist = PlanDAO.getPlanBydate(today, userid);		//오늘날짜와 아이디 넘겨서 일정리스트받기
			
			
			//14-05-26 성훈추가: 날짜 파라미터를 받았을 때
			if(request.getParameter("date")!=null && request.getParameter("month")!=null 
					&& request.getParameter("year")!=null){					//달력의 날짜 클릭하여 액션으로 들어온 경우
				date=Integer.parseInt(request.getParameter("date"));		//기존에 세션에서 받은 날짜정보를
				month=Integer.parseInt(request.getParameter("month"));		//파라미터 값들로
				year=Integer.parseInt(request.getParameter("year"));		//대체한다.
				
				wrdate = year+"-"+month+"-"+date;
				dlist = DiaryDAO.getDiaryBydate(wrdate, userid);			//달력에서 받은 날짜 파라미터로 일기리스트받기
				plist = PlanDAO.getPlanBydate(wrdate, userid);			//달력에서 받은 날짜 파라미터로 일정리스트받기
			}
			
			request.setAttribute("dlist", dlist);		//현재날짜 or 달력에서 클릭한 날짜의 일기리스트 setAttribute
			request.setAttribute("plist", plist);		//현재날짜 or 달력에서 클릭한 날짜의 일정리스트 setAttribute
			
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
