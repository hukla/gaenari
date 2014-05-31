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
import model.dto.DonReqDTO;
import model.dto.ItemDTO;
import model.dto.UserDTO;

import org.apache.log4j.Logger;

public class MallGetMyDonAction implements Action {

private static final Logger log = Logger.getLogger(MallGetDonAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userno = ((UserDTO)request.getSession().getAttribute("user")).getUserno();
		List<DonReqDTO> donreqList = DonReqDAO.selectByUserno(userno);
		String result = "";
		
		PrintWriter out = response.getWriter();
		
		try {
			if(donreqList == null) {
				log.error("donreqList == null");
				throw new Exception("donreqList가 null입니다.");
			}
			
			result += "<donreqlist>";
			for(DonReqDTO d : donreqList) {
				ItemDTO item = ItemDAO.selectOne(d.getItemno());
				result += "<donreq>";
				result += "<drno>"+d.getDrno()+"</drno>";
				result += "<itemname>"+item.getItemname()+"</itemname>";
				result += "<targetcntr>"+CenterDAO.selectOne(d.getTargetcntr()).getCntrname()+"</targetcntr>";
				result += "<price>"+item.getPrice()+"</price>";
				result += "<qty>"+d.getQty()+"</qty>";
				result += "<sent>"+d.getSent()+"</sent>";
				result += "</donreq>";
			}
			result += "</donreqlist>";
			
			log.debug(result);
			
			out.print(result);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
