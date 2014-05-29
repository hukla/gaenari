package model.dao;

import java.sql.SQLException;
import java.util.HashMap;

import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.PlanDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;
/**
 * 작성: 2014-05-21
 * 작성자: 최성훈
 * 내용: 게시판정보 수정하기
 * 
 * 수정: 2014-05-29, 최성훈
 * 내용: 메인사진 추가하기
 */
public class UpdateDAO {

	//BoardDTO의 일정 내용을 update
	public static void updatePlanBoard(BoardDTO boardDTO) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==planBoard update 진입==");
			result = session.update("update.updatePlanBoard", boardDTO) > 0 ? true : false;
			System.out.println("==planBoard update 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일정(보드) 수정에 실패했습니다.");
	}
	
	//PlanDTO의 일정 내용을 update
	public static void updatePlan(PlanDTO planDTO) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==plan update 진입==");
			result = session.insert("update.updatePlan", planDTO) > 0 ? true : false;
			System.out.println("==plan update 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result) throw new SQLException("일정 수정에 실패했습니다.");
	}
	
	// BoardDTO의 일기 내용을 update
	public static void updateDiaryBoard(BoardDTO boardDTO) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==diaryBoard update 진입==");
			result = session.update("update.updateDiaryBoard", boardDTO) > 0 ? true : false;
			System.out.println("==diaryBoard update 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일정(보드) 수정에 실패했습니다.");
	}

	// DiaryDTO의 일기 내용을 update
	public static void updateDiary(DiaryDTO diaryDTO) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==diary update 진입==");
			result = session.insert("update.updateDiary", diaryDTO) > 0 ? true : false;
			System.out.println("==diary update 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일정 수정에 실패했습니다.");
	}

	// 14-05-29 성훈추가: userid에 해당하는user정보에 메인사진 경로추가
	public static void updateImg(String userid, String image)
			throws SQLException {

		SqlSession session = null;
		boolean result = false;
		HashMap<String, String> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String, String>();
			map.put("userid", userid);
			map.put("img", image);
			result = session.update("update.updateImg", map) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if (!result)
			throw new SQLException("메인사진 설정에 실패했습니다.");
	}
}
