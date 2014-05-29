package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.ItemDAO;
import model.dao.MFBoardDAO;
import model.dto.ItemDTO;
import model.dto.MissingBoardDTO;

public class MissingBoardListAction implements Action  {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String url = "/board/missingBoardList.jsp";
		
		List<MissingBoardDTO> mList = MFBoardDAO.selectAll();
		String xmlData = "";
		PrintWriter out = response.getWriter();
				
		request.getRequestDispatcher(url).forward(request, response);
	}
}
