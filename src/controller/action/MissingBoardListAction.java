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
import model.dao.MFBoardDAO;
import model.dto.ItemDTO;
import model.dto.MissingBoardDTO;

public class MissingBoardListAction implements Action  {

	private static final Logger log = Logger.getLogger(MissingBoardListAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		List<MissingBoardDTO> mList = MFBoardDAO.selectAll();
		String xmlData = "";
		PrintWriter out = response.getWriter();
		int pagecount=0;
		
		try {
			if(mList == null) {
				throw new Exception("mList가 null입니다.");
			}
			
			xmlData += "<mList>";
			for(MissingBoardDTO m : mList) {
				xmlData += "<item>";
				xmlData += "<mbrdno>"+m.getMbrdno()+"</mbrdno>";
				xmlData += "<mloc>"+m.getMloc()+"</mloc>";
				xmlData += "<mdate>"+m.getMdate()+"</mdate>";
				xmlData += "<mcontact>"+m.getMcontact()+"</mcontact>";
				xmlData += "<mkind>"+m.getMkind()+"</mkind>";
				xmlData += "<mgender>"+m.getMgender()+"</mgender>";
				xmlData += "<mage>"+m.getMage()+"</mage>";
				xmlData += "<mname>"+m.getMname()+"</mname>";
				xmlData += "</item>"; 
			}
			xmlData += "</mList>";
						
			log.info(xmlData);
			
			out.print(xmlData);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);

		}
	}
}