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

import model.dao.BrdReqDAO;
import model.dao.UserDAO;
import model.dto.BrdReqDTO;
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
		char result = 't';//설문조사 여부
		char result2 = 't';//마일나리 조건 충족 여부
		QuestionaireDTO qdto = null;
		int userno = 0;
		try{
			sqlSession = DBUtil.getSqlSession();
			userno = UserDAO.logCheck(userid).getUserno();
			qdto = sqlSession.selectOne("u.checkQuest",userno);
			System.out.println(qdto.toString());
			if(qdto!=null){//설문조사를 작성했을 경우->신청 페이지로 이동
				result='t';
				request.setAttribute("abrdno", request.getParameter("abrdno"));
				request.setAttribute("brdno", request.getParameter("brdno"));
				request.setAttribute("type", request.getParameter("type"));
			}
			else result='f'; //설문조사를 작성하지 않았을 경우->alert 띄우기
			
			int milenari = UserDAO.logCheck(userid).getPoint();
			if(milenari>300) result2='t';
			else result2='f';
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.closeSession(sqlSession);
		}		
		request.setAttribute("result", result);
		request.setAttribute("result2", result2);
		request.getRequestDispatcher(url).forward(request,response);
	}

}
