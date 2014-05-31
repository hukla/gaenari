package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TestDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.UserDTO;

public class ModifyInfoFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url="/error.jsp";
		BoardDTO boardDTO = null;
		String chosenDate = null;	//등록할 때 선택했던 날짜형태(yyyy-mm-dd)
		String date = null;			//수정페이지에서 보여줄 날짜형태(mm/dd/yyyy)
		String brdno = null;
		String userid = null;
		UserDTO user = null;
		
		try{
			userid = request.getParameter("userid");
			if(userid==null){
				userid = (String) session.getAttribute("userid");
			}
			user = UserDAO.logCheck(userid);
			brdno = request.getParameter("brdno");
			if(brdno.equals(null) || brdno.trim().length()==0)	throw new Exception("일정정보가 없습니다.");
			boardDTO = TestDAO.selectOnePlan(Integer.parseInt(brdno));
			chosenDate = boardDTO.getWrdate();	//저장된 wrdate(yyyy-mm-dd)를 가져옴
			date = chosenDate.substring(5,7)+"/"+chosenDate.substring(8)+"/"+chosenDate.substring(0, 4);
			//wrdate를 (mm/dd/yyyy)형태의 날짜형식으로 바꿔줌
			request.setAttribute("onePlan", boardDTO);
			request.setAttribute("date", date);
			request.setAttribute("user", user);
			
			url="miniHome/updatePlan.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
