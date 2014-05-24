package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TestService;
import model.dto.BoardDTO;
import model.dto.UserDTO;

public class VisitBookAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "login/error.jsp";
		UserDTO user = null;
		List<BoardDTO> visitList = null;
		try {
			user = (UserDTO) session.getAttribute("user");
			visitList = TestService.visitService(user);
			session.setAttribute("visitAllList",visitList);
			url = "miniHome/visitbook.jsp";
		} catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
