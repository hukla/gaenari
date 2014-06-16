/**
 * 작성자 : 장재희
 * 내용 : 기부몰의 메인으로 이동시
 */
package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CenterDAO;
import model.dao.ItemDAO;
import model.dto.ItemDTO;

public class MallMainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("centerList", CenterDAO.selectAll());
		request.getRequestDispatcher("/mall/main.jsp").forward(request, response);

	}

}
