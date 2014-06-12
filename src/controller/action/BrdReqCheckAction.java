package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.dto.QuestionaireDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class BrdReqCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String url="/quest/brCheck.jsp";
		request.setAttribute("vbrdno", request.getParameter("vbrdno"));
		request.setAttribute("brdno", request.getParameter("brdno"));
		request.setAttribute("type", request.getParameter("type"));
			
		request.getRequestDispatcher(url).forward(request,response);

	}

}
