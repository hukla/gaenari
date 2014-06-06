package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.PtBoardDAO;
import model.dto.PtBoardDTO;

/**
 * @author Jane
 *
 */
public class PtBoardListAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();

		String pageNumber = null;
		List<PtBoardDTO> tenPt = null;
		int pageCount = 0;
		String url = "/error.jsp";
				
		try{
			pageNumber = request.getParameter("pageNumber");
				
			if(pageNumber==null){
				pageNumber="1";
			}
			
			pageCount = PtBoardDAO.getPtCount();// 게시판에 'vo'가 총 몇 개 있는지
			tenPt = PtBoardDAO.getTenPt((Integer.parseInt(pageNumber)-1)*10);// voluBoard 10개 받아옴
			
			url="board/ptBoardList.jsp";
			
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("tenPt", tenPt);
		}catch(SQLException e){
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}