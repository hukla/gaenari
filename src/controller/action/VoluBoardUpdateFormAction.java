package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
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
		
		String sessionUser = request.getParameter("user").toString();
		String boardWriter = request.getParameter("writer").toString().trim();
		System.out.println("[user="+sessionUser+"]==[writer="+boardWriter+"]");
		
		int flag=0;//user와 글쓴이가 같으면 0, 다르면 1
		String url = "/error.jsp";
		if(!sessionUser.equals(boardWriter)){
			url="board/updateError.jsp";
			flag=1;//user와 글쓴이가 다르면 flag를 1로 설정
		}
		String vbrdno=request.getParameter("vbrdno");
		
		try{
			if(vbrdno == null || vbrdno.trim().length() == 0){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			if(flag==0){//user와 글쓴이가 같을 경우 update 
				int num = Integer.parseInt(vbrdno);
				VoluBoardDTO vdto = VoluBoardDAO.getContent(num, false);
				
				vdto.setBrdcontent(vdto.getBrdcontent().replaceAll("<br/>","\n"));
				request.setAttribute("resultContent", vdto);
				url = "board/voluBoardUpdate.jsp";
			}			
		}catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
			
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}