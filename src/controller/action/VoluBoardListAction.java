package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.VoluBoardDAO;

public class VoluBoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		HttpSession session = request.getSession();
		String url = "error.jsp";
		try{
			request.setAttribute("voluBoardList",VoluBoardDAO.selectAll());
			url="board/voluBoardList.jsp";
		}catch(SQLException e){
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
