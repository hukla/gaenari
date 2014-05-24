/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-24
 * 내용 : 기부하기
 */
package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CenterDAO;
import model.dao.DonReqDAO;
import model.dao.ItemDAO;
import model.dto.CenterDTO;
import model.dto.DonReqDTO;
import model.dto.ItemDTO;
import model.dto.UserDTO;

public class MallDonateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDTO user = (UserDTO)request.getSession().getAttribute("user");
		int itemno = Integer.parseInt(request.getParameter("selectedItemNo"));
		int userno = user.getUserno();
		int qty = Integer.parseInt(request.getParameter("ct_qty"));
		int targetcntr = Integer.parseInt(request.getParameter("don_target"));
		ItemDTO item = ItemDAO.selectOne(itemno);
		DonReqDTO donnation = new DonReqDTO(userno, itemno, targetcntr, qty, item.getPrice() * qty, 'N');
		String cntrname = CenterDAO.selectOne(targetcntr).getCntrname();
		String url = "mall/donsuccess.jsp";
		//user.setPoint(Integer.parseInt(request.getParameter("gnr_point")));
		
		try {
			if(!DonReqDAO.donnate(donnation)) {
				throw new Exception("");
			}
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "error.jsp";
		}
		request.setAttribute("donnation", donnation);
		request.setAttribute("item", item);
		request.setAttribute("cntrname", cntrname);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
