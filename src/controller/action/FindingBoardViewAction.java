package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MFBoardDAO;
import model.dto.FindingBoardDTO;

public class FindingBoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/error.jsp";
		String no = request.getParameter("fbrdno");
		int fbrdno = Integer.parseInt(no);
		System.out.println("fbrdno="+fbrdno);
		FindingBoardDTO fdto = MFBoardDAO.FselectOne(fbrdno);
		/*String picPath = fdto.getBrdcontent().split("!split!")[0];
		fdto.setBrdcontent(fdto.getBrdcontent().split("!split!")[1]);*/
		
		if(fdto!=null){
			request.setAttribute("resultContent", fdto);
		/*	request.setAttribute("picPath",picPath);*/
			url = "board/findingBoardView.jsp";
			
		request.getRequestDispatcher(url).forward(request, response);
		}
	}
}