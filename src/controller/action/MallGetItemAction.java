/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-07
 * 내용 : 기부몰의 모든 한가지 아이템을 불러옴
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

import org.apache.log4j.Logger;

public class MallGetItemAction implements Action {

	Logger log = Logger.getLogger(getClass());
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemno = Integer.parseInt(request.getParameter("itemno"));
		ItemDTO item = ItemDAO.selectOne(itemno);
		String url = request.getParameter("url");
		List<CenterDTO> centerList = CenterDAO.selectAll();
		
		try {
			if (item == null) {
				throw new Exception("아이템이 존재하지 않습니다.");
			}
			
			if(centerList == null) {
				throw new Exception("센터 목록이 존재하지 않습니다.");
			}
			
			log.info(centerList);
			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "/error.jsp";
		}
		request.setAttribute("selectedItem", item);
		request.getSession().setAttribute("centerList", centerList);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
