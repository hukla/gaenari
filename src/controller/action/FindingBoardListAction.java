package controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import model.dao.MFABoardDAO;
import model.dao.PtBoardDAO;
import model.dto.FindingBoardDTO;
import model.dto.MissingBoardDTO;

public class FindingBoardListAction implements Action {
	
	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageNumber = null;
		/*List<FindingBoardDTO> fList = null;*/
		List<FindingBoardDTO> tenF = null; // 페이지 당 10개
		
		String tenAry[] = null;
		tenAry = new String [10];
		int pageCount = 0;
		String xmlData = "";
		String picPath = null;
		
		int pagecount=0;
		
		try {
			pageNumber = request.getParameter("pageNumber");
			
			if(pageNumber==null){
				pageNumber="1";
			}
			
			pageCount = MFABoardDAO.getFCount();// 게시판에 'fb'가 총 몇 개 있는지
			tenF = MFABoardDAO.getTenF((Integer.parseInt(pageNumber)-1)*10);// findingBoard 10개 받아옴
			
			System.out.println("pageCount="+pageCount);
			System.out.println("tenF="+tenF.toString());
			
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("tenF", tenF);
			
			System.out.println(request.getAttribute(pageNumber));
			/*fList = MFBoardDAO.FselectAll();*/
			
			/*if(fList == null) {
				throw new Exception("fList가 null입니다.");
			}*/
			
			xmlData += "<fList>";
			for(FindingBoardDTO f : tenF) {
				xmlData += "<item>";
				xmlData += "<brdno>"+f.getBrdno()+"</brdno>";
				xmlData += "<fbrdno>"+f.getFbrdno()+"</fbrdno>";
				xmlData += "<floc>"+f.getFloc()+"</floc>";
				if(f.getBrdcontent().contains("split")){
					picPath = f.getBrdcontent().split("!split!")[0];
				}else{
					picPath = "/gaenari/image/board/"+f.getBrdno()+".jpg";
				}
				xmlData += "<picPath>"+picPath+"</picPath>";
				xmlData += "</item>"; 
			}
			xmlData += "</fList>";			
			/*log.info(xmlData);*/
			response.getWriter().print(xmlData);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}