package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.PtBoardDAO;
import model.dto.PtBoardDTO;

public class PtBoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String title = request.getParameter("title");
		String brdcontent = request.getParameter("brdcontent").replaceAll("\r\n", "<br/>");
		String userid = session.getAttribute("userid").toString();
		String brdtype = "pt";
		String worktype = request.getParameter("worktype");
		String workloc = request.getParameter("workloc");
		String workhour  = request.getParameter("workhour")+"!split!"+request.getParameter("workhour2")
				+"!split!"+request.getParameter("workhour3");
		String url = "/error.jsp";
		PtBoardDTO pbdto = new PtBoardDTO(title, brdcontent, userid, brdtype, worktype, workloc, workhour);
		try{
			boolean result = PtBoardDAO.writeContent(pbdto);
			if(result){
				url = "/ptBoardList.do";
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