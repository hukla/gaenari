/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-20
 * 내용 : 기부몰에 item 하나를 저장
 */
package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ItemDAO;

public class MallInsertFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemNo = ItemDAO.getFinalItemNo() + 1;
		String url = "mall/insert.jsp";
		request.setAttribute("finalitemno", itemNo);
		request.getRequestDispatcher(url).forward(request, response);
	}
}
