package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TestDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.UserDTO;

public class VisitBookAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		UserDTO user = null;
		UserDTO visitor = null;
		String userid = null;
		List<BoardDTO> visitList = null;
		List<BoardDTO> myList = null;
		List<BoardDTO> yourList = null;
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
			
			visitList = TestDAO.selectVisit(user);				//페이지 주인인 user의 방명록을 가져옴 거기엔 작성자인 userid도 있음.
			myList = new ArrayList<BoardDTO>();
			yourList = new ArrayList<BoardDTO>();
			for(BoardDTO dto:visitList){
				System.out.println("??"+dto.getUserid().trim()+"=="+UserDAO.selectOne(dto.getUserno()).getUserid().trim());
				System.out.println(dto.getUserid().length()+"=="+UserDAO.selectOne(dto.getUserno()).getUserid().length());
				if((dto.getUserid()).trim().equals(((UserDAO.selectOne(dto.getUserno())).getUserid()).trim())){	//내가쓴글이면
					System.out.println("여기로온다.");
					myList.add(dto);
				}else{
					yourList.add(dto);
				}
			}
			request.setAttribute("myList", myList);
			request.setAttribute("yourList", yourList);
			request.setAttribute("visitAllList",visitList);
			request.setAttribute("user", user);
			url = "miniHome/visitbook.jsp";
		} catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
