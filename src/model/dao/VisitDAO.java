package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.BoardDTO;
import model.dto.CommentDTO;
import model.dto.UserDTO;
import model.dto.VisitDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class VisitDAO {
	//14-05-21 성훈수정: 쿼리문 명 selectVisit에서 selectReverseVisit으로 바꿈
	public static List<VisitDTO> selectVisit(UserDTO user) throws SQLException {
		SqlSession session = null;
		List<VisitDTO> list = null;
		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("test.selectReverseVisit", user.getUserno());
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	// 14-05-30 성훈추가: 
	public static List<CommentDTO> getCommentList(int brdno) throws SQLException {
		SqlSession session = null;
		List<CommentDTO> list = null;
		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("test.getCommentList", brdno);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	
	//댓글 보드내용 입력 후 입력된 brdno를 반환하기(insert 후 select)
	public static int insertCmtBoard(BoardDTO boardDTO) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		int brdno = 0;
		try {
			session = DBUtil.getSqlSession();
			result = session.insert("insert.insertCmtBoard", boardDTO) > 0 ? true : false;
			brdno = session.selectOne("test.selectBoard", boardDTO);
		} finally {
			DBUtil.closeSession(session, result);
		}
		if (!result || brdno == 0) {
			throw new SQLException("댓글보드 입력실패!");
		}
		return brdno;
	}
	
	// 방명록 보드내용 입력 후 입력된 brdno를 반환하기(insert 후 select)
	public static int insertVisitBoard(BoardDTO boardDTO) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		int brdno = 0;
		try {
			session = DBUtil.getSqlSession();
			result = session.insert("insert.insertVisitBoard", boardDTO) > 0 ? true : false;
			brdno = session.selectOne("test.selectVisitBoard", boardDTO);
		} finally {
			DBUtil.closeSession(session, result);
		}
		if (!result || brdno == 0) {
			throw new SQLException("방명록보드 입력실패!");
		}
		return brdno;
	}
	
	// 댓글 내용 입력하기
	public static void insertComment(CommentDTO commentDTO) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			result = session.insert("insert.insertComment", commentDTO) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if (!result)
			throw new SQLException("일기 등록에 실패했습니다.");
	}

	
	// 방명록 내용 입력하기
	public static void insertVisitbook(int brdno) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			result = session.insert("insert.insertVisitbook", brdno) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("방명록 등록에 실패했습니다.");
	}

}
