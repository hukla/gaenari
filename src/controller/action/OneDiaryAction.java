package controller.action;

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
import model.dto.PlanDTO;
import model.dto.UserDTO;
/**
 * 작성자: 최성훈
 * 작성: 2014-04-23
 * 작성 내용: 일기 한 개의 상세보기
 * 			  메인화면 일기 미리보기의 하이퍼링크를 통해 한 개의 일기를 볼 수 있다. 
 * 			  a tag에서 넘겨받은 brdno를 이용하여 BoardDTO에서 저장된 일기를 검색한다.
 * 			  넘겨받은 일기정보를 oneDiary로 request Attribute한다.
 * 
 * 수정: 2014-05-13, 최성훈
 * 내용: 사진이 등록된 일기에 한해서 사진보기 가능.
 * 
 * 수정: 2014-05-14, 최성훈
 * 내용: 이전 일기, 다음 일기 보기기능 추가
 * 
 * 수정중: 2014-05-20, 최성훈
 * 내용: 이전일기, 다음 일기 본인 것만 열람하도록 하기
 * 
 * 수정: 2014-05-21, 최성훈
 * 내용: 이전글, 다음글 오류수정 완료
 * 			일기 전체리스트를 받아오고 그 리스트의 인덱스 번호로 이전, 다음글 열람하기
 * 
 * 수정: 2014-05-26, 최성훈
 * 내용: 기존에 저장된 일기 내용의 줄바꿈기능 추가
 * 
 * 수정: 2014-05-27, 최성훈
 * 내용: 친구홈피 방문과 내홈피 방문을 구분하기 위해 userDTO를 구분하고
 * 		 그에 따른 정보를 불러와 setAttribute함.
 */
public class OneDiaryAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "login/error.jsp";
		String [] oneDiaryContents = null;
		List<DiaryDTO> dlist = null;
		BoardDTO oneDiary = null;
		DiaryDTO diaryDTO = null;
		BoardDTO tmpDiary = null;
		String oneDiaryImg=null;
		String userid = null;
		UserDTO user = null;
		String index=null;
		int indexInt=0;
		
		//14-05-14 성훈 추가 일기접근 번호(게시판번호, 전체일기 인덱스번호)
		System.out.println("받은 brdno="+request.getParameter("brdno")+"번");
		System.out.println("받은 index="+request.getParameter("index"));
		if(request.getParameter("index")!=null)	index = request.getParameter("index");
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
			dlist = TestService.allDiaryService(user);		//user정보를 이용하여 전체 일기 리스트받아오기
			/**
			 * 14-05-14 성훈 추가: 일기접근 번호(게시판번호, 일기번호)
			 * 이전글, 다음글로 액션에 들어올 땐 if문으로 
			 * 메인, 달력 페이지의 미리보기 버튼으로 액션들어올 땐 else if 문으로 접근
			 * 
			 * 14-05-21 성훈 수정: 
			 * 기존에 일기번호로 접근했던 것을 user에 해당하는 전체일기의 index로 접근
			 */	
			if(index!=null){//이전글, 다음글 클릭하여 들어올 경우
				if(Integer.parseInt(index)<0 || Integer.parseInt(index)>dlist.size()-1)	
					throw new IndexOutOfBoundsException("페이지의 끝입니다.");
				//이전글, 다음글 클릭하여 얻은 index가 정해진 범위를 초과하면 Exception발생!
				diaryDTO = TestService.getOneDiary(dlist.get(Integer.parseInt(index)).getDbrdno(),user.getUserno());
				//이전글, 다음글 클릭하여 얻능 index와 현재 user정보에 해당하는 diaryDTO가져오기
			}
			else if(request.getParameter("brdno")!=null)//미리보기 버튼 클릭하여 들어올 경우
				diaryDTO = TestService.getJustDiary(Integer.parseInt(request.getParameter("brdno")));	
			
			for(DiaryDTO dto:dlist)
				if(dto.getBrdno()==diaryDTO.getBrdno())	indexInt = dlist.indexOf(dto);
				//전체 일정중 현재 보여지는 일기에 해당하는 index를 구함
			
			oneDiary = TestService.oneDiaryService(diaryDTO.getBrdno());
			//14-05-26 성훈수정: 다이어리 컨텐츠 줄바꿈 추가
			oneDiaryContents = oneDiary.getBrdcontent().replaceAll("\r\n", "<br/>").split("!split!");
			
			// 14-05-13 성훈 수정: 이미지 경로가 null인지 확인하는 조건 수정
			if(oneDiaryContents[0].equals(null) || oneDiaryContents[0].trim().length() == 0){
				System.out.println("경로 null임!"+oneDiaryContents[0]);
				request.setAttribute("oneDiaryImg", null);
			}else{
				oneDiaryImg = oneDiaryContents[0];
				request.setAttribute("oneDiaryImg", oneDiaryImg);
				System.out.println("경로 null아님!"+oneDiaryContents[0]);
			}
			
			//14-05-14 성훈 수정: diarydto를 받는 tmpDiary를 만들어서 content에 이미지 경로 제외시키도록 설정
			tmpDiary = oneDiary;
			System.out.println(tmpDiary);
			tmpDiary.setBrdcontent(oneDiaryContents[1]);
			
			request.setAttribute("user", user);
			request.setAttribute("index", indexInt);	//현재 보여지는 일정의 index 번호 setAttribute
			request.setAttribute("oneDiary", tmpDiary);	//선택된 일정의 전체정보 setAttribute
			url = "miniHome/oneDiary.jsp";
			
		} catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
		}  catch (Exception e){
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
