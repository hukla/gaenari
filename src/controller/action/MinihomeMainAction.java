package controller.action;  

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.dao.TestDAO;
import model.dao.UpdateDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.DogDTO;
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
 */

public class MinihomeMainAction implements Action {  

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{  
		
		int cnt=0;
		int index=0;
		int lastIndex=0;
		String userid = null;
		String savePath = null;
		String fullpath = null;
		String updateimg = null;
		UserDTO loginUser = null;
		List<DogDTO> dog = null;
		List<BoardDTO> allPlanList = null;
		List<BoardDTO> planList = null;
		List<BoardDTO> diaryList = null;
		List<BoardDTO> visitList = null;
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		
		try {
			//14-05-25 성훈추가: 친구아이디인지 내아이디인지 구분하기
			userid = (String)session.getAttribute("userid");		//세션의 userid가져오기
			
			//다른 아이디를 클릭할 때
			if(request.getParameter("userid")!=null){				//만약 userid 파라미터를 넘겨 받았다면
				if(userid!=request.getParameter("userid"))			//그리고 만약 세션 userid와 파라미터userid가 다르다면
					userid = request.getParameter("userid");		//userid에 파라미터userid를 저장하기
			}				
			loginUser = UserDAO.logCheck(userid);				// userid로 user정보 가져온다
			// 14-05-13 성훈 수정 세개씩 미리보기
			updateimg = request.getParameter("updateimg");
			if(updateimg!=null){
				UpdateDAO.updateImg(loginUser.getUserid(),updateimg);
				loginUser = UserDAO.logCheck(loginUser.getUserid());	
			}
			///////////////////////////////////////////////////////////////////
			//14-05-26 성훈추가: 사용자별 사진첩 폴더생성
			
			///////////////////////////////////////////////
			diaryList = TestDAO.selectThreeDiaries(loginUser);	// 이 페이지 user의 일기, 일정, 방명록 3개씩 가져오기
			planList = TestDAO.selectThreePlans(loginUser);
			visitList = TestDAO.selectThreeVisits(loginUser);
			allPlanList = TestDAO.selectPlan(loginUser);
			dog = TestDAO.getMyDogInfo(loginUser.getUserno());
			
			request.setAttribute("user", loginUser);				// 이 페이지 user를 request에 setAttribute
			request.setAttribute("dog", dog);
			request.setAttribute("diary", diaryList);
			request.setAttribute("planList", planList);
			request.setAttribute("visit", visitList);
			// 14-05-13 성훈 추가 실제경로에서 이미지 가져오기
			savePath = session.getServletContext().getRealPath("image");
			fullpath = savePath + "\\" + "hoonc.jpg";
			request.setAttribute("fullpath", fullpath);

			// 14-05-13 성훈 추가 오늘의 일정 띄우기
			// - 1개인 경우와 1개 이상인 경우 나눔
			for (BoardDTO plans : allPlanList) {
				index++;
				if (plans.getWrdate().equals(session.getAttribute("today"))) {
					cnt++;
					lastIndex = index - 1;
				}
			}
			// 14-05-13 성훈추가: 일정 개수
			session.setAttribute("plans", cnt);
			// 14-05-13 성훈추가: 당일 일정 1개인 경우 일정정보
			if (cnt == 1)	session.setAttribute("plan", allPlanList.get(lastIndex));

			url = "miniHome/main.jsp";

		} catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
		} catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}