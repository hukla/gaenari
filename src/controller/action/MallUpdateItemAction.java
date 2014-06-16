/**
 * 작성자 : 장재희
 * 내용 : 아이템 정보 수정하기
 */
package controller.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.ItemDAO;
import model.dto.ItemDTO;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;

public class MallUpdateItemAction implements Action {
	
	Logger log = Logger.getLogger(this.getClass()); 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "/mall/complete.jsp";
		String operation = "수정";
		String fileName = null;
		
		File file = null;
		String savePath = session.getServletContext().getRealPath("mall/img");
		log.info("savePath : "+savePath);
		
		Enumeration files = null;
		
		int maxSize = 5 * 1024 * 1024;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8"/*, new DefaultFileRenamePolicy()*/);
			// 업로드
			
			int itemno = Integer.parseInt(multi.getParameter("itemno"));
			String itemname = multi.getParameter("itemname");
			int price = Integer.parseInt(multi.getParameter("price"));
			int qty = Integer.parseInt(multi.getParameter("qty"));
			String itemdetail = multi.getParameter("itemdetail");
			
			if(itemno < 0 || itemname == null || itemname.equals("") || price < 0 || qty < 0 || itemdetail == null) {
				throw new Exception("상품 정보 입력이 잘못되었습니다.");
			}

			fileName = multi.getFilesystemName("uploadFile");
			
			if (fileName == null) { // 파일이 업로드 되지 않았을때
				log.error("파일 업로드 되지 않았음");
			} else { // 파일이 업로드 되었을때
				log.info("File Name  : " + fileName);
				//파일명 변경
				String realFileName = itemno + fileName.substring(fileName.lastIndexOf("."), fileName.length());
				File oldFile = new File(savePath +"/"+ fileName);
				File newFile = new File(savePath +"/"+ realFileName);
				newFile.delete();
				oldFile.renameTo(newFile);
			}// else
			
			//상품 수정
			ItemDTO item = new ItemDTO(itemno, itemname, price, qty, itemdetail);
			log.info("item : " + item);
			
			if(!ItemDAO.updateOne(item)) {
				throw new Exception("상품 수정에 실패하였습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getMessage());
			url = "/error.jsp";
		}
		
		request.setAttribute("operation", operation);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
