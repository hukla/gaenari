package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ItemDAO;
import model.dto.ItemDTO;

public class MallMainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<ItemDTO> itemList = ItemDAO.selectAll();
		String url = "/mall/main.jsp";
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
