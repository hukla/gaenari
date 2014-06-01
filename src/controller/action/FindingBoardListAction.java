package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import model.dao.MFBoardDAO;
import model.dto.FindingBoardDTO;
import model.dto.MissingBoardDTO;

public class FindingBoardListAction implements Action {
	
	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<FindingBoardDTO> fList = null;
		String xmlData = "";
		
		int pagecount=0;
		
		try {
			fList = MFBoardDAO.FselectAll();
			
			if(fList == null) {
				throw new Exception("fList가 null입니다.");
			}
			
			xmlData += "<fList>";
			for(FindingBoardDTO f : fList) {
				xmlData += "<item>";
				xmlData += "<brdno>"+f.getBrdno()+"</brdno>";
				xmlData += "<fbrdno>"+f.getFbrdno()+"</fbrdno>";
				xmlData += "<floc>"+f.getFloc()+"</floc>";
				String[] brdcontent = f.getBrdcontent().split("!split!");
				xmlData += "<picPath>"+brdcontent[0]+"</picPath>";
				xmlData += "</item>"; 
			}
			xmlData += "</fList>";			
			log.info(xmlData);
			response.getWriter().print(xmlData);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);

		}
	}

}
