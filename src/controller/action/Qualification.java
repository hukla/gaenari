/**
 * 작성자: 이수진
 * 내용: 입양 신청이 가능한지 여부를 확인
 */
package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.dto.QuestionaireDTO;
import model.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;
import exception.LoginException;

public class Qualification implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		SqlSession sqlSession = null;
		String userid = (String)session.getAttribute("userid");
		String url = "/quest/questionaire.jsp";
		char result = 't';
		QuestionaireDTO qdto = null;
		int qno = 0;
		try{
			sqlSession = DBUtil.getSqlSession();
			int userno = UserDAO.logCheck(userid).getUserno();
			qdto = sqlSession.selectOne("u.checkQuest",userno);
			System.out.println("userno="+userno+"/qdto="+qdto.toString());
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.closeSession(sqlSession);
		}		
		
		if(qdto.getQno()>0) result='t'; //설문조사를 작성했을 경우->신청 페이지로 이동
		else result='f'; //설문조사를 작성하지 않았을 경우->alert 띄우기
		request.setAttribute("result", result);
		request.getRequestDispatcher(url).forward(request,response);
	}

}
