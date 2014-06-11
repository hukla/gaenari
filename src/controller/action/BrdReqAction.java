package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.BrdReqDAO;
import model.dao.UserDAO;
import model.dto.BrdReqDTO;
import model.dto.QuestionaireDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class BrdReqAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("==brdReqAction진입==");
		HttpSession session = request.getSession();
		SqlSession sqlSession = null;
		String userid = (String)session.getAttribute("userid");
		System.out.println("userid="+userid);
		String url = null;
		
		BrdReqDTO brdto = null;
		int brdno = 0;
		int userno = 0;
		try{
			sqlSession = DBUtil.getSqlSession();
			userno = UserDAO.logCheck(userid).getUserno();
			String brdnoString = request.getParameter("brdno");
			brdno = Integer.parseInt(brdnoString);
			brdto = new BrdReqDTO(brdno,userno,request.getParameter("type"));
			BrdReqDAO.insertReq(brdto);
			if(brdto.getType().equals("a")){
				url="/gaenari/adpBoardView.do?abrdno="+request.getParameter("abrdno");
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.closeSession(sqlSession);
		}	
	}
}