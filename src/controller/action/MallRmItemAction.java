package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.DonReqDAO;
import model.dao.ItemDAO;

public class MallRmItemAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="mall/complete.jsp";
		String operation = "삭제";
		int itemno = Integer.parseInt(request.getParameter("itemno"));
		boolean res = false;
		
		try {
			if(itemno < 0) {
				throw new Exception("상품 번호가 잘못되었습니다.");
			}
			
			if(DonReqDAO.cntByItemno(itemno) > 0) {
				throw new Exception("연관된 요청이 남아있습니다. 요청을 모두 처리한 후에 삭제해주세요.");
			}
			
			res = ItemDAO.deleteOne(itemno);
			
			if(res == false) {
				throw new Exception("상품 삭제에 실패하였습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "/error.jsp";
		}
		
		request.setAttribute("operation", operation);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
