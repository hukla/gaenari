package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.InsertService;
import model.dto.UserDTO;
/**
 * 작성: 2014-05-24
 * 작성자: 최성훈
 * 내용: 회원가입, SessionFilter를 피하기 위해 url패턴 login으로 접근
 * 추가해야할 사항: 페이스북 로그인으로 Email주소를 받아올 때
 * 					가입돼있는 사람인지 아닌지 체크해서 가입자는
 * 					LoginCheckAction으로 보내고 가입되지 않은 사람은
 * 					join.jsp로 보내도록 하기
 */
public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url="login/error.jsp";
		String userid,pwd,pwd1,addr,username,type,email=null;
		
		try{
			userid = request.getParameter("userid");
			pwd = request.getParameter("pwd");
			pwd1 = request.getParameter("pwd1");
			email = request.getParameter("email");
			username = request.getParameter("username");
			type = request.getParameter("type");
			addr = request.getParameter("addr");
			
			//입력 정보 불충분시
			if(userid.equals(null) || userid.trim().length()==0 || email.equals(null) || email.trim().length()==0
					|| pwd.equals(null) || pwd.trim().length()==0 || pwd1.equals(null) || pwd1.trim().length()==0
					|| email.equals(null) || email.trim().length()==0 || username.equals(null) || username.trim().length()==0
					|| type.equals(null) || type.trim().length()==0 || addr.equals(null) || addr.trim().length()==0){
				throw new Exception("정보를 모두 입력해주세요.");
			}
			
			//비밀번호 일치 안했을 때
			if(!pwd.equals(pwd1)){
				throw new Exception("비밀번호가 일치하지 않습니다.");
			}
			InsertService.insertUser(new UserDTO(userid,pwd,email,username,addr,Integer.parseInt(type)));
			session.setAttribute("userid", userid);
			session.setAttribute("pwd", pwd);
			request.setAttribute("email", email);
			
			url = "welcome.jsp";
		}catch(SQLException e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);

	}

}
