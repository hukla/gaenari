package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MFABoardDAO;
import model.dto.AdpBoardDTO;

public class AdpBoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/error.jsp";
		String no = request.getParameter("abrdno");
		int abrdno = Integer.parseInt(no);
	
		AdpBoardDTO adto = MFABoardDAO.AselectOne(abrdno);
		if(adto.getBrdcontent().contains("split")){
			String picPath = adto.getBrdcontent().split("!split!")[0];
			request.setAttribute("picPath", picPath);
			adto.setBrdcontent(adto.getBrdcontent().split("!split!")[1]);
		}else{
			request.setAttribute("picPath","image/board/"+adto.getBrdno()+".jpg");
		}
		
		if(adto!=null){
			request.setAttribute("resultContent", adto);
			url = "board/adpBoardView.jsp";
			
		request.getRequestDispatcher(url).forward(request, response);
		}
	}
}