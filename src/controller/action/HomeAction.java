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

import model.dao.MFABoardDAO;
import model.dao.TestDAO;
import model.dao.UpdateDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.MissingBoardDTO;
import model.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import util.DBUtil;
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
 * 
 * 수정: 2014-06-10, 이수진
 * 내용: 광고 띄우는 부분 추가(174줄~)
 * 
 * 수정: 2014-06-14, 최성훈
 * 내용: 광고부분 코드수정
 */
public class HomeAction implements Action {
	
	private static final Logger log = Logger.getLogger(HomeAction.class);
	Calendar cal = null;

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{  

		// 현재 시간
		cal = Calendar.getInstance();
		int year = cal.get(cal.YEAR);
		int mth = cal.get(cal.MONTH)+1;
		int day = cal.get(cal.DATE);
		int random = 0;
		String month = null;
		String date = null;
		String userid = null;
		String pwd = null;
		UserDTO loginUser = null;
		UserDTO ranUser = null;
		DiaryDTO diary = null;
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		List<Integer> senderNo =null;
		List<Integer> frndNoList = null;
		List<UserDTO> list = null;
		List<BoardDTO> planList = null;
		
		if(mth<10)	month = "0"+Integer.toString(mth);
		else	month = Integer.toString(mth);
		if(day<10)	date = "0"+Integer.toString(day);
		else	date = Integer.toString(day);
		String today = year+"-"+month+"-"+date;	
		
		session.setAttribute("toYear", year); //2014-04-25 13:21 추가!
		session.setAttribute("today", today);
		session.setAttribute("toMonth", mth);
		session.setAttribute("toDate", day);
		
		// 현재 시간 끝
		
		userid = (String)session.getAttribute("userid");
		pwd = (String)session.getAttribute("pwd");
		// login.do에서 넘어온 로그인 정보 가져옴
		if(request.getParameter("userid")!=null)	userid = request.getParameter("userid");
		if(request.getParameter("pwd")!=null)	pwd = request.getParameter("pwd");
		
		try {
			
			if (userid != null || pwd != null) {
				
				loginUser = UserDAO.logCheck(userid);

				if(!pwd.equals(loginUser.getPasswd())){
					throw new LoginException("비밀번호를 확인해주세요.");			// 14-05-20 성훈 추가: LoginException 추가
				}else{
					if(loginUser.getImg()==null){
						UpdateDAO.updateImg(loginUser.getUserid(),"/gaenari/image/usericon.jpg"); // user default image
					}
					senderNo = TestDAO.checkMyReqinfo(loginUser.getUserno()); // 나한테 친구요청한 사람의 리스트를 받음
					
					if(!senderNo.isEmpty()){
						list = new ArrayList<UserDTO>();
						for(int no: senderNo){
							list.add(UserDAO.selectOne(no));
						}
					}
					planList = new ArrayList<BoardDTO>();
					for (BoardDTO plans : TestDAO.selectPlan(loginUser)) {
						if (plans.getWrdate().equals(session.getAttribute("today"))) {
							planList.add(plans);
						}
					}
					frndNoList = TestDAO.getMyFriends(loginUser.getUserno());
					List<UserDTO> imgUser = new ArrayList<UserDTO>();
					for(int frnd:frndNoList){
						if(TestDAO.selectLastDiary(frnd)!=null){
							if(TestDAO.selectLastDiary(frnd).getBrdcontent().split("!split!")[0]!=null){
								imgUser.add(UserDAO.selectOne(frnd));
							}
						}
					}
					random = (int)(Math.random()*imgUser.size());
					if (!imgUser.isEmpty()) {
						ranUser = imgUser.get(random); // 이미지를 가지고 있는 내친구중에 한사람정보
						diary = TestDAO.selectLastDiary(ranUser.getUserno());
						request.setAttribute("randomUser", ranUser);
						request.setAttribute("checkImg", diary.getBrdcontent().split("!split!")[0]);
						request.setAttribute("checkCont", diary.getBrdcontent().split("!split!")[1]);
					}
					session.setAttribute("todayPlan", planList);
					session.removeAttribute("sender");			// sender list를 session에 저장
					session.setAttribute("sender", list);
					session.setAttribute("user", loginUser);	// session에 login된 상태를 저장
					log.info("logined user : "+loginUser);
				}
			}
			request.setAttribute("mdto", getAds(userid));
			url = "/home.jsp";
			
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
	
	public MissingBoardDTO getAds(String userid) throws SQLException,
			LoginException {

		String address = null;
		int ranNum = 0;
		List<MissingBoardDTO> mdto = MFABoardDAO.MselectAll();			// 신고 게시판의 모든 글 목록
		List<MissingBoardDTO> mdto2 = new ArrayList<MissingBoardDTO>();	// 신고 게시판의 분실 장소와 주소가 같은 글 목록
		MissingBoardDTO mdto3 = null;									// 글 목록 중 랜덤으로 선택된 DTO

		if (userid != null) {
			address = UserDAO.logCheck(userid).getAddress();
			for(MissingBoardDTO dto: mdto){								// 분실 장소와 주소가 같은 글 목록을 추려냄
				if(dto.getMloc().equals(address))	mdto2.add(dto);
			}
			ranNum = (int) (Math.random() * mdto2.size());
			if (mdto2.isEmpty()) { 										// 분실 장소와 주소가 같은 글이 없으면
				ranNum = (int) (Math.random() * mdto.size());
				mdto3 = MFABoardDAO.MselectOne(mdto.get(ranNum+1).getBrdno());// 난수로 목록 뽑음
			} else {													// 분실 장소와 주소가 같은 글의 목록이 있으면
				mdto3 = mdto2.get(ranNum); 								// 그 목록에서 랜덤으로 가져옴
			}
		} else {
			if (!mdto.isEmpty()) {
				ranNum = (int) (Math.random() * mdto.size());
				mdto3 = MFABoardDAO.MselectOne(mdto.get(ranNum).getMbrdno());
			}
		}
		return mdto3;
	}
}
