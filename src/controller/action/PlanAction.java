package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dto.PlanDTO;

public class PlanAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String today = (String) session.getAttribute("today");
		String url = "miniHome/plan.jsp";
		
		PlanDTO plan = (PlanDTO) session.getAttribute("planList");
		
		request.getRequestDispatcher(url).forward(request, response);

	}

}
