package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MallManagePageAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getParameter("menuno"));
		request.setAttribute("menuno", request.getParameter("menuno"));
		request.getRequestDispatcher("/mall/manage.jsp").forward(request, response);
	}

}
