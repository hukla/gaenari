package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UpdateDAO;
import model.dao.UserDAO;
import model.dto.UserDTO;

public class ModifyInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/error.jsp";
		String userid,userno,address,passwd,username=null;
		try{
			userid = request.getParameter("userid");
			userno = request.getParameter("userno");
			address = request.getParameter("address");
			passwd = request.getParameter("pwd");
			username = request.getParameter("username");
			UpdateDAO.updateInfo(new UserDTO(Integer.parseInt(userno),userid,username,passwd,address));
			url = "/userinfo.do?userid="+userid;
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
