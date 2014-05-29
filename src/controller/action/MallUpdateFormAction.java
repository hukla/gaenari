/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-24
 * 내용 : 아이템 정보 수정 페이지를 요청
 */
package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ItemDAO;
import model.dto.ItemDTO;

public class MallUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "mall/modify.jsp";
		int itemno = Integer.parseInt(request.getParameter("itemno"));
		ItemDTO item = ItemDAO.selectOne(itemno);
		
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
