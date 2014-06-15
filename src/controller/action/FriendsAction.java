package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.FriendDAO;
import model.dao.UserDAO;
import model.dto.UserDTO;
/**
 * 작성: 2014-05-29
 * 작성자: 최성훈
 * 내용: 친구 관리 페이지
 * 
 * 수정: 최성훈, 2014-06	내용: 친구 요청정보 보이기, 내 친구 목록 가져오기
 * 수정: 최성훈, 2014-06-04	내용: 친구 테이블에 요청자정보만 있는 사람은 친구목록 안뜨는 오류 수정
 */
public class FriendsAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String userid = null;
		UserDTO user = null;
		List<UserDTO> list = null;
		List<Integer> senderNo = null;
		List<UserDTO> friendList = null;
		List<Integer> friendNo = null;
		try{
			user = (UserDTO) session.getAttribute("user");
			userid = user.getUserid();
			if(request.getParameter("userid")!=null){				//만약 userid 파라미터를 넘겨 받았다면
				if(userid!=request.getParameter("userid")){			//그리고 만약 세션 userid와 파라미터userid가 다르다면
					userid = request.getParameter("userid");		//userid에 파라미터userid를 저장하기
					user = UserDAO.logCheck(userid);
				}
			}
			senderNo = FriendDAO.checkMyReqinfo(user.getUserno());
			if(!senderNo.isEmpty()){
				senderNo = FriendDAO.checkMyReqinfo(user.getUserno());	//나한테 친구요청한 사람번호의 리스트를 받음
				list = new ArrayList<UserDTO>();
				for(int no: senderNo){
					list.add(UserDAO.selectOne(no));					//번호리스트를 사람리스트로 만듦.
				}
			}
			session.removeAttribute("sender");
			session.setAttribute("sender", list);
			friendNo = FriendDAO.getMyFriends(user.getUserno());
			friendList = new ArrayList<UserDTO>();
			for(int no: friendNo){
				friendList.add(UserDAO.selectOne(no));
			}
			if(request.getParameter("milenari")!=null){
				request.setAttribute("milenariCheck", 1);
			}
			request.setAttribute("friendList", friendList);
			request.setAttribute("user", user);
			url="miniHome/friends.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
