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
 * 작성: 2014-05-28
 * 작성자: 최성훈
 * 내용: 페이스북으로 받은 이메일, 이름으로 user정보 확인,
 * 		 확인된 user의 경우 HomeAction으로 보내고
 * 		 확인 안 된 첫 방문자의 경우엔 join.jsp로 보낸다.
 * 
 * 수정: 2014-05-29, 최성훈
 * 내용: 확인된 user가 메인사진경로를 갖고 있지 않은경우, 경로를 user정보에 넣어준다.
 */
public class FBLogCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String email, username, image = null;
		UserDTO user = null;
		
		try{
			// facebook api로 파라미터 전달
			email = request.getParameter("email");
			username = request.getParameter("username");
			image = request.getParameter("image");
			
			if(email.equals(null) || email.trim().length() == 0 || username.equals(null) || username.trim().length()==0){
				throw new Exception("Facebook Email Login 접속에러");
			}
			
			// email주소로 user가 DB에 있는지 확인
			user = UserDAO.emailCheck(email);
			
			if (user != null) { // user가 DB에 있으면
				
				if(user.getImg() == null){ // user image path가 null이면
					
					//System.out.println("페북로그인체크에서 이미지:"+image);
					
					if(image == null){ // 파라미터로 들어온 이미지가 없으면
						image="/gaenari/image/usericon.jpg";
					}
					
					UpdateDAO.updateImg(user.getUserid(),image);
				}
				
				// 로그인
				session.setAttribute("userid", user.getUserid());
				session.setAttribute("pwd", user.getPasswd());
				//session.setAttribute("fbMainImage", image);
				
				url = "/home.do";
			} else { // user가 DB에 없으면
				request.setAttribute("email", email);
				request.setAttribute("username", username);
				
				if(image!=null){
					request.setAttribute("image", image);
				}
				
				url = "join.jsp";
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
