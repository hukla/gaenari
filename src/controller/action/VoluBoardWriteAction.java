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
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String title = request.getParameter("title");
		String brdcontent = request.getParameter("brdcontent").replaceAll("\r\n", "<br/>");
		String userid = session.getAttribute("userid").toString();
		String brdtype = "vo";
		String vhour = request.getParameter("vhour")+"!split!"+request.getParameter("vhour2")
				+"!split!"+request.getParameter("vhour3")+"!split!";
		VoluBoardDTO vbdto = new VoluBoardDTO(title, brdcontent, userid, brdtype, vhour);
		try{
			if(vhour == null || vhour.trim().length() == 0) {
				throw new Exception("입력값이 충분하지 않습니다.");
			}
			boolean result = VoluBoardDAO.writeContent(vbdto);
			if(result){
				url = "/voluBoardList.do";
			}else{
				throw new Exception("입력값이 충분하지 않습니다.");
			}
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
