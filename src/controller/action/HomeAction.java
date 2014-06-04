package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import model.dao.DogDAO;
import model.dao.TestDAO;
import model.dao.UpdateDAO;
import model.dao.UserDAO;
import model.dto.DogDTO;
import model.dto.UserDTO;
import exception.LoginException;
/**
 * 작성: 최성훈
 * 작성일: 2014-05-25
 * 내용: 개나리페이지 홈
 * 
 * 수정: 2014-05-29, 최성훈
 * 내용: 필요없는 session 이용 제거
 * 
 * 수정: 2014-05-30, 최성훈
 * 내용: 친구요청정보 존재여부 보이기
 *
 * 수정: 2014-05-31, 장재희
 * 내용: logger 추가
 */
public class HomeAction implements Action {
	
	private static final Logger log = Logger.getLogger(HomeAction.class);
	Calendar cal = Calendar.getInstance();

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{  
		
		//System.out.println(request.getAttribute("user.name"));
		//System.out.println(request.getAttribute("user.email"));
		
		int year = cal.get(cal.YEAR);
		int mth = cal.get(cal.MONTH)+1;
		int day = cal.get(cal.DATE);
		String month = null;
		String date = null;
		String userid = null;
		String pwd = null;
		UserDTO loginUser = null;
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		List<Integer> senderNo =null;
		List<UserDTO> list = null;
		
		if(mth<10)	month = "0"+Integer.toString(mth);
		else	month = Integer.toString(mth);
		if(day<10)	date = "0"+Integer.toString(day);
		else	date = Integer.toString(day);
		String today = year+"-"+month+"-"+date;	
		
		session.setAttribute("toYear", year); //2014-04-25 13:21 추가!
		session.setAttribute("today", today);
		session.setAttribute("toMonth", mth);
		session.setAttribute("toDate", day);
		
		userid = (String)session.getAttribute("userid");
		pwd = (String)session.getAttribute("pwd");
		if(request.getParameter("userid")!=null)	userid = request.getParameter("userid");
		if(request.getParameter("pwd")!=null)	pwd = request.getParameter("pwd");
		try {
			if (userid.equals(null) || userid.length() == 0 || pwd.equals(null) || pwd.length() == 0) {
				throw new LoginException("아이디와 비밀번호를 모두 입력해주세요.");	// 14-05-20 성훈 추가: LoginException 추가
			} else {
				loginUser = UserDAO.logCheck(userid);
				if(!pwd.equals(loginUser.getPasswd())){
					throw new LoginException("비밀번호를 확인해주세요.");			// 14-05-20 성훈 추가: LoginException 추가
				}else{
					if(loginUser.getImg()==null){
						UpdateDAO.updateImg(loginUser.getUserid(),"/gaenari/image/usericon.jpg");
					}
					senderNo = TestDAO.checkMyReqinfo(loginUser.getUserno());
					if(!senderNo.isEmpty()){
						senderNo = TestDAO.checkMyReqinfo(loginUser.getUserno());	//나한테 친구요청한 사람의 리스트를 받음
						list = new ArrayList<UserDTO>();
						for(int no: senderNo){
							list.add(UserDAO.selectOne(no));
						}
					}
					session.removeAttribute("sender");
					session.setAttribute("sender", list);
					session.setAttribute("user", loginUser);
					log.info("logined user : "+loginUser);
					
					url = "/home.jsp";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		} catch (LoginException e){
			e.printStackTrace();
			session.invalidate();
			request.setAttribute("errorMsg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
