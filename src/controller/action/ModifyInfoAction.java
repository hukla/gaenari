package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UpdateDAO;
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
		String userid,userno,address,passwd,username=null;
		try{
			userid = request.getParameter("userid");
			userno = request.getParameter("userno");
			address = request.getParameter("address");
			passwd = request.getParameter("pwd");
			username = request.getParameter("username");
			
			if(userid==null || userid.trim().length()==0 || passwd==null || passwd.trim().length()==0
					|| address==null || address.trim().length()==0 || username==null || username.trim().length()==0){
				throw new Exception("수정사항을 모두 입력해주세요.");
			}
			
			if(UserDAO.idCheck(userid)!=null){
				if(!userid.equals(session.getAttribute("userid"))){
					throw new Exception("이미 사용중인 아이디 입니다.");
				}
			}
			
			UpdateDAO.updateInfo(new UserDTO(Integer.parseInt(userno),userid,username,passwd,address));
			session.removeAttribute("userid");
			session.removeAttribute("pwd");
			session.setAttribute("userid", userid);
			session.setAttribute("pwd", passwd);
			url = "/userinfo.do?userid="+userid;
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
