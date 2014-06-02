/**
 * 애견입양적합도테스트 페이지로 이동
 */

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

public class QuestionFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("==QuestionFormAction 진입==");
		HttpSession session = request.getSession();
		String url="/error.jsp";
		String userid = null;
		
		try{
			userid = (String) session.getAttribute("userid");

			url="/questionForm.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
