package controller.action;  

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import model.dao.DogDAO;
import model.dao.MFABoardDAO;
import model.dao.TestDAO;
import model.dao.UpdateDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.DogDTO;
import model.dto.MissingBoardDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;
/**
 * 수정: 최성훈
 * 수정일: 2014.04.21
 * 변경 사유: DTO의 수정 및 변경
 * 변경 내용: diaryVo, BoardVo를 이용하여 일기, 일정, 방명록의 정보를 불러온다.
 * 			  불러오는 방식은 모두 userid, pwd로 검색해온 user정보를 parameter인자로
 * 			  넘겨주어 정보를 가져오는 방식으로 통일.
 * 			  BoardVo를 이용해서 일정정보와 방명록 정보를 가져올 수 있다.
 * 기존 내용: Calendar 클래스를 이용해서 현재 년, 월, 일 정보를 가져와서 session Attribute한다.
 * 			  날짜정보는 yyyy-mm-dd의 String 형태로 맞춰주어 DB에 입력되어 있는 날짜와 비교하기에
 * 			  용이하도록 한다.
 * 			  
 * 			  로그인 정보(id,pwd)를 이용하여 loginUser라는 user정보를 가져오고
 * 			  loginUser정보를 넘겨주어, DogDTO, DiaryVo, BoardVo(plan,visitbook)의 정보를 가져온다.
 * 			  가져온 user, dog, diary, plan, visitbook 정보를 session Attribute 한다.
 * 
 * 추가할 사항: 친구 맺기 기능
 * 
 * 수정: 최성훈
 * 수정일: 2014-04-23
 * 내용: Vo타입의 메소드 모두 DTO 타입으로 바꿔줌.
 * 
 * 수정: 최성훈
 * 수정일: 2014-04-23
 * 내용: SessionFilter를 만듦으로써 user정보(id,pwd)를 session.getAttribute으로 받는다. 
 * @author 최성훈
 * 
 * 수정: 최성훈
 * 수정일: 2014-05-13
 * 내용: 미리보기를 위한 몇가지 설정 추가, 실제경로에서 이미지 파일 가져오기
 * 
 * 수정: 최성훈
 * 수정일: 2014-05-20
 * 내용: 1.로그인할 때 아이디를 잘 못 입력한 경우, 빈 칸으로 로그인 시도하는 경우,
 * 		비밀번호를 잘 못 입력하는 경우, 아이디 비밀번호가 일치하지 않는 경우에 모두 
 * 		필터를 거쳐 세션이 붙어서 접속이 안되는 오류 해결하고자 위의 경우에만 적용되는
 * 		LoginException을 만들어 추가하고 catch부분에서 session.invalidate해줌.
 * 		 2.로그인 방식 변경: id만 dao로 보내어 가져온 userpasswd를 파라미터로 받은 passwd값과 비교)
 * 		 3.소스 정리
 * 		 4.allDiaryList,allVisitList session붙임(2014-05-21)
 * 
 * 수정: 최성훈
 * 수정일: 2014-05-22
 * 내용: 소스코드 정리
 * 
 * 수정: 2014-05-24, 최성훈
 * 내용: 불필요한 session attributing을 request로 바꿈
 * 
 * 수정: 2014-05-25, 최성훈
 * 내용: 미니홈 아닌 전체 메인페이지(home.jsp, HomeAction)를 만듦으로써 
 * 		 여기선 불필요한 session스코프 이용 없앰, 
 * 		 session스코프 컨트롤은 HomeAction에서 하도록 한다.
 * 
 * 수정: 2014-06-10, 이수진
 * 내용: 유기견 광고 뜨도록 기능 추가
 */

public class MinihomeMainAction implements Action {  

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{  
		
		int cnt=0;
		String userid = null;
		String updateimg = null;
		UserDTO loginUser = null;
		DiaryDTO diary = null;
		DogDTO planDog = null;
		List<DogDTO> dog = null;
		List<PlanDTO> todayPlan = null;
		PlanDTO nextPlan = null;
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		
		try {
			userid = (String)session.getAttribute("userid");								//14-05-25 성훈추가: 친구아이디인지 내아이디인지 구분하기
			if(request.getParameter("userid")!=null){	
				if(userid!=request.getParameter("userid"))	
					userid = request.getParameter("userid");
			}	
			loginUser = UserDAO.logCheck(userid);
			
			updateimg = request.getParameter("updateimg");									//이미지 클릭해서 메인사진 바꾸기
			if(updateimg!=null){
				UpdateDAO.updateImg(loginUser.getUserid(),updateimg);
				loginUser = UserDAO.logCheck(loginUser.getUserid());	
			}
			
			dog = TestDAO.getMyDogInfo(loginUser.getUserno());								//내 강아지 정보가져오기
			
			
			
			diary = TestDAO.selectLastDiary(loginUser.getUserno());							//가장 최근 다이어리정보 가져오기(+사진,내용도)
			if(diary != null){
				if(!diary.getBrdcontent().split("!split!")[0].equals(""))
					request.setAttribute("diImage", diary.getBrdcontent().split("!split!")[0]);
				else	request.setAttribute("diImage",null);
				request.setAttribute("diContent",  diary.getBrdcontent().split("!split!")[1]);	//일기+사진+내용 request에 setAttribute
			}
			nextPlan = TestDAO.unfinishedPlan(loginUser.getUserid());						//오늘 이후의 일정
			if(nextPlan != null){
				if(nextPlan.getPlandogno()!=0){
					planDog = DogDAO.getDogInfo(loginUser.getUserno(), nextPlan.getPlandogno());
					request.setAttribute("plDogTitle", planDog.getDogname()+" "+nextPlan.getBrdcontent().split("!split!")[0]);
				}else{
					request.setAttribute("plDogTitle", null);
				}
				nextPlan.setBrdcontent(nextPlan.getBrdcontent().split("!split!")[1]);
			}
			
			todayPlan = TestDAO.myTodaysPlan((String)session.getAttribute("userid"));		//오늘 내 일정리스트 가져오기
			cnt = todayPlan.size();
			
			session.setAttribute("plans", cnt);				// 14-05-13 성훈추가: 일정 개수
			session.setAttribute("todayPlan", todayPlan);	//오늘 일정리스트
			request.setAttribute("nextPlan", nextPlan);		//이 다음 일정 한 개
			
			request.setAttribute("di", diary);				//가장 최근 일기
			request.setAttribute("user", loginUser);		//user정보
			request.setAttribute("dog", dog);				//내강아지정보
			request.setAttribute("planDog", planDog);

			url = "miniHome/main.jsp";
			
			//유기견 광고를 랜덤으로 받아 세션에 저장
			SqlSession sqlSession = null;
			String userId = (String)session.getAttribute("userid");
			MissingBoardDTO mdto = null;
			mdto = MFABoardDAO.getAds(userId);
			
			session.setAttribute("mdto", mdto);

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}