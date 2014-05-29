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

public class PtBoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/error.jsp";
		String ptbrdno = request.getParameter("ptbrdno");
		boolean result=true;
		if(request.getParameter("result")!=null){
			result=false;
		}
		try{
			if(ptbrdno==null || ptbrdno.length() ==0 ){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			int num=Integer.parseInt(ptbrdno);
			PtBoardDTO ptbdto = PtBoardDAO.getContent(num, result);
			
			if(ptbdto==null){
				throw new Exception("게시물이 존재하지 않습니다.");
			}else{
				System.out.println(ptbdto.toString());
				request.setAttribute("resultContent",ptbdto);
				url = "board/ptBoardView.jsp";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request,response);
	}

}