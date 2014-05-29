package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TestDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.UserDTO;
import model.dto.VisitDTO;
import exception.LoginException;

/**
 * 작성자: 최성훈 
 * 작성: 2014-04-23 
 * 작성 내용: 방명록 한 개의 상세보기 메인화면 방명록 미리보기의 하이퍼링크를 통해 한 개의
 * 			  방명록을 볼 수 있다. a tag에서 넘겨받은 brdno를 이용하여 BoardDTO에서 저장된 
 * 			  방명록을 검색한다. 넘겨받은 방명록정보를 oneVisit로 request Attribute한다.
 * 
 * 수정: 2014-05-27, 최성훈
 * 내용: 친구홈피 방문과 내홈피 방문을 구분하기 위해 userDTO를 구분하고
 * 		 그에 따른 정보를 불러와 setAttribute함.
 * 
 */
public class OneVisitAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String url = "/error.jsp";
		List<VisitDTO> vlist = null;
		VisitDTO visitDTO = null;
		BoardDTO oneVisit = null;
		String userid = null;
		UserDTO user = null;
		String index = null;
		int indexInt = 0;
		// 14-05-14 성훈 추가 방명록접근 번호(게시판번호, 전체일정 인덱스번호)
		System.out.println("받은 brdno=" + request.getParameter("brdno") + "번");
		System.out.println("받은 index=" + request.getParameter("index"));
		if (request.getParameter("index") != null)
			index = request.getParameter("index");
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
			vlist = TestDAO.selectAllVisit(user);				//user정보를 이용하여 전체 방명록 리스트받아오기
			/**
			 * 14-05-14 성훈 추가: 일정접근 번호(게시판번호, 일정번호) 이전글, 다음글로 액션에 들어올 땐 if문으로
			 * 메인, 달력 페이지의 미리보기 버튼으로 액션들어올 땐 else if 문으로 접근
			 * 
			 * 14-05-21 성훈 추가: 이전글, 다음글 보기 기능
			 * user에 해당하는 전체방명록의 index로 접근
			 */
			if (index != null) {// 이전글, 다음글 클릭하여 들어올 경우
				if (Integer.parseInt(index) < 0 || Integer.parseInt(index) > vlist.size() - 1)
					throw new IndexOutOfBoundsException("페이지의 끝입니다.");
				// 이전글, 다음글 클릭하여 얻은 index가 정해진 범위를 초과하면 Exception발생!
				visitDTO = TestDAO.getOneVisit(vlist.get(Integer.parseInt(index)).getVbrdno(),user.getUserno());
				// 이전글, 다음글 클릭하여 얻은 index와 현재 user정보에 해당하는 visitDTO가져오기
			}

			else if (request.getParameter("brdno") != null)// 미리보기 버튼 클릭하여 들어올 경우
				visitDTO = TestDAO.getJustVisit(Integer.parseInt(request.getParameter("brdno")));
				
			for (VisitDTO dto : vlist)
				if (dto.getBrdno() == visitDTO.getBrdno())
					indexInt = vlist.indexOf(dto);
			// 전체 방명록중 현재 보여지는 방명록에 해당하는 index를 구함

			oneVisit = TestDAO.selectOneVisit(visitDTO.getBrdno());
			request.setAttribute("index", indexInt); // 현재 보여지는 방명록의 index 번호 setAttribute
			request.setAttribute("oneVisit", oneVisit); // 선택된 방명록의 전체정보  setAttribute
			request.setAttribute("user", user);
			url = "miniHome/oneVisit.jsp";

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
