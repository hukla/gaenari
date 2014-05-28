package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.VoluBoardDAO;
import model.dto.BoardDTO;
import model.dto.VoluBoardDTO;

public class VoluBoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String pageNumber = null;
		List<VoluBoardDTO> tenVolu = null;
		int pageCount = 0;
		
		String url = "/error.jsp";
		try{
			pageNumber = request.getParameter("pageNumber");
			System.out.println("pageNumber="+pageNumber);
				
			if(pageNumber==null){
				pageNumber="1";
			}
			
			pageCount = VoluBoardDAO.getVoluCount();// 게시판에 'vo'가 총 몇 개 있는지
			tenVolu = VoluBoardDAO.getTenVolu((Integer.parseInt(pageNumber)-1)*10);// voluBoard 10개 받아옴
			System.out.println(tenVolu.toString());
			
			url="board/voluBoardList.jsp";
			
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("tenVolu", tenVolu);
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
