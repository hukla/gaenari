package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import model.dto.UserDTO;

public class MallMyPageAction implements Action {
	
	private static final Logger log = Logger.getLogger(MallMyPageAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDTO user = (UserDTO) request.getSession().getAttribute("user");
		String url = "";
		try {
			if(user == null) {
				throw new Exception("로그인해주세요");
			}
			
			log.debug("usertype : " + user.getUsertype());
			
			if(user.getUsertype() == 0) {
				url = "/mall/mydon.jsp";
			} else {
				url = "/mall/mydonreq.jsp";
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "/error.jsp";
		}
			
		request.getRequestDispatcher(url).forward(request, response);
	}

}
