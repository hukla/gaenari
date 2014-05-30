package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;
/**
 * 작성: 2014-05-21
 * 작성자: 최성훈
 * 내용: 게시판 정보 삭제하기
 */
public class DeleteDAO {

	//BoardDTO의 일정 내용을 delete
	public static void deleteBoard(int brdno) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==planBoard delete 진입==");
			result = session.update("delete.deleteBoard", brdno) > 0 ? true : false;
			System.out.println("==planBoard delete 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일정(보드) 삭제에 실패했습니다.");
	}
	
	//PlanDTO의 일정 내용을 delete
	public static void deletePlan(int brdno) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==plan delete 진입==");
			result = session.insert("delete.deletePlan", brdno) > 0 ? true : false;
			System.out.println("==plan delete 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result) throw new SQLException("일정 삭제에 실패했습니다.");
	}

	// DiaryDTO의 일기 내용을 update
	public static void deleteDiary(int brdno) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==diary delete 진입==");
			result = session.insert("delete.deleteDiary", brdno) > 0 ? true : false;
			System.out.println("==diary delete 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일정 삭제에 실패했습니다.");
	}
	//14-05-30 성훈추가: 친구요청이 수락되면 요청정보 지우기
	public static void deleteFrndReq(int sender, int receiver) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==deleteFrndReq 진입==");
			map = new HashMap<String,Integer>();
			map.put("receiver", receiver);
			map.put("sender", sender);
			result = session.delete("delete.deleteFrndReq", map) > 0 ? true : false;
			System.out.println("==deleteFrndReq 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("친구요청 삭제에 실패했습니다.");
	}
}
