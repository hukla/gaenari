package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TestDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.UserDTO;

public class MyMsgAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "/error.jsp";
		String mainmsg = null;
		String userid = null;
		try{
			if(request.getRequestURI().contains("myMsg")){
				url = "/miniHome/mainMsg.jsp";
			}
			else if(request.getRequestURI().contains("msgInput")){
				mainmsg = request.getParameter("mainmsg");
				if(mainmsg==null || mainmsg.trim().length()==0){
					throw new Exception("메시지를 입력해주세요.");
				}
				userid = request.getParameter("userid");
				UserDAO.updateMsg(mainmsg,userid);
				request.setAttribute("userid", userid);
				url="/miniHome/msgComplete.jsp";
			}
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
