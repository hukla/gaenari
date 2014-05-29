/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-27
 * 내용 : detail.jsp로 이동
 */
package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CenterDAO;
import model.dao.ItemDAO;
import model.dto.CenterDTO;
import model.dto.ItemDTO;

public class MallDetailPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int itemno = Integer.parseInt(request.getParameter("itemno"));
		ItemDTO item = ItemDAO.selectOne(itemno);
		String url = "/mall/detail.jsp";
		
		try {
			if (item == null) {
				throw new Exception("아이템이 존재하지 않습니다.");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "/error.jsp";
		}
		request.setAttribute("selectedItem", item);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
