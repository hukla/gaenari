/**
 * 작성자 : 장재희
 * 내용 : 배송하기
 */
package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.DonReqDAO;

import org.apache.log4j.Logger;

public class MallSendDonAction implements Action {

	private static final Logger log = Logger.getLogger(MallSendDonAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int drno = Integer.parseInt(request.getParameter("drno"));
		PrintWriter out = response.getWriter();
		
		try {
			
			
			out.print(DonReqDAO.send(DonReqDAO.selectOne(drno)));
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

}
