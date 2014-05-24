package model;

import java.sql.SQLException;

import model.dao.UpdateDAO;
import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.PlanDTO;
/**
 * 작성: 2014-05-21
 * 작성자: 최성훈
 * 내용: 일정수정하기
 */
public class UpdateService {

	//BoardDTO의 일정 내용을 update
	public static void updatePlanBoard(BoardDTO boardDTO)throws SQLException{
		boolean result = UpdateDAO.updatePlanBoard(boardDTO);
		if(!result)	throw new SQLException("일정(보드) 수정에 실패했습니다.");
	}
	
	//PlanDTO의 일정 내용을 update
	public static void updatePlan(PlanDTO planDTO)throws SQLException{
		boolean result = UpdateDAO.updatePlan(planDTO);
		if(!result) throw new SQLException("일정 수정에 실패했습니다.");
	}
	
	// BoardDTO의 일정 내용을 update
	public static void updateDiaryBoard(BoardDTO boardDTO) throws SQLException {
		boolean result = UpdateDAO.updateDiaryBoard(boardDTO);
		if (!result)
			throw new SQLException("일정(보드) 수정에 실패했습니다.");
	}

	// DiaryDTO의 일정 내용을 update
	public static void updateDiary(DiaryDTO diaryDTO) throws SQLException {
		boolean result = UpdateDAO.updateDiary(diaryDTO);
		if (!result)
			throw new SQLException("일정 수정에 실패했습니다.");
	}

}
