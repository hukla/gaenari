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

import org.apache.log4j.Logger;

import model.dao.CenterDAO;
import model.dao.ItemDAO;
import model.dto.CenterDTO;
import model.dto.ItemDTO;

public class MallDetailPageAction implements Action {

	private static final Logger log = Logger.getLogger(MallDetailPageAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int itemno = Integer.parseInt(request.getParameter("itemno"));
		
		ItemDTO item = ItemDAO.selectOne(itemno); // itemno로 item을 가져옴
		
		String url = "/mall/detail.jsp"; // 최종으로 이동할 페이지
		
		try {
			if (item == null) { // 아이템이 존재하지 않을 시
				throw new Exception("아이템이 존재하지 않습니다.");
			}
			
			// db에서 아이템의 상세정보를 가져올 때 개행문자가 있으면 '<br>' 태그로 바꿔줌 
			item.setItemdetail(item.getItemdetail().replaceAll("\n", "<br>"));
			log.debug("item detail : "+item.getItemdetail()); 
			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "/error.jsp";
		}
		request.setAttribute("selectedItem", item);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
