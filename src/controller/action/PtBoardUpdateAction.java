package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PtBoardDAO;
import model.dao.VoluBoardDAO;
import model.dto.PtBoardDTO;
import model.dto.VoluBoardDTO;

public class PtBoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String brdcontent = request.getParameter("brdcontent");
		String worktype = request.getParameter("worktype");
		String workloc = request.getParameter("workloc");
		String workhour  = request.getParameter("workhour")+"!split!"+request.getParameter("workhour2")
				+"!split!"+request.getParameter("workhour3");
		String ptbrdno = request.getParameter("ptbrdno");
		
		try{
			int num = Integer.parseInt(ptbrdno);
			boolean result = PtBoardDAO.updateContent(new PtBoardDTO(title, brdcontent, worktype, workloc, workhour, num, 0));	
			if(result){
				response.sendRedirect("control?command=ptBoardView&ptbrdno=" + num+"&result=false");
				return;
			}else{
				throw new Exception("게시물이 존재하지 않거나, 비밀번호가 올바르지 않습니다.");
			}
		}catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher("/error.jsp").forward(request, response);
	}
}
