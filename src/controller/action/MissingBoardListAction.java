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
import model.dto.ItemDTO;
import model.dto.MissingBoardDTO;

public class MissingBoardListAction implements Action  {

	private static final Logger log = Logger.getLogger(MissingBoardListAction.class);
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<MissingBoardDTO> mList = null;
		String xmlData = "";
		String picPath = null;
		
		int pagecount=0;
		
		try {
			mList = MFABoardDAO.MselectAll();
			
			if(mList == null) {
				throw new Exception("mList가 null입니다.");
			}
			
			xmlData += "<mList>";
			for(MissingBoardDTO m : mList) {
				xmlData += "<item>";
				xmlData += "<brdno>"+m.getBrdno()+"</brdno>";
				xmlData += "<mbrdno>"+m.getMbrdno()+"</mbrdno>";
				xmlData += "<mloc>"+m.getMloc()+"</mloc>";
				xmlData += "<mdate>"+m.getMdate()+"</mdate>";
				xmlData += "<title>"+m.getTitle()+"</title>";
				if(m.getBrdcontent().contains("split")){
					picPath = m.getBrdcontent().split("!split!")[0];
				}else{
					picPath = "/gaenari/image/board/"+m.getBrdno()+".jpg";
				}
				log.info("picPath="+picPath);
				xmlData += "<picPath>"+picPath+"</picPath>";
				xmlData += "</item>"; 
			}
			xmlData += "</mList>";						
			response.getWriter().print(xmlData);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);

		}
	}
}