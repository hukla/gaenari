package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.PtBoardDAO;
import model.dao.VoluBoardDAO;

public class PtBoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String sessionUser = request.getParameter("user").toString();
		String boardWriter = request.getParameter("writer").toString().trim();
		
		int flag=0;
		String url = "/error.jsp";
		String ptbrdno = request.getParameter("ptbrdno");
		
		if(!sessionUser.equals(boardWriter)){
			url="board/updateError.jsp";
			flag=1;
		}
		
		try{
			if(ptbrdno == null) {
				throw new Exception("해당 글이 존재하지 않습니다.");
			}
			if(flag==0){
				boolean result = PtBoardDAO.deleteContent(Integer.parseInt(ptbrdno));
				if(result){
					url = "/board/deleteSuccess.jsp?type=pt";
				}else{
					throw new Exception("입력값이 충분하지 않습니다.");
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
