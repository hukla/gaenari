package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.InsertService;
import model.dto.BoardDTO;
import model.dto.UserDTO;
import model.dto.VisitDTO;

public class WriteVisitAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String content = null;
		String url = "login/error.jsp";
		int brdno = 0;
		
		try {
			content = request.getParameter("content");
			if (content.equals(null) || content.trim().length() == 0) {
				throw new Exception("방명록 내용을 입력해주세요.");
			} else {

				BoardDTO boardDTO = new BoardDTO(content,
						(String) session.getAttribute("today"),
						(String) session.getAttribute("userid"), "vi",
						(int) ((UserDTO) session.getAttribute("user")).getUserno());
				// 현재 시간과 보드 타입 "vi"와 userno를 넣어준다.

				brdno = InsertService.insertVisitBoard(boardDTO);
				System.out.println("인서트된 보드넘버" + brdno);
				InsertService.insertVisitbook(brdno);
				// 보드DTO와 방명록DTO에 받은 값들을 입력해준다.
			}
			url = "control?command=visitList";
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
