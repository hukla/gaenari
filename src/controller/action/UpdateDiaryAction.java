package controller.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UpdateService;
import model.dto.BoardDTO;
import model.dto.DiaryDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
/**
 * 작성: 2014-05-21
 * 작성자: 최성훈
 * 내용: 일기수정(제목, 파일, 기분, 내용 수정)
 */
public class UpdateDiaryAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String url = "login/error.jsp";
		String title,brdcontent,mood,brdno=null;
		MultipartRequest multi = null;
		BoardDTO boardDTO = null;
		String fileName = null;
		String imagefile = null;
		
		String savePath = null;
		int maxSize = 0;
		
		try {
			savePath = session.getServletContext().getRealPath("image");
			maxSize = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB(메가)로 제한
			multi = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			title = multi.getParameter("title");
			mood = multi.getParameter("mood");
			brdcontent = multi.getParameter("brdcontent");
			brdno = multi.getParameter("brdno");
			fileName = multi.getFilesystemName("uploadFile"); 	// 파일의 이름 얻기
			
			imagefile = "http://localhost:9000/gaenari/image/"+fileName;		//방금등록한 이미지실제경로
			
			if (fileName == null) System.out.print("파일 업로드 되지 않았음");	// 파일이 업로드 되지 않았을때
			else System.out.println("File Name  : " + fileName);				// 파일이 업로드 되었을때
			
			//이미지 파일 업로드 됨.
		
			if (title.equals(null) || title.trim().length() == 0 || mood.equals(null) || mood.trim().length() == 0
					|| brdcontent.equals(null) || brdcontent.trim().length() == 0) {
				throw new Exception("내용을 모두 입력해주세요.");
			} else {

				if (fileName == null)	//파일업로드하지 않는 경우(brdno,content,title)
					boardDTO = new BoardDTO(Integer.parseInt(brdno), "!split!"+brdcontent, title);
				else				//파일업로드하는 경우(brdno,content,title)
					boardDTO = new BoardDTO(Integer.parseInt(brdno), imagefile+"!split!"+brdcontent, title);
				
				UpdateService.updateDiaryBoard(boardDTO);
				UpdateService.updateDiary(new DiaryDTO(Integer.parseInt(brdno),mood));
				// 보드DTO와 다이어리DTO에 받은 값들을 입력해준다.
			}
			url = "control?command=diaryDetail&brdno=" + brdno;
		} catch(SQLException e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}