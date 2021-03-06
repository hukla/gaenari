package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.PlanDAO;
import model.dao.UserDAO;
import model.dto.UserDTO;

public class CheckPlanAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		int brdno = 0;
		int result = 0;
		try{
			brdno = Integer.parseInt(request.getParameter("brdno"));
			UserDAO.plusMilenari(((UserDTO) session.getAttribute("user")).getUserno(), 3);
			result = PlanDAO.planCheck(brdno);
			request.setAttribute("brdno", brdno);
			request.setAttribute("userid", session.getAttribute("userid"));
			out.print(result);
		}catch(Exception e){
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
	}

}
