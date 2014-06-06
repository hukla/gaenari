package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.PtBoardDAO;
import model.dao.UserDAO;
import model.dto.PtBoardDTO;
import model.dto.QuestionaireDTO;

public class QuestionUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		QuestionaireDTO qdto = null;
		String url="/error.jsp";
		String userid = session.getAttribute("userid").toString();
		String q1 = request.getParameter("no1");
		String q2 = request.getParameter("no2");
		String q3 = request.getParameter("no3");
		String q4 = request.getParameter("no4");
		String q5 = request.getParameter("no5");
		try{
			int userno = UserDAO.logCheck(userid).getUserno();
			qdto = new QuestionaireDTO(userno,q1,q2,q3,q4,q5);
			System.out.println(qdto.toString());
			boolean result = UserDAO.QueUpdate(qdto);
			if(result){
				url = "/quest/questionFinish.jsp";
			}else{
				throw new Exception("입력값이 충분하지 않습니다.");
			}
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
