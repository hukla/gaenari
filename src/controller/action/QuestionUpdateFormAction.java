/**
 * 작성자: 이수진
 * 작성일: 2014-06-07
 * 내용: 애견 입양 적합 테스트를 업데이트할 경우 업데이트 폼 불러온다
 */
package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;
import model.dao.PtBoardDAO;
import model.dao.UserDAO;
import model.dto.PtBoardDTO;
import model.dto.QuestionaireDTO;

public class QuestionUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		SqlSession sqlSession = null;
		String userid = session.getAttribute("userid").toString();
		QuestionaireDTO qdto = null;
		String url = "/error.jsp";
		
		try{
			sqlSession = DBUtil.getSqlSession();
			int userno = UserDAO.logCheck(userid).getUserno();
			qdto = sqlSession.selectOne("u.checkQuest",userno);
			url="/quest/questionUpdate.jsp";
			request.setAttribute("resultContent", qdto);
		
		}catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
		}catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);


	}

}
