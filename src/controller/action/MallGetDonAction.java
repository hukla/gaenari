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

import model.dao.CenterDAO;
import model.dao.DonReqDAO;
import model.dao.ItemDAO;
import model.dao.UserDAO;
import model.dto.DonReqDTO;
import model.dto.ItemDTO;

import org.apache.log4j.Logger;

public class MallGetDonAction implements Action {

	private static final Logger log = Logger.getLogger(MallGetDonAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<DonReqDTO> donreqList = DonReqDAO.selectAll(1);
		String result = "";
		
		PrintWriter out = response.getWriter();
		
		try {
			if(donreqList == null) {
				log.error("donreqList == null");
				throw new Exception("donreqList가 null입니다.");
			}
			
			result += "<donreqlist>";
			for(DonReqDTO d : donreqList) {
				result += "<donreq>";
				result += "<drno>"+d.getDrno()+"</drno>";
				result += "<userid>"+UserDAO.selectOne(d.getUserno()).getUserid()+"</userid>";
				result += "<targetcntr>"+CenterDAO.selectOne(d.getTargetcntr()).getCntrname()+"</targetcntr>";
				result += "<itemname>"+ItemDAO.selectOne(d.getItemno()).getItemname()+"</itemname>";
				result += "<qty>"+d.getQty()+"</qty>";
				result += "<sent>"+d.getSent()+"</sent>";
				result += "</donreq>";
			}
			result += "</donreqlist>";
			
			log.info(result);
			
			out.print(result);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

}
