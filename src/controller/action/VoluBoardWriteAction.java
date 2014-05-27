package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.VoluBoardDAO;
import model.dto.VoluBoardDTO;

public class VoluBoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String title = request.getParameter("title");
		String brdcontent = request.getParameter("brdcontent");
		String userid = session.getAttribute("userid").toString();
		String brdtype = "vo";
		String vhour = request.getParameter("vhour");
		VoluBoardDTO vbdto = new VoluBoardDTO(title, brdcontent, userid, brdtype, vhour);
		try{
			if(vhour == null || vhour.trim().length() == 0) {
				System.out.println("vhour==null");
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			System.out.println("result가 뜰까요???");
			boolean result = VoluBoardDAO.writeContent(vbdto);
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
