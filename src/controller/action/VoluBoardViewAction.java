package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.MFABoardDAO;
import model.dao.UserDAO;
import model.dao.VoluBoardDAO;
import model.dto.UserDTO;
import model.dto.VoluBoardDTO;

public class VoluBoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String vbrdno = request.getParameter("vbrdno");
		String userid = null;
		VoluBoardDTO vbdto = null;
		if(session.getAttribute("userid")!=null){
			userid = session.getAttribute("userid").toString();
		}
		UserDTO udto = null;
		String vhour [] = null;
		boolean result=true;
		int flag=0;
		if(request.getParameter("result")!=null){
			result=false;
		}
		try{
			if(vbrdno==null || vbrdno.length() ==0 ){
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			int num=Integer.parseInt(vbrdno);
			vbdto = VoluBoardDAO.getContent(num,result);
			
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
				
				try {
					udto = UserDAO.idCheck(userid);
					vbdto.setUserno(udto.getUserno());
				} catch (SQLException e) {
					e.printStackTrace();
				}
				flag=MFABoardDAO.checkReq(vbdto);//0이상이면 신청한 상태,0이면 신청안한상태
				request.setAttribute("flag", flag);
				url = "board/voluBoardView.jsp";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("brdno="+vbdto.getBrdno());
		request.getRequestDispatcher(url).forward(request,response);
	}

}
