package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CenterDAO;
import model.dao.ItemDAO;
import model.dao.MFABoardDAO;
import model.dao.VoluBoardDAO;
import model.dto.CenterDTO;
import model.dto.ItemDTO;
import model.dto.MissingBoardDTO;
import model.dto.VoluBoardDTO;

public class MissingBoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/error.jsp";
		String no = request.getParameter("mbrdno");
		int mbrdno = Integer.parseInt(no);
		System.out.println("mbrdno="+mbrdno);
		MissingBoardDTO mdto = MFABoardDAO.MselectOne(mbrdno);
		if(mdto.getBrdcontent().contains("split")){
			String picPath = mdto.getBrdcontent().split("!split!")[0];
			request.setAttribute("picPath", picPath);
			mdto.setBrdcontent(mdto.getBrdcontent().split("!split!")[1]);
		}else{
			request.setAttribute("picPath","image/board/"+mdto.getBrdno()+".jpg");
		}
		
		if(mdto!=null){
			request.setAttribute("resultContent", mdto);
			url = "board/missingBoardView.jsp";
			
		request.getRequestDispatcher(url).forward(request, response);
		}
	}
}
