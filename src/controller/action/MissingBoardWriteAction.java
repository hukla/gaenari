package controller.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.dao.MFBoardDAO;
import model.dto.BoardDTO;
import model.dto.MissingBoardDTO;
import model.dto.UserDTO;
import model.dto.VoluBoardDTO;

public class MissingBoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		System.out.println("==MissingBoardWriteAction 진입==");
		String url = "login/error.jsp";

		String imagefile = null;
		String savePath = null;
		String realPath = null;
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
			savePath=session.getServletContext().getRealPath("image");
			maxSize = 5 * 1024 * 1024;
			
			realPath = savePath + "/" + userid;
			File targetDir = new File(realPath);
			if (!targetDir.exists()){
				targetDir.mkdirs();
			}
			MultipartRequest multi = new MultipartRequest(request, realPath, maxSize,
					"utf-8", new DefaultFileRenamePolicy());
			
			title = multi.getParameter("title");
			brdcontent = multi.getParameter("brdcontent");
			userid = session.getAttribute("userid").toString();
			brdtype = "mb";
			mloc = multi.getParameter("mloc");
			mdate = multi.getParameter("mdate");
			mcontact = multi.getParameter("contact1")+request.getParameter("contact2")+request.getParameter("contact3");
			mkind = multi.getParameter("mkind");
			mgender = multi.getParameter("mgender");
			mage = multi.getParameter("mage");
			mname = multi.getParameter("mname");
			fileName = multi.getFilesystemName("uploadFile");
			
			imagefile = "/gaenari/image/"+userid+"/board/"+fileName;
			
			if(fileName==null){
				System.out.println("파일 업로드 되지 않았음");
				boardDTO = new BoardDTO(brdcontent, (String)session.getAttribute("today"),
						(String)session.getAttribute("userid"),title,"mb",
						(int) ((UserDTO) session.getAttribute("user")).getUserno());
			} else {
				System.out.println("File Name : "+fileName);
				boardDTO = new BoardDTO(imagefile + "!split!" + brdcontent, (String) session.getAttribute("today"),
							(String) session.getAttribute("userid"), title,"mb",
							(int) ((UserDTO) session.getAttribute("user")).getUserno());
			}
			brdno = MFBoardDAO.insertMissingBoard(boardDTO);
			MFBoardDAO.insertMissing(new MissingBoardDTO(brdno,mloc,mdate,mcontact,mkind,mgender,
					mage, mname));
			url = "control?command=missingBoardList";
					
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
