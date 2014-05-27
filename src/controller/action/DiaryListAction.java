package controller.action;

/**
 * 작성: 2014-05-09
 * 작성자: 최성훈
 * 내용: 일기 전체 목록으로 이동
 * 		
 * 수정: 2014-05-20, 최성훈
 * 내용: 일기 정보가 없을 때 페이지에 접근 못 하던 오류 해결
 */

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TestService;
import model.UserService;
import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.UserDTO;

public class DiaryListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String url = "login/error.jsp";
		String diaryFisrtImg = null;
		String diaryFirstWords = null;
		String diarySecondImg = null;
		String diarySecondWords = null;
		String[] diaryContents = null;
		String pageNumber = null;
		String diaryNumber = null;
		BoardDTO diaryFirst = null;
		BoardDTO diarySecond = null;
		List<DiaryDTO> tenDiaries = null;
		List<BoardDTO> diaryList = null;
		int pageCount = 0;
		UserDTO user = null;
		String userid = null;
		boolean flag = false;
		
		try {
			user = (UserDTO) session.getAttribute("user");
			userid = user.getUserid();
			//다른 아이디를 클릭할 때
			if(request.getParameter("userid")!=null){				//만약 userid 파라미터를 넘겨 받았다면
				if(userid!=request.getParameter("userid")){			//그리고 만약 세션 userid와 파라미터userid가 다르다면
					userid = request.getParameter("userid");		//userid에 파라미터userid를 저장하기
					user = UserService.login(userid);
				}
			}
			
			diaryList = TestService.diaryService(user);
			pageNumber = request.getParameter("pageNumber");
			diaryNumber = request.getParameter("diaryNumber");
			
			
			if(pageNumber==null){
				pageNumber="1";
				flag = false;
			}
			if(diaryNumber==null){
				diaryNumber=Integer.toString(diaryList.size()-1);
				flag = true;
			}
			
			pageCount = TestService.getDiaryCount(user.getUserno());
			System.out.println("선택페이지:"+Integer.parseInt(pageNumber)+", 계산값:"+(Integer.parseInt(pageNumber)-1)*10);
			tenDiaries = TestService.getTenDiaries((Integer.parseInt(pageNumber)-1)*10,user.getUserno());
			
			//14-05-20 성훈 수정: 다이어리 정보가 있을 때만 출력하기
			if (!diaryList.isEmpty()) {
				
				diaryFirst = diaryList.get(Integer.parseInt(diaryNumber)); // 첫번째 테두리에 넣을 일기 정보
				diaryContents = diaryFirst.getBrdcontent().split("!split!");

				// 14-05-13 성훈 수정: 이미지 경로가 null인지 확인하는 조건 수정
				if (diaryContents[0] == null || diaryContents[0].trim().length() == 0) {
					System.out.println("경로 null임!" + diaryContents[0]);
					request.setAttribute("diaryFirstImg", null);
				} else {
					diaryFisrtImg = diaryContents[0]; // 첫번째 일기 내용중 이미지경로 발췌
					request.setAttribute("diaryFirstImg", diaryFisrtImg);
					System.out.println("경로 null아님!" + diaryContents[0]);
				}
				diaryFirstWords = diaryContents[1].replaceAll("\r\n", "<br/>"); // 첫번째 일기 내용중 글부분 발췌
				//14-05-26 성훈추가: 기존의 일기 내용에 줄바꿈 추가
				diaryFirst.setBrdcontent(diaryFirstWords); 	// content에 글부분만 다시저장
				
				//14-05-20 성훈 수정: 다이어리 정보가 2개 이상 저장되어 있을 때 
				if (diaryList.size() > 1) {
					diarySecond = diaryList.get(Integer.parseInt(diaryNumber) - 1); // 두번째 테두리에 넣을 일기 정보
					diaryContents = diarySecond.getBrdcontent().split("!split!");

					// 14-05-13 성훈 수정: 이미지 경로가 null인지 확인하는 조건 수정
					if (diaryContents[0] == null || diaryContents[0].trim().length() == 0) {
						System.out.println("경로 null임!" + diaryContents[0]);
						request.setAttribute("diarySecondImg", null);
					} else {
						diarySecondImg = diaryContents[0]; // 두번째 일기 내용중 이미지경로 발췌
						request.setAttribute("diarySecondImg", diarySecondImg);
						System.out.println("경로 null아님!" + diaryContents[0]);
					}
					diarySecondWords = diaryContents[1]; // 두번째 일기 내용중 글부분 발췌
					diarySecond.setBrdcontent(diarySecondWords); // content에 글부분만 다시저장
				}
			}
			request.setAttribute("pageNumber", pageNumber);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("tenDiaries", tenDiaries);
			request.setAttribute("diaryNumber", diaryNumber);
			request.setAttribute("diaryFirst", diaryFirst);
			request.setAttribute("diarySecond", diarySecond);
			request.setAttribute("diaryList", diaryList);
			request.setAttribute("flag", flag);
			request.setAttribute("user", user);
			url = "miniHome/diary.jsp";
		} catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
