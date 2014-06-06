package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.VoluBoardDAO;
import model.dto.VoluBoardDTO;

public class VoluBoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String sessionUser = request.getParameter("user").toString();
		String boardWriter = request.getParameter("writer").toString().trim();
		
		System.out.println(sessionUser+boardWriter);
		int flag=0;
		String url = "/error.jsp";
		String vbrdno = request.getParameter("vbrdno");
		
		if(!sessionUser.equals(boardWriter)){
			url="board/updateError.jsp";
			flag=1;
		}
		
		try{
			if(vbrdno == null) {
				throw new Exception("해당 글이 존재하지 않습니다.");
			}
			if(flag==0){
				boolean result = VoluBoardDAO.deleteContent(Integer.parseInt(vbrdno));
				if(result){
					url = "/voluBoardList.do";
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
