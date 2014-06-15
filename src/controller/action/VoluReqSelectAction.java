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
import model.dto.BrdReqDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.json.JSONObject;

import util.DBUtil;

public class VoluReqSelectAction implements Action {
	
	Logger log = Logger.getLogger(VoluReqSelectAction.class);

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//보여줘야하는 정보: 이름, 강아지정보(DogDTO), 테스트결과(클릭하면 quest/questionForm.jsp를 disabled로 불러오도록), 마일나리, 지역
				HttpSession session = request.getSession();
				SqlSession sqlSession = null;
				String userid = (String)session.getAttribute("userid");
				int brdno = 0;
				int userno = 0;
				
				String url = null;
				List<BrdReqDTO> brdtoList = null;
				
				try{
					sqlSession = DBUtil.getSqlSession();
					userno = UserDAO.logCheck(userid).getUserno();
					String brdnoString = request.getParameter("brdno");
					brdno = Integer.parseInt(brdnoString);
					
					brdtoList = new ArrayList<BrdReqDTO>();
					
					brdtoList = BrdReqDAO.selectReqByBrdno(brdno);
					UserDAO.plusMilenari(userno, 20);
					
					/*
					 * 출력할 신청자의 정보
					 * - 마일나리
					 * - 지역
					 */
					
					String json = "{\"brdtoList\":";
					
					if(brdtoList.size() != 0) {
						JSONObject obj = new JSONObject();
						
						json += "[";
						for(BrdReqDTO d : brdtoList) {
							obj = new JSONObject(d);
							obj.put("point", UserDAO.selectOne(d.getUserno()).getPoint());
							obj.put("address", UserDAO.selectOne(d.getUserno()).getAddress());
							json += obj.toString()+",";
						}
						json = json.substring(0, json.lastIndexOf(","));
						json += "], \"length\":"+brdtoList.size()+"}";
					} else {
						json += "\"empty\"}";
					}
					response.getWriter().print(json);
				} catch(Exception e){
					e.printStackTrace();
				} finally{
					DBUtil.closeSession(sqlSession);
				}		
	}

}