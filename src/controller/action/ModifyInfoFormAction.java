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

			// 다른 아이디를 클릭할 때
			/*if (request.getParameter("userid") != null) {		// 만약 userid 파라미터를 넘겨 받았다면
				if (userid != request.getParameter("userid"))	// 그리고 만약 세션 userid와 파라미터userid가 다르다면
					userid = request.getParameter("userid");	// userid에 파라미터userid를 저장하기
			}*/
			System.out.println("ModifyInfoFormAction에서 "+userid);
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
