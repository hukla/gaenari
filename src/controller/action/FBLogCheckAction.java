package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserService;
import model.dto.UserDTO;
/**
 * 작성: 2014-05-28
 * 작성자: 최성훈
 * 내용: 페이스북으로 받은 이메일, 이름으로 user정보 확인,
 * 		 확인된 user의 경우 HomeAction으로 보내고
 * 		 확인 안 된 첫 방문자의 경우엔 join.jsp로 보낸다.
 */
public class FBLogCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String email,username = null;
		UserDTO user = null;
		
		try{
			email = request.getParameter("email");
			username = request.getParameter("username");
			if(email.equals(null) || email.trim().length() == 0 || username.equals(null) || username.trim().length()==0){
				throw new Exception("Facebook Email Login 접속에러");
			}
			user = UserService.fbLogin(email);
			request.setAttribute("email", email);
			request.setAttribute("username", username);
			url = "join.jsp";
			if (user != null) {
				session.setAttribute("userid", user.getUserid());
				session.setAttribute("pwd", user.getPasswd());
				url = "/home.do";
			}
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
