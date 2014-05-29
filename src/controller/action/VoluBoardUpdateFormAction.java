package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.VoluBoardDAO;
import model.dto.VoluBoardDTO;

public class VoluBoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/error.jsp";
		String vbrdno=request.getParameter("vbrdno");
		try{
			if(vbrdno == null || vbrdno.trim().length() == 0){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			int num = Integer.parseInt(vbrdno);
			VoluBoardDTO vdto = VoluBoardDAO.getContent(num, false);
			
			vdto.setBrdcontent(vdto.getBrdcontent().replaceAll("<br/>","\n"));
			request.setAttribute("resultContent", vdto);
			url = "board/voluBoardUpdate.jsp";
		}catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}