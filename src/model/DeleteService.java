package model;

import java.sql.SQLException;

import model.dao.DeleteDAO;
import model.dao.UpdateDAO;
import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.PlanDTO;

public class DeleteService {

	//BoardDTO의 일정 내용을 delete
	public static void deleteBoard(int brdno)throws SQLException{
		boolean result = DeleteDAO.deleteBoard(brdno);
		if(!result)	throw new SQLException("일정(보드) 삭제에 실패했습니다.");
	}
	
	//PlanDTO의 일정 내용을 delete
	public static void deletePlan(int brdno)throws SQLException{
		boolean result = DeleteDAO.deletePlan(brdno);
		if(!result) throw new SQLException("일정 삭제에 실패했습니다.");
	}
	
	// DiaryDTO의 일정 내용을 delete
	public static void deleteDiary(int brdno) throws SQLException {
		boolean result = DeleteDAO.deleteDiary(brdno);
		if (!result)
			throw new SQLException("일정 삭제에 실패했습니다.");
	}
}
