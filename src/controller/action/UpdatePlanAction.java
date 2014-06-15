package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UpdateDAO;
import model.dto.BoardDTO;
import model.dto.PlanDTO;
/**
 * 작성: 2014-05-21
 * 작성자: 최성훈
 * 내용: 일정 수정(제목,내용,수행날짜,지역)
 * 
 * 수정: 2014-05-26, 최성훈
 * 내용: 컨텐츠 줄바꿈추가
 * 
 * 수정: 2014-05-29, 최성훈
 * 내용: 갑자기 한글입력 깨지는 현상 막기위해 new String(변수명.getBytes("8859_1"),"utf-8")추가
 * 		 문제 해결하기 위해, new String부분은 우선 주석처리
 */
public class UpdatePlanAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "/error.jsp";
		String title,brdcontent,wrdate,tmpdate,ploc,brdno,dogno,plType=null;
		
		try{
			title = request.getParameter("title");
			brdcontent = request.getParameter("brdcontent").replaceAll("\r\n", "<br/>");
			tmpdate = request.getParameter("date").toString();
			ploc = request.getParameter("ploc").toString();
			dogno = request.getParameter("plandogno").toString();
			plType = request.getParameter("plantype").toString();
			brdno = request.getParameter("brdno");
			if(title==null || title.trim().length()==0 || brdcontent==null || brdcontent.trim().length()==0 
					|| tmpdate==null || tmpdate.trim().length()==0 || ploc==null || ploc.trim().length()==0
					|| brdno==null || brdno.trim().length()==0 || dogno==null || dogno.trim().length()==0
					|| plType==null || plType.trim().length()==0){
				throw new Exception("모든 항목을 작성해주세요");
			}
			brdcontent=plType+"!split!"+brdcontent;
			BoardDTO boardDTO = new BoardDTO(Integer.parseInt(brdno),brdcontent,tmpdate,title);
			UpdateDAO.updatePlanBoard(boardDTO);
			UpdateDAO.updatePlan(new PlanDTO(Integer.parseInt(brdno),ploc,tmpdate,Integer.parseInt(dogno)));
			url="/planDetail.do?brdno="+brdno;
		} catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
