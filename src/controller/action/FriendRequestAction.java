package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.InsertDAO;
import model.dao.UserDAO;

public class FriendRequestAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="/error.jsp";
		String sender,receiver = null;
		int sndrNo,rcvrNo = 0;
		try{
			sender = request.getParameter("sender");
			receiver = request.getParameter("receiver");
			sndrNo = UserDAO.logCheck(sender).getUserno();
			rcvrNo = UserDAO.logCheck(receiver).getUserno();
			InsertDAO.insertFrndReq(sndrNo,rcvrNo);
			url = "/friends.do";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
