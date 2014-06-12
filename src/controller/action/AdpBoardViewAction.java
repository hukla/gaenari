package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exception.LoginException;
import model.dao.MFABoardDAO;
import model.dao.UserDAO;
import model.dto.AdpBoardDTO;
import model.dto.UserDTO;

public class AdpBoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String url = "/error.jsp";
		String no = request.getParameter("abrdno");
		String userid = request.getParameter("userid");
		UserDTO udto = null;
		System.out.println("userid="+userid);
		int abrdno = Integer.parseInt(no);
		int result = 0;
	
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
			try {
				udto = UserDAO.idCheck(userid);
				adto.setUserno(udto.getUserno());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			url = "board/adpBoardView.jsp";
		}
		result=MFABoardDAO.checkReq(adto);//0이상이면 신청한 상태,0이면 신청안한상태
		request.setAttribute("flag", result);
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}