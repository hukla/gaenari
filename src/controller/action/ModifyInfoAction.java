package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String url = "/error.jsp";
		String userid,userno,address,passwd,username=null;
		try{
			userid = request.getParameter("userid");
			userno = request.getParameter("userno");
			address = request.getParameter("address");
			passwd = request.getParameter("pwd");
			username = request.getParameter("username");
			if(UserDAO.idCheck(userid)!=null){
				throw new Exception("이미 사용중인 ID입니다. 다른 ID를 입력해주세요.");
			}
			UpdateDAO.updateInfo(new UserDTO(Integer.parseInt(userno),userid,username,passwd,address));
			url = "/userinfo.do?userid="+userid;
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
