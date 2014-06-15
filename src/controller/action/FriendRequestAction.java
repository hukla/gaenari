package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.FriendDAO;
import model.dao.UserDAO;

public class FriendRequestAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="/error.jsp";
		String sender,receiver,cancelValue = null;
		int sndrNo,rcvrNo = 0;
		try{
			cancelValue = request.getParameter("cancel");
			sender = request.getParameter("sender");
			receiver = request.getParameter("receiver");
			
			sndrNo = UserDAO.logCheck(sender).getUserno();
			rcvrNo = UserDAO.logCheck(receiver).getUserno();
			
			if(cancelValue==null){					// 친구 요청으로 폼 전송 받았을 때
				FriendDAO.insertFrndReq(sndrNo,rcvrNo);
			}else{									// 친구 요청 취소로 폼 전송 받았을 때
				FriendDAO.deleteFrndReq(sndrNo, rcvrNo);
			}
			url = "/friends.do";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
