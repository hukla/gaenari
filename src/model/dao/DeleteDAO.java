package model.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;
/**
 * 작성: 2014-05-21
 * 작성자: 최성훈
 * 내용: 게시판 정보 삭제하기
 */
public class DeleteDAO {

	//BoardDTO의 일정 내용을 delete
	public static boolean deleteBoard(int brdno) throws SQLException {

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
		return result;
	}
	
	//PlanDTO의 일정 내용을 delete
	public static boolean deletePlan(int brdno) throws SQLException {

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
		return result;
	}

	// DiaryDTO의 일기 내용을 update
	public static boolean deleteDiary(int brdno) throws SQLException {

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
		return result;
	}

}
