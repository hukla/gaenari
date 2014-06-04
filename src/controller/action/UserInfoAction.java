package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TestDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.DogDTO;
import model.dto.UserDTO;
/**
 * 작성: 2014-05-29
 * 작성자: 최성훈
 * 내용: 개인정보열람 위해 user정보 얻어오기
 * 
 * 수정: 2014-05-30, 최성훈
 * 내용: 친구정보 볼 때 나와 1.친구관계인지, 2.나와 친구사이에 친구요청정보가 있는지 확인
 * 		 내 친구 몇명인지 보이기
 * 
 * 수정: 2014-06-04, 최성훈
 * 내용: 친구 요청을 수락한 사람의 친구목록에 요청자가 없는 오류수정중..
 */
public class UserInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String url = "/error.jsp";
		String userid = null;
		UserDTO user = null;
		List<DogDTO> list = null;
		List<UserDTO> friendList = null;
		List<Integer> friendNo = null;
		List<BoardDTO> diaryList = null;
		List<String> imageList = null;
		String image = null;
		int sender,receiver = 0;
		boolean flag = false;
		boolean friend = false;
		try{
			userid = (String) session.getAttribute("userid");	// 세션의 userid가져오기

			// 다른 아이디를 클릭할 때
			if (request.getParameter("userid") != null) {		// 만약 userid 파라미터를 넘겨 받았다면
				if (userid != request.getParameter("userid"))	// 그리고 만약 세션 userid와 파라미터userid가 다르다면
					userid = request.getParameter("userid");	// userid에 파라미터userid를 저장하기
				sender = UserDAO.logCheck((String) session.getAttribute("userid")).getUserno();
				receiver = UserDAO.logCheck(userid).getUserno();
				flag = TestDAO.checkFrndReq(sender,receiver);
				friend = TestDAO.areWeFriends(sender, receiver);
			}
			
			
			user = UserDAO.logCheck(userid);
			list = TestDAO.getMyDogInfo(user.getUserno());
			
			friendNo = TestDAO.getMyFriends(user.getUserno());
			friendList = new ArrayList<UserDTO>();
			for(int no: friendNo){
				friendList.add(UserDAO.selectOne(no));
			}
			
			diaryList = TestDAO.selectDiary(user);
			imageList = new ArrayList<String>();
			for(BoardDTO dto: diaryList){
				image = dto.getBrdcontent().split("!split!")[0];
				
				if(image!=null){
					imageList.add(image);
				}
			}
			for(String img: imageList){
				System.out.println(img);
			}
			request.setAttribute("user", user);
			request.setAttribute("imageList", imageList);
			request.setAttribute("friendList", friendList);		//수락한 사람도 친구목록에 친구가 떠야되는데 안됨.
			request.setAttribute("dog", list);
			request.setAttribute("user", user);
			request.setAttribute("flag", flag);		//요청했으면 false
			request.setAttribute("friend", friend);	//친구이면 true
			url = "/miniHome/info.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
