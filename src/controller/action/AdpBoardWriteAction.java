package controller.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.MFABoardDAO;
import model.dto.AdpBoardDTO;
import model.dto.BoardDTO;
import model.dto.FindingBoardDTO;
import model.dto.UserDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import org.apache.log4j.Logger;

public class AdpBoardWriteAction implements Action {
	
	private Logger log = Logger.getLogger(this.getClass()); 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "/error.jsp";

		String savePath = null;
		String fileName = null;
		int maxSize = 0;
		int brdno = 0;
		BoardDTO boardDTO = null;
		
		String title = null;
		String brdcontent = null;
		String userid = session.getAttribute("userid").toString();
		String brdtype = null;
		
		try{
			savePath=session.getServletContext().getRealPath("image/board");
			maxSize = 5 * 1024 * 1024;

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize,
					"utf-8", new DefaultFileRenamePolicy());
			
			File targetDir = new File(savePath); 	//경로를 가진 파일객체 생성하기
			if (!targetDir.exists()) {				//파일이 존재하지 않는다면
				targetDir.mkdirs();					//새로운 디렉토리를 만들어준다.
			}
			
			title = multi.getParameter("title");
			brdcontent = multi.getParameter("brdcontent");
			userid = session.getAttribute("userid").toString();
			brdtype = "ab";
			fileName = multi.getFilesystemName("uploadFile");
			
			if(fileName==null){ //파일이 업로드되지 않을 경우
				boardDTO = new BoardDTO("/gaenari/image/board/defaultDog.jpg!split!"+brdcontent,
						(String)session.getAttribute("today"),
						(String)session.getAttribute("userid"),title,brdtype,
						(int) ((UserDTO) session.getAttribute("user")).getUserno());
				brdno = MFABoardDAO.insertAdpBoard(boardDTO);
			} else {
			
				boardDTO = new BoardDTO(brdcontent, (String) session.getAttribute("today"),
							(String) session.getAttribute("userid"), title,brdtype,
							(int) ((UserDTO) session.getAttribute("user")).getUserno());
				brdno = MFABoardDAO.insertAdpBoard(boardDTO);
				
				int index = -1;
				index = fileName.lastIndexOf(".");
				String realFileName = boardDTO.toStringBrdno(brdno)+fileName.substring(index, fileName.length());
				log.info("realFileName : "+realFileName);
				File oldFile = new File(savePath + "/" + fileName);
				File newFile = new File(savePath + "/" + realFileName);
				oldFile.renameTo(newFile);			

			}
			MFABoardDAO.insertAdp(new AdpBoardDTO(brdno));
			url = "adpBoardMain.do";
					
		} catch(SQLException e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		} catch(Exception e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);

	}

}