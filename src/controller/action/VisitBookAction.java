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
import model.dto.CommentDTO;
import model.dto.UserDTO;
/**
 * 작성: 프로젝트시작당시
 * 작성자: 최성훈
 * 내용: 방명록 보여주기
 * 
 * 수정: 2014-06-03, 최성훈
 * 내용: 방명록 내포스트, 방문객포스트나누고 포스트 별 댓글 보여주기
 */
public class VisitBookAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "/error.jsp";
		UserDTO user = null;
		String userid = null;
		List<BoardDTO> visitList = null;
		List<BoardDTO> myList = null;
		List<CommentDTO> myOneCmtList = null;
		List<List<CommentDTO>> myWholeCmtList = null;
		List<BoardDTO> yourList = null;
		List<CommentDTO> yourOneCmtList = null;
		List<List<CommentDTO>> yourWholeCmtList = null;
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
			myOneCmtList = new ArrayList<CommentDTO>();
			myWholeCmtList = new ArrayList<List<CommentDTO>>();	//내가 올린 게시글 별 댓글리스트를 담은 리스트
			yourList = new ArrayList<BoardDTO>();
			yourOneCmtList = new ArrayList<CommentDTO>();
			yourWholeCmtList = new ArrayList<List<CommentDTO>>();	//방문객이 쓴 게시글 별 댓글리스트를 담은 리스트
			
			for(BoardDTO dto:visitList){
				if((dto.getUserid()).trim().equals(((UserDAO.selectOne(dto.getUserno())).getUserid()).trim())){	//내가쓴글이면
					myList.add(dto);
					myOneCmtList = TestDAO.getCommentList(dto.getBrdno());	//방명록하나에 해당하는 댓글리스트
					if(!myOneCmtList.isEmpty())	myWholeCmtList.add(myOneCmtList);
				}else{
					yourList.add(dto);
					yourOneCmtList = TestDAO.getCommentList(dto.getBrdno());
					if(!yourOneCmtList.isEmpty())	yourWholeCmtList.add(yourOneCmtList);
				}
			}
			for(List<CommentDTO> lbd:yourWholeCmtList){
				for(CommentDTO dto:lbd){
					System.out.println(dto.getPrmno()+"번 게시글의 댓글 "+dto.getBrdcontent());
				}
				System.out.println("==================다음게시물=====================");
			}
			request.setAttribute("user", user);
			request.setAttribute("myList", myList);
			request.setAttribute("yourList", yourList);
			request.setAttribute("myComments", myWholeCmtList);
			request.setAttribute("yourComments", yourWholeCmtList);
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
