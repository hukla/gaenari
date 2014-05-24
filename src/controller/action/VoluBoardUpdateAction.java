package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.VoluBoardDAO;
import model.dto.VoluBoardDTO;

public class VoluBoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String brdcontent = request.getParameter("brdcontent");
		String vhour = request.getParameter("vhour");				
		String vbrdno = request.getParameter("vbrdno");
		System.out.println( title + brdcontent+ vhour + vbrdno + "힘내.......");

		try{
			int num = Integer.parseInt(vbrdno);
			boolean result = VoluBoardDAO.updateContent(new VoluBoardDTO(title, brdcontent, vhour, num, 0));	
			if(result){
				response.sendRedirect("control?command=voluBoardView&vbrdno=" + num+"&result=false");
				return;
			}else{
				throw new Exception("게시물이 존재하지 않거나, 비밀번호가 올바르지 않습니다.");
			}
		}catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}
}