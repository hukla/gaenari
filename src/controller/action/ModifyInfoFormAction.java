package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TestDAO;
import model.dao.UserDAO;
import model.dto.DogDTO;
import model.dto.UserDTO;

public class ModifyInfoFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url="/error.jsp";
		List<DogDTO> list = null;
		String userid = null;
		UserDTO user = null;
		
		try{
			userid = (String) session.getAttribute("userid");	// 세션의 userid가져오기
			user = UserDAO.logCheck(userid);
			list = TestDAO.getMyDogInfo(user.getUserno());
			request.setAttribute("user", user);
			request.setAttribute("dog", list);
			
			url="miniHome/modifyInfo.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
