/**
 * 애견입양적합도테스트 페이지로 이동
 */

package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.dto.QuestionaireDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class QuestionFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		SqlSession sqlSession = null;
		String url="/error.jsp";
		QuestionaireDTO qdto = null;
		int qno=0;
		String userid = (String) session.getAttribute("userid");
		
		try{
			sqlSession = DBUtil.getSqlSession();
			int userno = UserDAO.logCheck(userid).getUserno();
			qdto = sqlSession.selectOne("u.checkQuest",userno);
			url="/quest/questionForm.jsp";
			
			if(qdto!=null){
				if(qdto.getQno()>0) url="/quest/questionUpdateCheck.jsp"; //테스트결과가있으면 업데이트 여부 확인
				else url="/quest/questionForm.jsp"; //테스트결과가 없으면 테스트 화면
			}
			
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
