package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TestService;
import model.UserService;
import model.dto.BoardDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;
/**
 * 작성: 2014-05-09
 * 작성자: 최성훈
 * 내용: 일정페이지에 뿌릴 일정내용을 받아오되,
 * 		일정DTO에 저장된 수행날짜 중 월수를 뽑아내어 월별로 일정목록을 분류한다.
 * 		일정 정보 안의 동일한 월에 저장된 내용을 뽑기위해서 List를 두 번 이용했음.
 * 
 * 수정: 최성훈
 * 수정날짜: 2014-05-19
 * 수정내용: 일정 처음작성하거나 특정 월에만 일정을 작성한 user가
		 	일정 게시판에 접근하지 못 하던 오류해결
		 	
 * 수정: 2014-05-22, 최성훈
 * 내용: 불필요한 소스코드 정리
 */
public class PlanListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "login/error.jsp";
		String pageNumber = null;
		String planNumber = null;
		List<PlanDTO> tenPlans = null;
		List<BoardDTO> planList = null;
		int pageCount = 0;
		UserDTO user = null;
		String userid = null;
		
		try {
			user = (UserDTO) session.getAttribute("user");
			userid = user.getUserid();
			//다른 아이디를 클릭할 때
			if(request.getParameter("userid")!=null){				//만약 userid 파라미터를 넘겨 받았다면
				if(userid!=request.getParameter("userid")){			//그리고 만약 세션 userid와 파라미터userid가 다르다면
					userid = request.getParameter("userid");		//userid에 파라미터userid를 저장하기
					user = UserService.login(userid);
				}
			}
			
			//planList = (List<BoardDTO>) session.getAttribute("allPlanList");	//전체 일정목록
			planList = TestService.planService(user);
			
			pageNumber = request.getParameter("pageNumber");
			planNumber = request.getParameter("planNumber");
			if(pageNumber==null)	pageNumber="1";
			if(planNumber==null)	planNumber=Integer.toString(planList.size()-1);
			
			pageCount = TestService.getPlanCount(user.getUserno());		
			//전체 일정을 10개단위로 나눴을 때의 페이지 수 
			
			tenPlans = TestService.getTenPlans((Integer.parseInt(pageNumber)-1)*10,user.getUserno());
			//pageNumber에 해당하는 페이지수의 일정 10개의 리스트
			
			request.setAttribute("pageNumber", pageNumber);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("tenPlans", tenPlans);
			request.setAttribute("planNumber", planNumber);
			request.setAttribute("planList", planList);
			request.setAttribute("user", user);
			url = "miniHome/plan.jsp";
			
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
