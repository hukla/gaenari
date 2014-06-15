package model.dao;
/**
 * 작성자:장재희
 * 작성일: 2014-04-22
 * 내용: discriminator 테스트
 * 
 * 수정: 최성훈
 * 수정일: 2014-04-23
 * 내용: 리턴타입 Vo인 메소드 모두 지우고 DTO타입 리턴의 메소드 추가
 * 		 (selectPlan, selectDiary, selectVisit)
 * 
 * 		 selectOneDiary, selectOnePlan, selectOneVisit 메소드 추가
 * 		 (링크 클릭해서 글 하나씩 보도록)
 * 
 * 수정: 최성훈
 * 수정일: 2014-05-03
 * 내용: 미리보기용 일기, 일정 받는 메소드 추가, 날짜별 일정정보 받는 메소드 추가.
 * 
 * 수정: 최성훈
 * 수정일: 2014-05-14
 * 수정내용: 이전글, 다음글버튼으로 일기,일정 페이지 이동 기능 추가, 
 * 			미리보기로 접근할 때 diaryDTO, planDTO를 리턴타입으로 하는 메소드 추가
 * 			필요없는 주석 제거
 * 
 * 수정: 최성훈
 * 수정일: 2014-05-22, 2014-05-23
 * 수정내용:22일 - 일정, 일기 게시판 구현을 위해 전체 개수에 대한 페이지 번호 구하기,
 * 			페이지 번호에 대한 10개 단위 리스트 구하기 메소드 추가
 * 			23일 - 일정, 일기를 날짜로 검색하기 메소드 추가
 * 
 * 수정: 최성훈
 * 수정일: 2014-05-27
 * 수정내용: 전체 일기, 일정, 방명록 받아오기를 BoardDTO가 아닌 Diary,Plan, Visit DTO들로 하기,
 * 				- BoardDTO로 받는 기능 안쓰게끔 액션 수정 후 삭제할 예정.
 */
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class DiaryDAO {

	// 일기 전체목록받기(14-05-27 성훈수정중 - 삭제예정)
	public static List<BoardDTO> selectDiary(UserDTO user) throws SQLException {
		SqlSession session = null;
		List<BoardDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("test.selectDiary", user.getUserno());
		} finally {
			DBUtil.closeSession(session);
		}

		return list;
	}
	
	// 일기 전체목록받기(14-05-27 성훈추가)
	public static List<DiaryDTO> selectAllDiary(UserDTO user) throws SQLException {
		SqlSession session = null;
		List<DiaryDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("test.selectDiary", user.getUserno());
		} finally {
			DBUtil.closeSession(session);
		}

		return list;
	}
	

	public static BoardDTO selectOneDiary(int brdno) throws SQLException {
		SqlSession session = null;
		BoardDTO boardDTO = null;
		try {
			session = DBUtil.getSqlSession();
			boardDTO = session.selectOne("test.selectOneDiary", brdno);

		} finally {
			DBUtil.closeSession(session);
		}
		return boardDTO;
	}

	//14-05-14 성훈 추가: brdno를 통한 diary검색, diaryDTO반환 [OneDiaryAction에서 사용]
	public static DiaryDTO getJustDiary(int brdno) throws SQLException {
		SqlSession session = null;
		DiaryDTO diaryDTO = null;
		try {
			session = DBUtil.getSqlSession();
			diaryDTO = session.selectOne("test.selectOneDiaryBybrdno", brdno);
		} finally {
			DBUtil.closeSession(session);
		}
		return diaryDTO;
	}

	//14-05-22 성훈추가: 전체 일기에 대한 페이지 번호수 가져오기 [일기페이지에서 사용]
	public static int getDiaryCount(int userno) throws SQLException{
		SqlSession session = null;
		int diaryCount = 0;
		int pageCount = 0;
		try {
			session = DBUtil.getSqlSession();
			diaryCount = session.selectOne("test.selectCountDiary",userno);
			pageCount = diaryCount/10;
			if(diaryCount%10 > 0)	pageCount++;
		} finally {
			DBUtil.closeSession(session);
		}
		return pageCount;
	}
	
	//14-05-22 성훈추가: 페이지 번호에 해당하는 일기 10개단위로 가져오기 [일기페이지에서 사용]
	public static List<DiaryDTO> getTenDiaries(int pageCount, int userno) throws SQLException{
		SqlSession session = null;
		List<DiaryDTO> list = null;
		HashMap<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("value", pageCount);
			map.put("userno", userno);
			list = session.selectList("test.selectTenDiaries",map);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}

	//14-05-23 성훈추가: 날짜로 일기 검색해오기[CalendarAction에서 사용]
	public static List<DiaryDTO> getDiaryBydate(String wrdate, String userid) throws SQLException{
		SqlSession session = null;
		List<DiaryDTO> list = null;
		HashMap<String,String> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,String>();
			map.put("wrdate", wrdate);
			map.put("userid", userid);
			list = session.selectList("test.selectDiaryBydate",map);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	
	public static DiaryDTO selectLastDiary(int userno) throws SQLException {
		SqlSession session = null;
		DiaryDTO dto = null;
		try {
			session = DBUtil.getSqlSession();
			dto = session.selectOne("test.selectLastDiary", userno);
		} finally {
			DBUtil.closeSession(session);
		}
		return dto;
	}

	// DiaryDTO의 일기 내용을 update
	public static void deleteDiary(int brdno) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			result = session.insert("delete.deleteDiary", brdno) > 0 ? true
					: false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if (!result)
			throw new SQLException("일정 삭제에 실패했습니다.");
	}
	
	// BoardDTO의 일기 내용을 update
	public static void updateDiaryBoard(BoardDTO boardDTO) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			result = session.update("update.updateDiaryBoard", boardDTO) > 0 ? true : false;
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
			result = session.insert("update.updateDiary", diaryDTO) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일정 수정에 실패했습니다.");
	}
	
	//다이어리 보드내용 입력 후 입력된 brdno를 반환하기(insert 후 select)
	public static int insertDiaryBoard(BoardDTO boardDTO) throws SQLException{
		
		SqlSession session = null;
		boolean result = false;
		int brdno = 0;
		try{
			session = DBUtil.getSqlSession();
			result = session.insert("insert.insertDiaryBoard",boardDTO)>0 ? true:false;
			brdno = session.selectOne("test.selectBoard", boardDTO);
		}finally{
			DBUtil.closeSession(session, result);
		}
		if(!result || brdno==0){
			throw new SQLException("다이어리보드 입력실패!");
		}
		return brdno;
	}
	
	//다이어리 내용 입력하기 
	public static void insertDiary(DiaryDTO diaryDTO) throws SQLException{
		
		SqlSession session = null;
		boolean result = false;
		try{
			session = DBUtil.getSqlSession();
			result = session.insert("insert.insertDiary",diaryDTO)>0 ? true:false;
		}finally{
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일기 등록에 실패했습니다.");
	}

}
