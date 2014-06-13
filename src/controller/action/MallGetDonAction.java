/**
 * 작성자 : 장재희
 * 작성일 : 2014-05-07
 * 내용 : 기부몰의 모든 아이템을 불러와서 itemList에 저장
 */
package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CenterDAO;
import model.dao.DonReqDAO;
import model.dao.ItemDAO;
import model.dao.UserDAO;
import model.dto.DonReqDTO;

import org.apache.log4j.Logger;
import org.json.JSONObject;

public class MallGetDonAction implements Action {

	private static final Logger log = Logger.getLogger(MallGetDonAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<DonReqDTO> donreqList = DonReqDAO.selectAll(1);
		
		PrintWriter out = response.getWriter();
		
		try {
			if(donreqList == null) {
				log.error("donreqList == null");
				throw new Exception("donreqList가 null입니다.");
			}
			
			JSONObject obj = new JSONObject();
			String json = "{\"donreqList\":[";
			
			//obj.put("listlength", donreqList.size());
			//json += obj;
			
			Map<String, String> res = null; 
			
			for(DonReqDTO d : donreqList) {
				res = DonReqDAO.selectDonAll(d.getUserno(), d.getTargetcntr(), d.getItemno());
				//out.print("\n,{\"donreq\":"+new JSONObject(d).toString()+"}");
				obj = new JSONObject(d);
				obj.put("userid", res.get("userid"));
				obj.put("targetcntr", res.get("targetcntr"));
				obj.put("itemname", res.get("itemname"));
				json += obj.toString()+",";
				
			}
			json = json.substring(0, json.lastIndexOf(","));
			json += "],\"listlength\":"+donreqList.size()+"}";
			out.print(json);
			log.debug(json);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

}
