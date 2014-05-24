package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PtBoardDAO;
import model.dto.PtBoardDTO;

public class PtBoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "error.jsp";
		String ptbrdno=request.getParameter("ptbrdno");
		System.out.println(ptbrdno);
		try{
			if(ptbrdno == null || ptbrdno.trim().length() == 0){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			int num = Integer.parseInt(ptbrdno);
			PtBoardDTO ptbdto = PtBoardDAO.getContent(num, false);
			
			ptbdto.setBrdcontent(ptbdto.getBrdcontent());
			request.setAttribute("resultContent", ptbdto);
			url = "board/ptBoardUpdate.jsp";
		}catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
