package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.dao.VisitDAO;
import model.dto.BoardDTO;
import model.dto.UserDTO;
/**
 * 작성일: 2014-04-26
 * 작성자: 최성훈
 * 내용: 방명록을 입력한다.
 * 
 * 수정: 2014-05-26, 최성훈
 * 내용: 컨텐츠 줄바꿈추가
 * 
 * 수정: 2014-05-29, 최성훈
 * 내용: 갑자기 한글입력 깨지는 현상 막기위해 new String(변수명.getBytes("8859_1"),"utf-8")추가
 * 		 문제 해결하기 위해, new String부분은 우선 주석처리
 */
public class WriteVisitAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String content = null;
		UserDTO user = null;
		UserDTO writer = null;
		String url = "/error.jsp";
		int brdno = 0;
		
		try {
			user = UserDAO.logCheck(request.getParameter("hostid"));
			content = request.getParameter("content").replaceAll("\r\n", "<br/>");
			writer = UserDAO.logCheck((String)session.getAttribute("userid"));
			if (content.equals(null) || content.trim().length() == 0) {
				throw new Exception("방명록 내용을 입력해주세요.");
			} else {

				BoardDTO boardDTO = new BoardDTO(content,
						(String) session.getAttribute("today"),
						(String) session.getAttribute("userid"),writer.getImg(), "vi",
						(int) (user.getUserno()));		// 현재 시간과 보드 타입 "vi"와 userno를 넣어준다.

				brdno = VisitDAO.insertVisitBoard(boardDTO);
				VisitDAO.insertVisitbook(brdno);		// 보드DTO와 방명록DTO에 받은 값들을 입력해준다.
			}
			url = "/visitList.do?userid="+user.getUserid();
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
