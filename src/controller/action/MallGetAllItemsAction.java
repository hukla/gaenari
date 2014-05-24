/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-07
 * 내용 : 기부몰의 모든 아이템을 불러와서 itemList에 저장
 */
package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ItemDAO;
import model.dto.ItemDTO;

public class MallGetAllItemsAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<ItemDTO> itemList = ItemDAO.selectAll();
		String url = request.getParameter("url");
		
		try {
			if(itemList == null) {
				throw new Exception("itemList가 null입니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "error.jsp";
		}
		request.getSession().setAttribute("itemList", ItemDAO.selectAll());
		request.getRequestDispatcher(url).forward(request, response);
	}

}
