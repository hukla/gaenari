/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-07
 * 내용 : 기부몰의 모든 아이템을 불러와서 itemList에 저장
 */
package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import model.dao.ItemDAO;
import model.dto.ItemDTO;

public class MallGetAllItemsAction implements Action {

	private static final Logger log = Logger.getLogger(MallGetAllItemsAction.class);
		
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<ItemDTO> itemList = ItemDAO.selectAll();
		String xmlData = "";
		PrintWriter out = response.getWriter();
		
		try {
			if(itemList == null) {
				throw new Exception("itemList가 null입니다.");
			}
			
			
			log.info(itemList.size());
			xmlData += "<itemlist>";
			xmlData += "<listlength>"+itemList.size()+"</listlength>";
			for(ItemDTO i : itemList) {
				xmlData += "<item>";
				xmlData += "<itemno>"+i.getItemno()+"</itemno>";
				xmlData += "<itemname>"+i.getItemname()+"</itemname>";
				xmlData += "<price>"+i.getPrice()+"</price>";
				xmlData += "<qty>"+i.getQty()+"</qty>";
				xmlData += "<itemdetail>"+i.getItemdetail()+"</itemdetail>";
				xmlData += "</item>"; 
			}
			xmlData += "</itemlist>";
			
			log.debug(xmlData);
			
			out.print(xmlData);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

}
