package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DogDAO;
import model.dao.TestDAO;
import model.dao.UserDAO;
import model.dto.DogDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;

public class MyDogInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String userid = null;
		UserDTO user = null;
		DogDTO dog = null;
		List<PlanDTO> dogsPlan = null;
		int dogno = 0;
		try{
			user = (UserDTO) session.getAttribute("user");
			//다른 아이디를 클릭할 때
			if(request.getParameter("userid")!=null){				//만약 userid 파라미터를 넘겨 받았다면
				if(userid!=request.getParameter("userid")){			//그리고 만약 세션 userid와 파라미터userid가 다르다면
					userid = request.getParameter("userid");		//userid에 파라미터userid를 저장하기
					user = UserDAO.logCheck(userid);
				}
			}
			dogno= Integer.parseInt(request.getParameter("dogno"));
			dog = DogDAO.getDogInfo(user.getUserno(), dogno);
			dogsPlan = TestDAO.getPlanByDogno(dog.getDogno());
			
			request.setAttribute("user", user);
			request.setAttribute("dogsPlanList", dogsPlan);
			request.setAttribute("dog", dog);
			url="/miniHome/dogInfo.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
