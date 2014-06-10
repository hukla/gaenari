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
 */
public class HomeAction implements Action {
	
	private static final Logger log = Logger.getLogger(HomeAction.class);
	Calendar cal = null;

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{  
		
		//System.out.println(request.getAttribute("user.name"));
		//System.out.println(request.getAttribute("user.email"));
		// 현재 시간
		cal = Calendar.getInstance();
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
						//senderNo = TestDAO.checkMyReqinfo(loginUser.getUserno());	//
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
					/////////////////////////////////////////////////////////////////
					frndNoList = TestDAO.getMyFriends(loginUser.getUserno());
					/*int random = (int)(Math.random()*frndNoList.size());
					UserDTO ranUser = UserDAO.selectOne(frndNoList.get(random));*/
					List<UserDTO> imgUser = new ArrayList<UserDTO>();
					for(int i=0;i<frndNoList.size();i++){
						if(TestDAO.selectLastDiary(frndNoList.get(i))!=null){
							if(TestDAO.selectLastDiary(frndNoList.get(i)).getBrdcontent().split("!split!")[0]!=null){
								imgUser.add(UserDAO.selectOne(frndNoList.get(i)));
							}
						}
					}
					int random = (int)(Math.random()*imgUser.size());
					if(!imgUser.isEmpty()){
					UserDTO ranUser = imgUser.get(random);	//이미지를 가지고 있는 내친구중에 한사람정보
					DiaryDTO diary = null;
					String image = null;
					String content = null;
					
					System.out.println("=================================================");
					/*System.out.println("내친구 수: "+frndNoList.size());
					System.out.println("임의숫자: "+random);
					System.out.println("임의로 얻은 친구: "+ranUser.getUserid());
					if(TestDAO.selectLastDiary(frndNoList.get(random))!=null){
						diary = TestDAO.selectLastDiary(frndNoList.get(random));
						if(diary.getBrdcontent().split("!split!")[0]!=null){
							image = diary.getBrdcontent().split("!split!")[0];
						}
						content = diary.getBrdcontent().split("!split!")[1];
						System.out.println("이 친구의 최근 일기:"+diary.getTitle()+" "+diary.getBrdno());
						System.out.println("일기사진: "+image);
						System.out.println("내용: "+content);
					}*/
					System.out.println("=================================================");
					diary = TestDAO.selectLastDiary(ranUser.getUserno());
					request.setAttribute("randomUser", ranUser);
					request.setAttribute("checkImg", diary.getBrdcontent().split("!split!")[0]);
					request.setAttribute("checkCont", diary.getBrdcontent().split("!split!")[1]);
					}
					/////////////////////////////////////////////////////////////////
					session.setAttribute("todayPlan", planList);
					
					// sender list를 session에 저장
					session.removeAttribute("sender");
					session.setAttribute("sender", list);
					
					// session에 login된 상태를 저장
					session.setAttribute("user", loginUser);
					log.info("logined user : "+loginUser);
				}
				
			}
			
			url = "/home.jsp";
			
			//유기견 광고를 랜덤으로 받아 세션에 저장
			SqlSession sqlSession = null;
			String userId = (String)session.getAttribute("userid");
			String address = null;
			int ranNum = 0;
			
			List<MissingBoardDTO> mdto = null;//신고 게시판의 모든 글 목록
			List<MissingBoardDTO> mdto2 = null;//신고 게시판의 분실 장소와 주소가 같은 글 목록
			MissingBoardDTO mdto3 = null;//글 목록 중 랜덤으로 선택된 DTO
			
			try{
				mdto = new ArrayList<MissingBoardDTO>();
				mdto2 = new ArrayList<MissingBoardDTO>();
				sqlSession = DBUtil.getSqlSession();
				mdto=MFABoardDAO.MselectAll();
			
				if(userid!=null){
					address = UserDAO.logCheck(userid).getAddress();
					
					System.out.println("[회원의 주소="+address+"]");
					for(int i=0;i<mdto.size();i++){//분실 장소와 주소가 같은 글 목록을 추려냄
						if(mdto.get(i).getMloc().equals(address)){
							mdto2.add(mdto.get(i));
						}
					}
					System.out.println("mdto2[]="+mdto2.size());
					ranNum = (int)(Math.random()*mdto2.size());
					System.out.println("ranNum="+ranNum);
					if(mdto2.isEmpty()){						//분실 장소와 주소가 같은 글이 없으면
						mdto3=MFABoardDAO.MselectOne(ranNum+1);	//난수로 목록 뽑음
					}else{										//분실 장소와 주소가 같은 글의 목록이 있으면
						mdto3=mdto2.get(ranNum);				//그 목록에서 랜덤으로 가져옴
					}
					System.out.println("로그인상태 "+mdto3.toString());
				}else{
					ranNum=(int)(Math.random()*mdto.size());
					mdto3 = MFABoardDAO.MselectOne(ranNum);
					System.out.println("로그인 안한 상태"+mdto3.toString());
				}
				session.setAttribute("mdto", mdto3);
				session.setAttribute("picPath", mdto3.getBrdcontent().split("!split!")[0]);
			} catch (Exception e){
				e.printStackTrace();
				request.setAttribute("errorMsg", e.getMessage());
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
