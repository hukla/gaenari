package controller.action;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.InsertDAO;
import model.dao.UserDAO;
import model.dto.BoardDTO;
import model.dto.CommentDTO;
/**
 * 작성: 최성훈
 * 작성일: 2014-06-02
 * 내용: 방명록 댓글입력하기
 */
public class ReplyAction implements Action {
	Calendar cal = Calendar.getInstance();
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(request.getParameter("comment"));
		System.out.println(request.getParameter("userid"));
		System.out.println(request.getParameter("brdno"));
		//파라미터: 쓴사람userid, 홈피주인 userno, 게시판번호 prmno, 내용 comment
		//입력할내용: 작성날짜, 
		
		HttpSession session = request.getSession();
		String url="/error.jsp";
		String brdcontent,prmno,userid,userno,wrdate,title=null;
		int brdno = 0;
		try{
			brdcontent = request.getParameter("brdcontent");
			prmno = request.getParameter("brdno");
			userid = request.getParameter("userid");
			userno = request.getParameter("userno");
			wrdate = (String) session.getAttribute("today");
			title = cal.getTime().toString().split(" ")[3];
			System.out.println(wrdate);
			System.out.println(brdcontent+" "+prmno+" "+userid+" "+userno+" "+wrdate);
			if(brdcontent == null || prmno == null || userid == null || userno == null || wrdate == null){
				throw new Exception("댓글을 다시 입력해주세요.");
			}
			brdno = InsertDAO.insertCmtBoard(new BoardDTO(brdcontent,wrdate,userid,title,"re",Integer.parseInt(userno)));
			InsertDAO.insertComment(new CommentDTO(brdno,Integer.parseInt(prmno)));
			
			url = "/visitList.do?userid="+UserDAO.selectOne(Integer.parseInt(userno)).getUserid();
			
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
