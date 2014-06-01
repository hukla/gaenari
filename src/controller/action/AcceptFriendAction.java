package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DeleteDAO;
import model.dao.InsertDAO;

public class AcceptFriendAction implements Action {
/**
 * 작성자: 최성훈
 * 작성: 2014-05-30
 * 내용: 친구 요청 수락시, 친구와 나와의 요청테이블 레코드 삭제하고 친구테이블에 레코드추가
 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/error.jsp";
		int sender,receiver = 0;
		
		try{
			sender = Integer.parseInt(request.getParameter("sender"));
			receiver = Integer.parseInt(request.getParameter("receiver"));
			InsertDAO.insertFriends(sender,receiver);
			DeleteDAO.deleteFrndReq(sender,receiver);
			url = "/friends.do";
		}catch (Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
