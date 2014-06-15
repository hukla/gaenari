package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.dto.UserDTO;
/**
 * 작성자: 최성훈
 * 작성: 2014-05
 * 내용: 개인 정보수정
 * 
 * 수정: 2014-06-04, 최성훈
 * 내용: 아이디 중복체크 추가
 */
public class ModifyInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String userno,address,passwd=null;
		try{
			userno = request.getParameter("userno");
			address = request.getParameter("address");
			passwd = request.getParameter("pwd");
			
			if(passwd==null || passwd.trim().length()==0 || address==null || address.trim().length()==0){
				throw new Exception("수정사항을 모두 입력해주세요.");
			}
			
			UserDAO.updateInfo(new UserDTO(Integer.parseInt(userno),passwd,address));
			session.removeAttribute("pwd");
			session.setAttribute("pwd", passwd);
			url = "/userinfo.do?userid="+session.getAttribute("userid");
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
