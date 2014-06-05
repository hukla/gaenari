package controller.action;
/**
 * 작성일: 2014-04-26
 * 작성자: 최성훈
 * 내용: 일정 목록페이지에서 일정을 입력한다.
 * 		 입력받은 제목, 지역, 내용을 저장한다.
 * 		 
 * 		 입력받은 값들을 BoardDTO와 PlanDTO에 insert해준다.
 * 
 * 수정: 2014-05-22, 최성훈
 * 내용: 불필요한 소스코드 정리
 * 
 * 수정: 2014-05-26, 최성훈
 * 내용: 컨텐츠 입력시 줄바꿈추가
 * 
 * 수정: 2014-05-29, 최성훈
 * 내용: 갑자기 한글입력 깨지는 현상 막기위해 new String(변수명.getBytes("8859_1"),"utf-8")추가
 * 		 문제 해결하기 위해, new String부분은 우선 주석처리
 */
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.InsertDAO;
import model.dto.BoardDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;

public class WritePlanAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String title,loc,tmpDate,content,date,plantype,plandogno = null;
		BoardDTO boardDTO = null;
		int brdno=0;
		
		try {
			title = request.getParameter("title");
			loc = request.getParameter("loc");
			tmpDate = request.getParameter("date"); // "05/11/2014"
			content = request.getParameter("content").replaceAll("\r\n", "<br/>");
			plantype = request.getParameter("plantype");
			plandogno = request.getParameter("plandogno");
			
			System.out.println(title+loc+tmpDate+content);
			if (title.equals(null) || title.trim().length() == 0 || loc.equals("unchosen")
					|| tmpDate.equals(null) || tmpDate.trim().length() == 0
					|| content.equals(null) || content.trim().length() == 0
					|| plandogno.equals("unchosen") || plantype.equals("unchosen")) {
				throw new Exception("내용을 모두 입력해주세요.");
			} else {
				date = tmpDate.substring(6, 10)+"-"+tmpDate.substring(0, 2)+"-"+tmpDate.substring(3, 5);
				content = plantype+"!split!"+content;
				boardDTO = new BoardDTO(content, date,(String) session.getAttribute("userid"), title, "pl",
						(int)((UserDTO) session.getAttribute("user")).getUserno());
				brdno = InsertDAO.insertPlanBoard(boardDTO);
				InsertDAO.insertPlan(new PlanDTO(brdno, loc, date,Integer.parseInt(plandogno)));
				// 입력값들을 보드DTO와 플랜DTO에 insert해준다.
			}
			url = "/planList.do";
		} catch (StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
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
