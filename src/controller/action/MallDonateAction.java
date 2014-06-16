/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-24
 * 내용 : 기부하기
 * 
 * 수정 2014-05-28 장재희
 *  : 기부하면 포인트 증가하도록 수정
 */
package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import model.dao.CenterDAO;
import model.dao.DonReqDAO;
import model.dao.ItemDAO;
import model.dto.CenterDTO;
import model.dto.DonReqDTO;
import model.dto.ItemDTO;
import model.dto.UserDTO;

public class MallDonateAction implements Action {
	
	private static final Logger log = Logger.getLogger(MallDonateAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// donate 수행하기 전에 필요한 정보를 request에서 가져옴
		UserDTO user = (UserDTO)request.getSession().getAttribute("user");
		int itemno = Integer.parseInt(request.getParameter("selectedItemNo"));
		int userno = user.getUserno();
		int qty = (request.getParameter("qty") == null) ? 1:Integer.parseInt(request.getParameter("qty"));
		log.debug("itemno : "+itemno);
		int targetcntrno = Integer.parseInt(request.getParameter("don_target"));
		int price = Integer.parseInt(request.getParameter("price"));
		double point = Double.parseDouble(request.getParameter("gnr_point"));
		String targetcntrname = request.getParameter("cntrname");
		
		// 기부하기 위한 dto생성
		DonReqDTO donnation = new DonReqDTO(userno, itemno, targetcntrno, qty, price * qty, 'N');
		
		
		String url = "/mall/donsuccess.jsp";
		
		
		try {
			if(!DonReqDAO.insertDonReq(donnation)) {
				throw new Exception("");
			}
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "/error.jsp";
			response.getWriter().print("{\"isSuccess\":true}");
			request.getRequestDispatcher(url).forward(request, response);
		}
		// 성공 페이지에서 결과 출력하기 위해 attribute 설정
		request.setAttribute("donnation", donnation);
		request.setAttribute("itemname", request.getParameter("item_name"));
		request.setAttribute("cntrname", targetcntrname);
		
		// json으로 성공여부 전달
		response.getWriter().print("{\"isSuccess\":true}");
	}

}
