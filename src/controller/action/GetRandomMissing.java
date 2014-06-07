/**
 * 작성자: 이수진
 * 작성일: 2014-06-07
 * 내용: 미니홈피에 뿌리기 위한 광고(작성중...)
 */
package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CenterDAO;
import model.dao.ItemDAO;
import model.dao.MFABoardDAO;
import model.dao.UserDAO;
import model.dto.DonReqDTO;
import model.dto.ItemDTO;
import model.dto.MissingBoardDTO;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import util.DBUtil;

public class GetRandomMissing implements Action {
	
	private static final Logger log = Logger.getLogger(GetRandomMissing.class);

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("==GetRandom 진입==");
		HttpSession session = request.getSession();
		SqlSession sqlSession = null;
		PrintWriter out = response.getWriter();
		
		String userid = (String)session.getAttribute("userid");
		String url = "null";
		String result = "";
		List<MissingBoardDTO> mdto = null;//신고 게시판의 모든 글 목록
		List<MissingBoardDTO> mdto2 = null;//신고 게시판의 분실 장소와 주소가 같은 글 목록
		MissingBoardDTO mdto3 = null;//글 목록 중 랜덤으로 선택된 DTO
		
		try{
			sqlSession = DBUtil.getSqlSession();
			String address = UserDAO.logCheck(userid).getAddress();
			mdto=MFABoardDAO.MselectAll();
			System.out.println("mdto.get(5).getMloc().toString()="+mdto.get(5).getMloc().toString());
			System.out.println("["+address+"]");
			for(int i=5;i<mdto.size();i++){//분실 장소와 주소가 같은 글 목록을 추려냄
				if(mdto.get(i).getMloc().equals(address.trim())){
					mdto2.add(mdto.get(i));
				}
			}
			System.out.println("mdto2.toString()="+mdto2.toString());
			int ranNum = (int)(Math.random()*100) + (int)(Math.random()*10) + 1;
			System.out.println("ranNum="+ranNum);
			if(mdto2.isEmpty()){						//분실 장소와 주소가 같은 글이 없으면
				mdto3=MFABoardDAO.MselectOne(ranNum);	//난수로 목록 뽑음
			}else{										//분실 장소와 주소가 같은 글의 목록이 있으면
				mdto3=mdto2.get(ranNum);				//그 목록에서 랜덤으로 가져옴
			}
			System.out.println("mdto3.toString()="+mdto3.toString());
			
			result += "<mdto>";
			result += "<mname>"+mdto3.getMname()+"</mname>";
			result += "<brdno>"+mdto3.getBrdno()+"</brdno>";
			result += "<mbrdno>"+mdto3.getMbrdno()+"</mbrdno>";
			result += "<mkind>"+mdto3.getMkind()+"</mkind>";
			result += "<mdate>"+mdto3.getMdate()+"</mdate>";
			result += "<mloc>"+mdto3.getMloc()+"</mloc>";
			result += "<picPath>"+mdto3.getBrdcontent().split("!split!")[0]+"</picPath>";
			result += "</mdto>";
			
			log.debug(result);
			
			out.print(result);

		} catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		} finally{
			DBUtil.closeSession(sqlSession);
		}
	}

}
