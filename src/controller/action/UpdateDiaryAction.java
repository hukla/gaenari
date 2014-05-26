package controller.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

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
 * 
 * 수정: 2014-05-26, 최성훈
 * 내용: 1.컨텐츠 입력시 줄바꿈 추가
 * 		 2.다이어리 수정하면서 user의 폴더에 이미지 파일을 등록하도록 함.
 * 			=> 이미지가 수정되는게 아니라 업로드를 하는 것임. (삭제된 후 새로 등록되도록 고쳐야 함)
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
		String realPath = null;
		String savePath = null;
		String userid = null;
		int maxSize = 0;
		
		try {
			savePath = session.getServletContext().getRealPath("image");
			userid = (String) session.getAttribute("userid");
			
			//14-05-26 성훈추가: 사용자별 사진첩 폴더생성
			realPath = savePath+"/"+userid;			//경로지정: 리얼패스밑에 폴더명을 사용자id로 주기
			File targetDir = new File(realPath); 	//경로를 가진 파일객체 생성하기
			if (!targetDir.exists()) {				//파일이 존재하지 않는다면
				targetDir.mkdirs();					//새로운 디렉토리를 만들어준다.
			}
			/*MultipartRequest multi = new MultipartRequest(request, savePath,
					maxSize, "utf-8", new DefaultFileRenamePolicy());*/
			maxSize = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB(메가)로 제한
			multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			title = multi.getParameter("title");
			mood = multi.getParameter("mood");
			brdcontent = multi.getParameter("brdcontent").replaceAll("\r\n", "<br/>");
			brdno = multi.getParameter("brdno");
			fileName = multi.getFilesystemName("uploadFile"); 				// 파일의 이름 얻기
			
			imagefile = "/gaenari/image/"+userid+"/"+fileName;	//방금등록한 이미지실제경로(사용자별 폴더)
			
			/*maxSize = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB(메가)로 제한
			multi = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			title = multi.getParameter("title");
			mood = multi.getParameter("mood");
			brdcontent = multi.getParameter("brdcontent").replaceAll("\r\n", "<br/>");
			brdno = multi.getParameter("brdno");
			fileName = multi.getFilesystemName("uploadFile"); 	// 파일의 이름 얻기
			
			imagefile = "http://localhost:9000/gaenari/image/"+fileName;		//방금등록한 이미지실제경로
			*/
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