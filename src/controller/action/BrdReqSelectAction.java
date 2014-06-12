package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.BrdReqDAO;
import model.dao.UserDAO;
import model.dto.AdpBoardDTO;
import model.dto.BrdReqDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class BrdReqSelectAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//재희한테가라제바류ㅠㅠ
		//보여줘야하는 정보: 이름, 강아지정보(DogDTO), 테스트결과(클릭하면 quest/questionForm.jsp를 disabled로 불러오도록), 마일나리, 지역
		HttpSession session = request.getSession();
		SqlSession sqlSession = null;
		String userid = (String)session.getAttribute("userid");
		String xmlData = "";
		int brdno = 0;
		int userno = 0;
		System.out.println("brdno="+brdno);
		
		String url = null;
		List<BrdReqDTO> brdtoList = null;
		
		try{
			sqlSession = DBUtil.getSqlSession();
			userno = UserDAO.logCheck(userid).getUserno();
			String brdnoString = request.getParameter("brdno");
			brdno = Integer.parseInt(brdnoString);
			brdtoList = new ArrayList<BrdReqDTO>();
			
			brdtoList = BrdReqDAO.selectReqByBrdno(brdno);
			
			url = "/quest/brdtoList.jsp";

			xmlData += "<brdtoList>";

		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.closeSession(sqlSession);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}