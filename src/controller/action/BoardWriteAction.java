package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BoardDAO;
import model.dao.VoluBoardDAO;
import model.dto.BoardDTO;
import model.dto.VoluBoardDTO;

public class BoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String title = request.getParameter("title");
		String wrdate = request.getParameter("wrdate");
		String userid = request.getParameter("userid");
		String brdcontent = request.getParameter("brdcontent");
		String brdtype = request.getParameter("brdtype");
		String userno = request.getParameter("userno");
		
		try{
			if(title == null || title.trim().length() == 0 ||
					brdcontent == null || brdcontent.trim().length() == 0 ||
					brdtype == null || brdtype.trim().length() == 0
					) {
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			boolean result = BoardDAO.writeContent(new BoardDTO(brdcontent, wrdate, userid, title, brdtype, Integer.parseInt(userno)));
		
			if(result){
				response.sendRedirect("control?command=voluBoardList");
				return;
			}else{
				throw new Exception("입력값이 충분하지 않습니다.");
			}
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}

}
