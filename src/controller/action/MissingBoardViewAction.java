package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CenterDAO;
import model.dao.ItemDAO;
import model.dao.MFBoardDAO;
import model.dao.VoluBoardDAO;
import model.dto.CenterDTO;
import model.dto.ItemDTO;
import model.dto.MissingBoardDTO;
import model.dto.VoluBoardDTO;

public class MissingBoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/error.jsp";
		int brdno = Integer.parseInt(request.getParameter("selectedBrdNo"));
		MissingBoardDTO mdto = MFBoardDAO.selectOne(brdno);
		
		
		if(mdto!=null){
			request.setAttribute("resultContent", mdto);
			url = "board/voluBoardView.jsp";
			
		request.getRequestDispatcher(url).forward(request, response);
		}
	}
}
