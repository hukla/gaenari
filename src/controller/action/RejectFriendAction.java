package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.FriendDAO;

public class RejectFriendAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/error.jsp";
		int sender,receiver = 0;
		
		try{
			sender = Integer.parseInt(request.getParameter("sender"));
			receiver = Integer.parseInt(request.getParameter("receiver"));
			FriendDAO.deleteFrndReq(sender,receiver);
			url = "/friends.do";
		}catch (Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
