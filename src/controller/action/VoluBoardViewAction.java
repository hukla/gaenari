package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.VoluBoardDAO;
import model.dto.VoluBoardDTO;

public class VoluBoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "/error.jsp";
		String vbrdno = request.getParameter("vbrdno");
		String vhour [] = null;
		boolean result=true;
		if(request.getParameter("result")!=null){
			result=false;
		}
		try{
			if(vbrdno==null || vbrdno.length() ==0 ){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			int num=Integer.parseInt(vbrdno);
			VoluBoardDTO vbdto = VoluBoardDAO.getContent(num,result);
			
			if(vbdto==null){
				throw new Exception("게시물이 존재하지 않습니다.");
			}else{
				if(vbdto.getVhour().contains("split")){
					vhour = vbdto.getVhour().split("!split!");
				}else{
					vhour[0] = vbdto.getVhour();
				}
				
				request.setAttribute("resultContent",vbdto);
				request.setAttribute("vhour", vhour);
				url = "board/voluBoardView.jsp";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request,response);
	}

}
