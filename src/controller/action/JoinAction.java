package controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CenterDAO;
import model.dao.UserDAO;
import model.dto.CenterDTO;
import model.dto.UserDTO;
/**
 * 작성: 2014-05-24
 * 작성자: 최성훈
 * 내용: 회원가입, SessionFilter를 피하기 위해 url패턴 login으로 접근
 * 추가해야할 사항: 페이스북 로그인으로 Email주소를 받아올 때
 * 					가입돼있는 사람인지 아닌지 체크해서 가입자는
 * 					LoginCheckAction으로 보내고 가입되지 않은 사람은
 * 					join.jsp로 보내도록 하기
 * 
 * 수정: 2014-05-29, 최성훈
 * 내용: 페이스북 로그인을 통해 첫 방문자인 경우 회원가입시킴.
 * 		 가입 후, 페이스북 메인사진을 insert, 가입완료되면 welcome.jsp로 이동시킴.
 */
public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url="/error.jsp";
		String userid,pwd,pwd1,addr,username,type,email,fbImage=null;
		String cntrname,cntrcontact,cntrloc=null;
		char cntrsize=0;
		int cntrno,dogs=0;
		
		try{
			userid = request.getParameter("userid").trim();
			pwd = request.getParameter("pwd");
			pwd1 = request.getParameter("pwd1");
			email = request.getParameter("email");
			username = request.getParameter("username");
			type = request.getParameter("type");
			addr = request.getParameter("addr");
			fbImage = request.getParameter("image");
			
			cntrname = request.getParameter("cntrname");
			cntrcontact = request.getParameter("cntrcontact");
			cntrloc = request.getParameter("cntrloc");
			if(request.getParameter("dogs")!=null && request.getParameter("dogs").trim().length()!=0){
				dogs = Integer.parseInt(request.getParameter("dogs"));
			}
			//입력 정보 불충분시
			if(userid==null || userid.trim().length()==0 || email==null || email.trim().length()==0
					|| pwd==null || pwd.trim().length()==0 || pwd1==null || pwd1.trim().length()==0
					|| username==null || username.trim().length()==0
					|| type==null || type.trim().length()==0 || addr==null || addr.trim().length()==0){
				if(type=="1"){
					if(cntrname==null || cntrname.trim().length()==0 || cntrcontact==null || cntrcontact.trim().length()==0
							|| cntrloc==null || cntrloc.trim().length()==0){
						throw new Exception("정보를 모두 입력해주세요.");
					}
				}
				throw new Exception("정보를 모두 입력해주세요.");
			}
			
			//비밀번호 일치 안했을 때
			if(!pwd.equals(pwd1)){
				throw new Exception("비밀번호가 일치하지 않습니다.");
			}
			
			if(type.equals("1")){
				System.out.println("center");
				if(dogs<20)	cntrsize='s';
				else if(dogs<50)	cntrsize='m';
				else cntrsize='l';
				cntrno = CenterDAO.insertCntrUser(new CenterDTO(cntrname, cntrloc, cntrcontact, cntrsize));
				UserDAO.insertUser(new UserDTO(userid,pwd,email,username,addr,cntrno));
			}else{
				UserDAO.insertUser(new UserDTO(userid,pwd,email,username,addr,Integer.parseInt(type)));
			}
			session.setAttribute("username", username);
			session.setAttribute("userid", userid);
			session.setAttribute("pwd", pwd);
			request.setAttribute("email", email);
			if(fbImage!=null){
				UserDAO.updateImg(userid,fbImage);
				request.setAttribute("image", fbImage);
			}
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
