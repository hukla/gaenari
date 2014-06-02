package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(request.getParameter("content"));
		System.out.println(request.getParameter("userid"));
		System.out.println(request.getParameter("brdno"));
		
		String url="/error.jsp";
		
		try{
			
		}catch(Exception e){
			
		}
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
