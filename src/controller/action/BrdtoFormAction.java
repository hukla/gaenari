package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class BrdtoFormAction implements Action {
	
	Logger log = Logger.getLogger(BrdtoFormAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("BRDNO=======================>"+request.getParameter("brdno"));
		String url="/quest/brdtoList.jsp";
		request.setAttribute("brdno", request.getParameter("brdno"));
		if(request.getParameter("type").equals("v")){
			url = "/board/voluReqList.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
