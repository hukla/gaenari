package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.DonReqDAO;
import model.dao.ItemDAO;
import model.dto.ItemDTO;

import org.apache.log4j.Logger;

public class MallManageFormAction implements Action {

	private static final Logger log = Logger.getLogger(MallManageFormAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ItemDTO> itemList = ItemDAO.selectAll();
		String url = "mall/manage.jsp";
		
		try {
			if(itemList == null) {
				log.error("itemList가 null입니다.");
				throw new Exception("itemList가 null입니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "/error.jsp";
		}
		request.getSession().setAttribute("itemList", ItemDAO.selectAll());
		//request.getSession().setAttribute("donreq", DonReqDAO.selectAll());
		request.getRequestDispatcher(url).forward(request, response);
	}

}
