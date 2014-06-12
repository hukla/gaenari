package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.DogDAO;
import model.dao.TestDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.DogDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;
import exception.LoginException;
/**
 * 작성: 2014.04.21
 * 작성 목적: 일정의 상세보기 서비스 제공
 * 작성 내용: 메인화면, 월별로 정리된 일정 미리보기 등의 하이퍼링크를 통해
 * 			  한 개의 일정을 볼 수 있다. 
 * 			  a tag에서 넘겨받은 brdno를 이용하여 BoardDTO에서 저장된 일정을 검색한다.
 * 			  넘겨받은 일정 정보를 onePlan으로 request Attribute한다.
 * 
 * 수정: 2014-05-14, 최성훈
 * 수정내용: 이전글, 다음글 기능 추가
 * 
 * 수정: 2014-05-20, 최성훈
 * 수정내용: (진행중)이전글, 다음글 넘기는 중에 다른 user 일정도 열람하게되는 오류 수정
 * 			중간에 게시판 번호빵꾸나는 부분 알아서 건너 뛰도록 설정해줘야함.
 * 
 * 수정: 2014-05-21, 최성훈
 * 수정내용: 이전글, 다음글 오류수정 완료
 * 			일정 전체리스트를 받아오고 그 리스트의 인덱스 번호로 이전, 다음글 열람하기
 * 
 * 수정: 2014-05-27, 최성훈
 * 내용: 친구홈피 방문과 내홈피 방문을 구분하기 위해 userDTO를 구분하고
 * 		 그에 따른 정보를 불러와 setAttribute함.
 */
public class OnePlanAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		List<PlanDTO> plist = null;
		BoardDTO onePlan = null;
		PlanDTO planDTO = null;
		DogDTO dog = null;
		String userid = null;
		String planType = null;
		UserDTO user=null;
		String index=null;
		int indexInt=0;
		
		//14-05-14 성훈 추가 일정접근 번호(게시판번호, 전체일정 인덱스번호)
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
					user = UserDAO.logCheck(userid);
				}
			}
			plist = TestDAO.selectAllPlan(user);			//user정보를 이용하여 전체 일정 리스트받아오기
			for(PlanDTO dto: plist){
				dto.setBrdcontent(dto.getBrdcontent().replaceAll("\r\n", "<br/>"));
			}
			/**
			 * 14-05-14 성훈 추가: 일정접근 번호(게시판번호, 일정번호)
			 * 이전글, 다음글로 액션에 들어올 땐 if문으로 
			 * 메인, 달력 페이지의 미리보기 버튼으로 액션들어올 땐 else if 문으로 접근
			 * 
			 * 14-05-21 성훈 수정: 
			 * 기존에 일정번호로 접근했던 것을 user에 해당하는 전체일정의 index로 접근
			 */
			System.out.println("일정개수: "+plist.size()+", 받은 index: "+index);
			if(index!=null){//이전글, 다음글 클릭하여 들어올 경우
				if(Integer.parseInt(index)<0 || Integer.parseInt(index)>plist.size()-1)	
					throw new IndexOutOfBoundsException("페이지의 끝입니다.");
				//이전글, 다음글 클릭하여 얻은 index가 정해진 범위를 초과하면 Exception발생!
				planDTO = TestDAO.getOnePlan(plist.get(Integer.parseInt(index)).getPbrdno(),user.getUserno());
				//이전글, 다음글 클릭하여 얻능 index와 현재 user정보에 해당하는 planDTO가져오기
			}
			
			else if(request.getParameter("brdno")!=null)//미리보기 버튼 클릭하여 들어올 경우
				planDTO = TestDAO.getJustPlan(Integer.parseInt(request.getParameter("brdno")));
			
			//14-05-26 성훈추가: 줄바꿈추가
			for(PlanDTO dto:plist)
				if(dto.getBrdno()==planDTO.getBrdno())	indexInt = plist.indexOf(dto);
				//전체 일정중 현재 보여지는 일정에 해당하는 index를 구함
			
			onePlan = TestDAO.selectOnePlan(planDTO.getBrdno());
			planType = onePlan.getBrdcontent().split("!split!")[0];
			onePlan.setBrdcontent(onePlan.getBrdcontent().split("!split!")[1]);
			dog = DogDAO.getDogInfo(user.getUserno(), planDTO.getPlandogno());
			
			if(request.getParameter("milenari")!=null){
				request.setAttribute("checkMilenari", 1);
			}
			request.setAttribute("index", indexInt);	//현재 보여지는 일정의 index 번호 setAttribute
			request.setAttribute("onePlan", onePlan);	//선택된 일정의 전체정보 setAttribute
			request.setAttribute("type", planType);
			request.setAttribute("user", user);
			request.setAttribute("dog", dog);
			url = "miniHome/onePlan.jsp";

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		} catch (LoginException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
