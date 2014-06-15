package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import model.dao.ItemDAO;
import model.dao.MFABoardDAO;
import model.dto.AdpBoardDTO;
import model.dto.ItemDTO;
import model.dto.MissingBoardDTO;

public class AdpBoardListAction implements Action  {

	private static final Logger log = Logger.getLogger(AdpBoardListAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<AdpBoardDTO> aList = null;
		String xmlData = "";
		String picPath = null;
		
		int pagecount=0;
		
		try {
			aList = MFABoardDAO.AselectAll();
			
			if(aList == null) {
				throw new Exception("aList가 null입니다.");
			}
			
			xmlData += "<aList>";
			for(AdpBoardDTO a : aList) {
				xmlData += "<item>";
				xmlData += "<brdno>"+a.getBrdno()+"</brdno>";
				xmlData += "<abrdno>"+a.getAbrdno()+"</abrdno>";
				xmlData += "<title>"+a.getTitle()+"</title>";
				xmlData += "<wrdate>"+a.getWrdate()+"</wrdate>";

				if(a.getBrdcontent().contains("split")){
					picPath = a.getBrdcontent().split("!split!")[0];
				}else{
					picPath = "/gaenari/image/board/"+a.getBrdno()+".jpg";
				}
				xmlData += "<picPath>"+picPath+"</picPath>";
				xmlData += "</item>"; 
			}
			xmlData += "</aList>";						
			response.getWriter().print(xmlData);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}