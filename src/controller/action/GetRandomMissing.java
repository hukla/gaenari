/**
 * 작성자: 이수진
 * 작성일: 2014-06-07
 * 내용: 미니홈피에 뿌리기 위한 광고(작성중...)
 */
package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.MFABoardDAO;
import model.dao.UserDAO;
import model.dto.MissingBoardDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class GetRandomMissing implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		SqlSession sqlSession = null;
		String userid = (String)session.getAttribute("userid");
		String url = "null";
		List<MissingBoardDTO> mdto = null;//신고 게시판의 모든 글 목록
		List<MissingBoardDTO> mdto2 = null;//신고 게시판의 분실 장소와 주소가 같은 글 목록
		
		try{
			System.out.println("==GetRandom 진입==");
			sqlSession = DBUtil.getSqlSession();
			String address = UserDAO.logCheck(userid).getAddress();
			mdto=MFABoardDAO.MselectAll();
			for(int i=0;i<mdto.size();i++){//분실 장소와 주소가 같은 글 목록을 추려냄
				if(mdto.get(i).getMloc().toString().equals(address)){
					mdto2.add(mdto.get(i));
				}
			}
			int ranNum = (int)(Math.random()*100) + (int)(Math.random()*10) + 1;
			if(mdto2.isEmpty()){				//분실 장소와 주소가 같은 글이 없으면
				MFABoardDAO.MselectOne(ranNum);	//난수로 목록 뽑음
			}else{
				
			}
				
			/*qno = sqlSession.selectOne("u.checkQuest",userno);*/
		} catch(SQLException e){
			
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			DBUtil.closeSession(sqlSession);
		}		
		/*
		if(qno>0) result='t'; //설문조사를 작성했을 경우->신청 페이지로 이동
		else result='f'; //설문조사를 작성하지 않았을 경우->alert 띄우기
		System.out.println("result="+result);
		request.setAttribute("result", result);
		request.getRequestDispatcher(url).forward(request,response);*/
	}

}
