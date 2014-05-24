package controller.action;
/**
 * 작성일: 2014-04-26
 * 작성자: 최성훈
 * 내용: 다이어리 목록페이지에서 다이어리를 입력한다.
 * 		 입력받은 제목, 기분, 내용을 저장하고 입력받은 사진을
 * 		 request.getRealPath("/image/")에 저장한다.
 * 		 
 * 		 업로드파일 말고 제목, 기분, 내용, 현재시간 등을 BoardDTO와 DiaryDTO에
 * 		 insert해준다.
 * 
 * 수정: 2014-05-22, 최성훈
 * 내용: 불필요한 소스코드 정리.
 */
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.InsertService;
import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.UserDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteDiaryAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String url = "login/error.jsp";
		String title,mood,content=null;
		String imagefile = null;
		String savePath = null;
		String fileName = null;
		BoardDTO boardDTO = null;
		int brdno=0;
		int maxSize = 0;
		
		try {
			savePath = session.getServletContext().getRealPath("image");
			maxSize = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB(메가)로 제한
			
			MultipartRequest multi = new MultipartRequest(request, savePath,
					maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			title = multi.getParameter("title");
			mood = multi.getParameter("mood");
			content = multi.getParameter("content");
			fileName = multi.getFilesystemName("uploadFile"); 				// 파일의 이름 얻기
			
			imagefile = "/gaenari/image/"+fileName;	//방금등록한 이미지실제경로
			
			if (fileName == null) { // 파일이 업로드 되지 않았을때
				System.out.print("파일 업로드 되지 않았음");
			} else { 				// 파일이 업로드 되었을때
				System.out.println("File Name  : " + fileName);
			}
			//이미지 파일 업로드 됨.

			if (title.equals(null) || title.trim().length() == 0 || mood.equals(null) || mood.trim().length() == 0
					|| content.equals(null) || content.trim().length() == 0) {
				throw new Exception("내용을 모두 입력해주세요.");
			} else {
				if (fileName == null) {
					boardDTO = new BoardDTO("!split!" + content, (String) session.getAttribute("today"),
							(String) session.getAttribute("userid"), title,"dy", 
							(int) ((UserDTO) session.getAttribute("user")).getUserno());
					// 현재 시간과 보드 타입 "dy"와 userno를 넣어준다.
				} else {
					boardDTO = new BoardDTO(imagefile + "!split!" + content, (String) session.getAttribute("today"),
							(String) session.getAttribute("userid"), title,"dy",
							(int) ((UserDTO) session.getAttribute("user")).getUserno());
					// 현재 시간과 보드 타입 "dy"와 userno를 넣어준다.
				}
				brdno = InsertService.insertDiaryBoard(boardDTO);	//boardDTO를 insert하며 해당 brdno를 가져옴
				InsertService.insertDiary(new DiaryDTO(brdno, mood));
				// 보드DTO와 다이어리DTO에 받은 값들을 입력해준다.
			}
			url = "control?command=diaryList";
		} catch(SQLException e){
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
