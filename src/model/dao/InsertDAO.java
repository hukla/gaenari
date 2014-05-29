package model.dao;

/**
 * 작성: 2014-05-03
 * 작성자: 최성훈
 * 내용: 일기와 일정의 내용 입력(insert)
 * 		일기 내용을 BoardDTO에 저장하고 저장한 일기의 brdno를 DiaryDTO에 입력
 * 		일정 내용을 BoardDTO에 저장하고 저장한 일정의 brdno를 PlanDTO에 입력
 * 
 * 수정: 2014-05-24, 최성훈
 * 내용: 회원가입 메소드 추가
 * 
 * 수정: 2014-05-28, 최성훈
 * 내용: 강아지정보 등록
 */
import java.sql.SQLException;
import java.util.HashMap;

import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.DogDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class InsertDAO {
	
	//다이어리 보드내용 입력 후 입력된 brdno를 반환하기(insert 후 select)
	public static int insertDiaryBoard(BoardDTO boardDTO) throws SQLException{
		
		SqlSession session = null;
		boolean result = false;
		int brdno = 0;
		try{
			session = DBUtil.getSqlSession();
			System.out.println("==diaryBoard insert 진입==");
			result = session.insert("insert.insertDiaryBoard",boardDTO)>0 ? true:false;
			System.out.println("==diaryBoard insert 완료==");
			System.out.println("==diaryBoard select 진입==");
			brdno = session.selectOne("test.selectBoard", boardDTO);
			System.out.println("==diaryBoard select 완료==");
		}finally{
			DBUtil.closeSession(session, result);
		}
		if(!result || brdno==0){
			throw new SQLException("다이어리보드 입력실패!");
		}
		return brdno;
	}
	
	//플랜 보드내용 입력 후 입력된 brdno를 반환하기(insert 후 select)
	public static int insertPlanBoard(BoardDTO boardDTO) throws SQLException{
		
		SqlSession session = null;
		boolean result = false;
		int brdno = 0;
		try{
			session = DBUtil.getSqlSession();
			System.out.println("==planBoard insert 진입==");
			result = session.insert("insert.insertPlanBoard",boardDTO)>0 ? true:false;
			System.out.println("==planBoard insert 완료==");
			System.out.println("==planBoard select 진입==");
			brdno = session.selectOne("test.selectBoard", boardDTO);
			System.out.println("==planBoard select 완료==");
		}finally{
			DBUtil.closeSession(session, result);
		}
		if(!result || brdno==0){
			throw new SQLException("일정보드 입력실패!");
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
			System.out.println("==visitBoard insert 진입==");
			result = session.insert("insert.insertVisitBoard", boardDTO) > 0 ? true : false;
			System.out.println("==visitBoard insert 완료==");
			System.out.println("==visitBoard select 진입==");
			brdno = session.selectOne("test.selectVisitBoard", boardDTO);
			System.out.println("==visitBoard select 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if (!result || brdno == 0) {
			throw new SQLException("방명록보드 입력실패!");
		}
		return brdno;
	}

	//다이어리 내용 입력하기 
	public static void insertDiary(DiaryDTO diaryDTO) throws SQLException{
		
		SqlSession session = null;
		boolean result = false;
		try{
			session = DBUtil.getSqlSession();
			System.out.println("==diary insert 진입==");
			result = session.insert("insert.insertDiary",diaryDTO)>0 ? true:false;
			System.out.println("==diary insert 완료==");
		}finally{
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일기 등록에 실패했습니다.");
	}
	
	//일정 내용 입력하기
	public static void insertPlan(PlanDTO planDTO) throws SQLException{
		
		SqlSession session = null;
		boolean result = false;
		try{
			session = DBUtil.getSqlSession();
			System.out.println("==plan insert 진입==");
			result = session.insert("insert.insertPlan",planDTO)>0 ? true:false;
			System.out.println("==plan insert 완료==");
		}finally{
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일정 등록에 실패했습니다.");
	}
	
	// 방명록 내용 입력하기
	public static void insertVisitbook(int brdno) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==visitbook insert 진입==");
			result = session.insert("insert.insertVisitbook", brdno) > 0 ? true : false;
			System.out.println("==visitbook insert 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("방명록 등록에 실패했습니다.");
	}

	// 14-05-23 성훈추가: 회원 가입하기
	public static void insertUser(UserDTO user) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==insertUser insert 진입==");
			result = session.insert("insert.insertUser", user) > 0 ? true : false;
			System.out.println("==insertUser insert 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("회원가입에 실패했습니다.");
	}
	//14-05-28 성훈추가: 강아지 정보입력
	public static void insertDoginfo(DogDTO dog) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==insertDoginfo insert 진입==");
			result = session.insert("insert.insertDoginfo", dog) > 0 ? true : false;
			System.out.println("==insertDoginfo insert 완료==");
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("강아지 등록에 실패했습니다.");
	}
	
}
