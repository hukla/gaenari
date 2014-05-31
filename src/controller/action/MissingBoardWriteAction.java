package controller.action;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.dao.MFBoardDAO;
import model.dto.BoardDTO;
import model.dto.MissingBoardDTO;
import model.dto.UserDTO;

public class MissingBoardWriteAction implements Action {
	
	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "/error.jsp";

		String imageFile = null;
		String savePath = null;
		String fileName = null;
		int maxSize = 0;
		int brdno = 0;
		BoardDTO boardDTO = null;
		
		String title = null;
		String brdcontent = null;
		String userid = session.getAttribute("userid").toString();
		String brdtype = null;
		String mloc = null;
		String mdate = null;
		String mcontact = null;
		String mkind = null;
		String mgender = null;
		String mage = null;
		String mname = null;
		
		try{
			savePath=session.getServletContext().getRealPath("image/board/");
			maxSize = 5 * 1024 * 1024;

			//realPath = savePath+"/board";
			/*File targetDir = new File(realPath); 	//경로를 가진 파일객체 생성하기
			if (!targetDir.exists()) {				//파일이 존재하지 않는다면
				targetDir.mkdirs();					//새로운 디렉토리를 만들어준다.
			}*/
		
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize,
					"utf-8", new DefaultFileRenamePolicy());
			
			title = multi.getParameter("title");
			brdcontent = multi.getParameter("brdcontent");
			userid = session.getAttribute("userid").toString();
			brdtype = "mb";
			mloc = multi.getParameter("mloc");
			mdate = multi.getParameter("mdate");
			mcontact = multi.getParameter("contact1")+multi.getParameter("contact2")+multi.getParameter("contact3");
			mkind = multi.getParameter("mkind");
			mgender = multi.getParameter("mgender");
			mage = multi.getParameter("mage");
			mname = multi.getParameter("mname");
			fileName = multi.getFilesystemName("uploadFile");
			imageFile="/gaenari/image/board/"+fileName;
			
			/*boardDTO = new BoardDTO(brdcontent, (String)session.getAttribute("today"),
					(String)session.getAttribute("userid"),title,"mb",
					(int)((UserDTO)session.getAttribute("user")).getUserno());*/
			
			if(fileName==null){
				System.out.println("파일 업로드 되지 않았음");
				boardDTO = new BoardDTO("/gaenari/image/board/defaultDog.jpg!split!"+brdcontent,
						(String)session.getAttribute("today"),
						(String)session.getAttribute("userid"),title,"mb",
						(int) ((UserDTO) session.getAttribute("user")).getUserno());
			} else {
				System.out.println("File Name : "+fileName);
			
				boardDTO = new BoardDTO(imageFile + "!split!" + brdcontent, (String) session.getAttribute("today"),
							(String) session.getAttribute("userid"), title,"mb",
							(int) ((UserDTO) session.getAttribute("user")).getUserno());
			}
			brdno = MFBoardDAO.insertMissingBoard(boardDTO);

			if (fileName == null) { // 파일이 업로드 되지 않았을때
				log.error("파일 업로드 되지 않았음");
			} else { // 파일이 업로드 되었을때
				log.info("File Name  : " + fileName);
			//파일명 변경
				/*String realFileName = boardDTO.toStringBrdno(brdno);*/
				/*int index = -1;
				index = fileName.lastIndexOf(".");
				String realFileName = boardDTO.toStringBrdno(brdno)+fileName.substring(index, fileName.length());
				log.info("realFileName : "+realFileName);
				File oldFile = new File(savePath + fileName);
				File newFile = new File(savePath + realFileName);
				oldFile.renameTo(newFile);*/			
			}
			MFBoardDAO.insertMissing(new MissingBoardDTO(brdno,mloc,mdate,mcontact,mkind,mgender,
					mage, mname));
			url = "missingBoardMain.do";
					
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