package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DogService;
import model.TestService;
import model.UserService;
import model.dto.BoardDTO;
import model.dto.DogDTO;
import model.dto.UserDTO;

import org.apache.log4j.Logger;

import exception.LoginException;

public class HomeAction implements Action {
	
	Calendar cal = Calendar.getInstance();

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{  
		
		System.out.println(request.getAttribute("name"));
		System.out.println(request.getAttribute("email"));
		
		int year = cal.get(cal.YEAR);
		int mth = cal.get(cal.MONTH)+1;
		int day = cal.get(cal.DATE);
		String month = null;
		String date = null;
		String userid = null;
		String pwd = null;
		UserDTO loginUser = null;
		List<DogDTO> dog = null;
		List<BoardDTO> allPlanList = null;
		List<BoardDTO> allDiaryList = null;
		List<BoardDTO> allVisitList = null;
		HttpSession session = request.getSession();
		String url = "login/error.jsp";
		
		if(mth<10)	month = "0"+Integer.toString(mth);
		else	month = Integer.toString(mth);
		if(day<10)	date = "0"+Integer.toString(day);
		else	date = Integer.toString(day);
		String today = year+"-"+month+"-"+date;	
		session.setAttribute("toYear", year); //2014-04-25 13:21 추가!
		session.setAttribute("today", today);
		session.setAttribute("toMonth", mth);
		session.setAttribute("toDate", day);
		
		userid = (String)session.getAttribute("userid");
		pwd = (String)session.getAttribute("pwd");
		
		try {
			
			if (userid.equals(null) || userid.length() == 0 || pwd.equals(null) || pwd.length() == 0) {
				throw new LoginException("아이디와 비밀번호를 모두 입력해주세요.");
				// 14-05-20 성훈 추가: LoginException 추가
			} else {
				loginUser = UserService.login(userid);
				if(!pwd.equals(loginUser.getPasswd())){
					throw new LoginException("비밀번호를 확인해주세요.");
					// 14-05-20 성훈 추가: LoginException 추가
				}else{
					
					allPlanList = TestService.planService(loginUser);
					allDiaryList = TestService.diaryService(loginUser);	//14-05-21 성훈추가
					allVisitList = TestService.visitService(loginUser);	//14-05-21 성훈추가
					dog = DogService.getInfo(new DogDTO(loginUser));
					
					session.setAttribute("user", loginUser);
					session.setAttribute("dog", dog);
					session.setAttribute("allPlanList", allPlanList);
					session.setAttribute("allDiaryList", allDiaryList);	//14-05-21 성훈추가
					session.setAttribute("allVisitList", allVisitList);	//14-05-21 성훈추가
					
					url = "home.jsp";
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		} catch (LoginException e){
			e.printStackTrace();
			session.invalidate();
			request.setAttribute("errorMsg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
