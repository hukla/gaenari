package model;
/**
 * 작성: 2014-05-09
 * 작성자: 최성훈
 * 내용: 각종 게시판 정보를 insert함.
 * 		 일기 입력을 위해 DiaryDTO, BoardDTO에 각각 insert
 *		 일정 입력을 위해 PlanDTO, BoardDTO에 각각 insert 
 *
 * 수정: 2014-05-24, 최성훈
 * 내용: 회원가입 부분 추가
 */
import java.sql.SQLException;

import model.dao.InsertDAO;
import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;


public class InsertService {
	
	//일기 내용을 BoardDTO에 insert
	public static int insertDiaryBoard(BoardDTO boardDTO)throws SQLException{
		int brdno = InsertDAO.insertDiaryBoard(boardDTO);
		
		if(brdno==0){
			throw new SQLException("일기(보드) 등록에 실패했습니다.");
		}
		return brdno;
	}
	
	//일정 내용을 BoardDTO에 insert
	public static int insertPlanBoard(BoardDTO boardDTO)throws SQLException{
		int brdno = InsertDAO.insertPlanBoard(boardDTO);
		
		if(brdno==0){
			throw new SQLException("일기(보드) 등록에 실패했습니다.");
		}
		return brdno;
	}
	
	// 방명록 내용을 BoardDTO에 insert
	public static int insertVisitBoard(BoardDTO boardDTO) throws SQLException {
		int brdno = InsertDAO.insertVisitBoard(boardDTO);

		if (brdno == 0) {
			throw new SQLException("방명록(보드) 등록에 실패했습니다.");
		}
		return brdno;
	}

	//일기 내용을 DiaryDTO에 insert
	public static void insertDiary(DiaryDTO diaryDTO)throws SQLException{
		boolean result = InsertDAO.insertDiary(diaryDTO);
		
		if(!result){
			throw new SQLException("일기 등록에 실패했습니다.");
		}
	}
	
	//일정 내용을 PlanDTO에 insert
	public static void insertPlan(PlanDTO planDTO)throws SQLException{
		boolean result = InsertDAO.insertPlan(planDTO);
		
		if(!result){
			throw new SQLException("일정 등록에 실패했습니다.");
		}
	}
	
	// 방명록 내용을 VisitDTO에 insert
	public static void insertVisitbook(int brdno) throws SQLException {
		boolean result = InsertDAO.insertVisitbook(brdno);

		if (!result) {
			throw new SQLException("방명록 등록에 실패했습니다.");
		}
	}

	//14-05-23 성훈추가: 가입정보를 UserDTO에 insert
	public static void insertUser(UserDTO user) throws SQLException {
		boolean result = InsertDAO.insertUser(user);
		if (!result) {
			throw new SQLException("회원가입에 실패했습니다.");
		}
	}

}
