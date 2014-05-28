/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-28
 * 내용 : 센터의 기부 요청하기
 */
package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.DonReqDAO;
import model.dto.DonReqDTO;
import model.dto.UserDTO;

public class MallRequestAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// request.do 수행하기 전에 필요한 정보를 request에서 가져옴
		UserDTO user = (UserDTO) request.getSession().getAttribute("user");
		int itemno = Integer.parseInt(request.getParameter("selectedItemNo"));
		int userno = user.getUserno();
		int qty = Integer.parseInt(request.getParameter("ct_qty"));
		//int targetcntrno = Integer.parseInt(request.getParameter("don_target"));
		//int price = Integer.parseInt(request.getParameter("price"));
		//double point = Double.parseDouble(request.getParameter("gnr_point"));
		//String targetcntrname = request.getParameter("cntrname");
		int cntrno = Integer.parseInt(request.getParameter("usertype"));

		// 기부요청하기 위한 dto생성
		DonReqDTO donrequest = new DonReqDTO(userno, itemno, qty);

		String url = "/mall/reqsuccess.jsp";
		

		try {
			if(DonReqDAO.selectByUserno(userno).size() <= 0)	{
				if(!DonReqDAO.insertDonReq(donrequest)) {
					throw new Exception("요청을 실패하였습니다.");
				}
			} else {
				response.getWriter().print("alert('요청은 센터당 한 번만 가능합니다.')");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "error.jsp";
		}
		// 성공 페이지에서 결과 출력하기 위해 attribute 설정
		request.setAttribute("donrequest", donrequest);
		request.setAttribute("itemname", request.getParameter("item_name"));

		// forward
		request.getRequestDispatcher(url).forward(request, response);
	}

}
