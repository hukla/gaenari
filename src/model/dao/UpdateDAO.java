package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;

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
	
	// 14-05-31 성훈추가: userno에 해당하는 user정보 수정
	public static void updateInfo(UserDTO user) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			result = session.update("update.updateInfo", user) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if (!result)	throw new SQLException("정보수정에 실패했습니다.");
	}
	
	public static int planCheck(int brdno) throws SQLException {

		SqlSession session = null;
		int result = 0;
		boolean rs = false;
		try {
			session = DBUtil.getSqlSession();
			result = session.update("update.planCheck", brdno);
			System.out.println("결과값:"+result);
			if(result>0)	rs=true;
		} finally {
			DBUtil.closeSession(session, rs);
		}
		if (!rs)	throw new SQLException("일정 완료 전환에 실패했습니다.");
		return result;
	}
	
	public static void plusMilenari(int userno,int point) throws SQLException {
		SqlSession session = null;
		boolean result = false;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("userno", userno);
			map.put("point", point);
			System.out.println(userno+":"+point);
			result = session.update("update.plusMilenari", map) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if (!result)	throw new SQLException("마일나리 적립에 실패했습니다.");
	}
}
