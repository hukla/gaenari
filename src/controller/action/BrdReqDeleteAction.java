package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.BrdReqDAO;
import model.dao.UserDAO;
import model.dto.BrdReqDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class BrdReqDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		SqlSession sqlSession = null;
		String userid = (String)session.getAttribute("userid");
		String url = null;
		
		BrdReqDTO brdto = null;
		int brdno = 0;
		int userno = 0;
		boolean result=false;
		try{
			sqlSession = DBUtil.getSqlSession();
			userno = UserDAO.logCheck(userid).getUserno();
			String brdnoString = request.getParameter("brdno");
			brdno = Integer.parseInt(brdnoString);
			brdto = new BrdReqDTO(brdno,userno,request.getParameter("type"));
			result = BrdReqDAO.deleteReq(brdto);
			
			url = "/quest/brDelete.jsp";
			request.setAttribute("type",brdto.getType());
			request.setAttribute("result",result);
			
			if(brdto.getType().equals("a")){
				request.setAttribute("abrdno",request.getParameter("abrdno"));
			}else if(brdto.getType().equals("v")){
				request.setAttribute("vbrdno",request.getParameter("vbrdno"));
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.closeSession(sqlSession);
		}
		request.getRequestDispatcher(url).forward(request, response);

	}

}
