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

import model.dao.CenterDAO;
import model.dao.DonReqDAO;
import model.dao.ItemDAO;
import model.dao.UserDAO;
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
		int cntrno = user.getUsertype();

		// 기부요청하기 위한 dto생성
		DonReqDTO donrequest = new DonReqDTO(userno, itemno, qty);

		String url = "/mall/reqsuccess.jsp";
		

		try {
			if(cntrno <= 0) {
				throw new Exception("센터 운영자가 아닙니다. 센터 운영자로 로그인해주세요.");
			}
			
			if(!DonReqDAO.insertDonReq(donrequest) || !ItemDAO.insertReqCntr(UserDAO.selectOne(userno).getUsertype(), itemno)) {
					throw new Exception("요청을 실패하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "/error.jsp";
		}
		// 성공 페이지에서 결과 출력하기 위해 attribute 설정
		request.setAttribute("donrequest", donrequest);
		request.setAttribute("itemname", request.getParameter("item_name"));

		// forward
		request.getRequestDispatcher(url).forward(request, response);
	}

}
