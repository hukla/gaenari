package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DogDAO;
import model.dto.DogDTO;
import model.dto.UserDTO;
/**
 * 작성자: 최성훈
 * 작성: 2014-06-04
 * 내용: 강아지번호와 세션의 user정보를 받아와서 강아지 검색후 정보수정으로 이동
 */
public class ModifyDoginfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url="/error.jsp";
		String dogno = null;
		UserDTO user = null;
		DogDTO dog = null;

		try{
			user = (UserDTO) session.getAttribute("user");
			dogno = request.getParameter("dogno");
			dog = DogDAO.getDogInfo(user.getUserno(),Integer.parseInt(dogno));
			request.setAttribute("dog", dog);
			request.setAttribute("user", user);
			url="/miniHome/modDoginfo.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
