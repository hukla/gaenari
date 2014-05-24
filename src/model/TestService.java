package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dao.TestDAO;
import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;
import model.dto.VisitDTO;

/**
 * 작성: 2014.04.21 
 * 작성자: 최성훈 작성 목적: 수정된 일기,일정,방명록 정보 관리(DAO와 FrontController의 매개역할) 
 * 작성 내용: UserDTO타입의 user정보를 DAO에 전달하고 DAO로부터 그에 해당하는 FrontController로 일기,
 * 			일정, 방명록 정보를 전달해 준다.
 * 
 * 수정: 최성훈 
 * 수정일: 2014.04.23 
 * 수정내용: List를 받아오는 메소드에서 받아온 List가 비어있을 때 Exception 처리
 * 			안하도록 주석처리 (작성글이 없는게 Exception이되면 안되니깡)
 * 			OneDiary, OnePlan, OneVisit 메소드 추가 (링크 클릭해서 글 하나씩 보도록) 
 * 
 * 수정: 최성훈 
 * 수정일: 2014-05-03 
 * 수정내용: List<List<BoardDTO>>타입의 planByDate 메소드 추가 동일날짜의 일정목록을 저장한
 * 			List, 그 List를 날짜별로 저장한 List를 반환
 * 			불러오는 목록이 비어있을 때 에러페이지로 가지 않도록 Exception 부분 주석처리
 * 
 * 수정: 최성훈
 * 수정일: 2014-05-14
 * 수정내용: 이전글, 다음글버튼으로 일기,일정 페이지 이동 기능 추가, 
 * 			미리보기로 접근할 때 diaryDTO, planDTO를 리턴타입으로 하는 메소드 추가
 * 
 * 수정: 최성훈
 * 수정일: 2014-05-24
 * 수정내용: 날짜로 일기, 일정 검색하기 메소드 추가
 */

public class TestService {

	// 14-05-13 성훈 추가 미리보기용 세개의 최근 일기 받기
	public static List<BoardDTO> threeDiariesService(UserDTO user)
			throws SQLException {

		List<BoardDTO> list = TestDAO.selectThreeDiaries(user);
		/*
		 * if(list.isEmpty()){ throw new SQLException("정보 없음"); }
		 */
		return list;
	}

	// 14-05-13 성훈 추가 미리보기용 세개의 최근 일기 받기
	public static List<BoardDTO> threePlansService(UserDTO user)
			throws SQLException {

		List<BoardDTO> list = TestDAO.selectThreePlans(user);
		/*
		 * if(list.isEmpty()){ throw new SQLException("정보 없음"); }
		 */
		return list;
	}

	// 14-05-13 성훈 추가 미리보기용 세개의 최근 일기 받기
	public static List<BoardDTO> threeVisitsService(UserDTO user)
			throws SQLException {

		List<BoardDTO> list = TestDAO.selectThreeVisits(user);
		/*
		 * if(list.isEmpty()){ throw new SQLException("정보 없음"); }
		 */
		return list;
	}
	
	public static List<BoardDTO> diaryService(UserDTO user) throws SQLException {

		List<BoardDTO> list = TestDAO.selectDiary(user);
		/*
		 * if(list.isEmpty()){ throw new SQLException("정보 없음"); }
		 */
		return list;
	}

	public static List<BoardDTO> planService(UserDTO user) throws SQLException {

		List<BoardDTO> list = TestDAO.selectPlan(user);
		/*
		 * if(list.isEmpty()){ throw new SQLException("정보 없음"); }
		 */
		return list;
	}
	
	//14-05-20 성훈추가: 진행중
	public static List<PlanDTO> getUsersPlan(int userno) throws SQLException {

		List<PlanDTO> list = TestDAO.selectPlanList(userno);
		/*
		 * if(list.isEmpty()){ throw new SQLException("정보 없음"); }
		 */
		return list;
	}

	public static List<BoardDTO> visitService(UserDTO user) throws SQLException {

		List<BoardDTO> list = TestDAO.selectVisit(user);
		/*
		 * if(list.isEmpty()){ throw new SQLException("정보 없음"); }
		 */
		return list;
	}
	// 14-05-13 성훈 수정 한개 일기 보기
	public static BoardDTO oneDiaryService(int brdno) throws SQLException {

		BoardDTO boardDTO = TestDAO.selectOneDiary(brdno);
		/*if (boardDTO == null) {
			throw new SQLException("정보 없음");
		}*/
		return boardDTO;
	}
	
	// 14-05-14 성훈 추가: 이전 일기, 다음 일기 이동할 때 dbrdno로 일기 검색, DiaryDTO리턴
	public static DiaryDTO getOneDiary(int dbrdno, int userno) throws SQLException {

		DiaryDTO diaryDTO = TestDAO.getOneDiary(dbrdno,userno);
		if (diaryDTO == null) {
			throw new SQLException("페이지의 마지막입니다.");
		}
		return diaryDTO;
	}
	
	// 14-05-14 성훈 추가: 이전 일정, 다음 일정 이동할 때 pbrdno로 일정 검색, planDTO리턴
	public static PlanDTO getOnePlan(int pbrdno,int userno) throws SQLException {

		PlanDTO planDTO = TestDAO.getOnePlan(pbrdno,userno);
		if (planDTO == null) {
			throw new SQLException("페이지끝입니다.");
		}
		return planDTO;
	}
	
	// 14-05-21 성훈 추가: 이전 방명록, 다음 방명록 이동할 때 vbrdno로 일정 검색, visitDTO리턴
	public static VisitDTO getOneVisit(int vbrdno, int userno) throws SQLException {

		VisitDTO visitDTO = TestDAO.getOneVisit(vbrdno, userno);
		if (visitDTO == null) {
			throw new SQLException("페이지끝입니다.");
		}
		return visitDTO;
	}

	// 14-05-14 성훈 추가: 미리보기를 통해서 일기로 이동할 때 brdno로 일기 검색, DiaryDTO리턴
	public static DiaryDTO getJustDiary(int brdno) throws SQLException {

		DiaryDTO diaryDTO = TestDAO.getJustDiary(brdno);
		return diaryDTO;
	}
	
	// 14-05-14 성훈 추가: 미리보기를 통해서 일정으로 이동할 때 brdno로 일정 검색, PlanDTO리턴
	public static PlanDTO getJustPlan(int brdno) throws SQLException {

		PlanDTO planDTO = TestDAO.getJustPlan(brdno);
		return planDTO;
	}
	
	// 14-05-21 성훈 추가: 미리보기를 통해서 방명록으로 이동할 때 brdno로 일정 검색, VisitDTO리턴
	public static VisitDTO getJustVisit(int brdno) throws SQLException {

		VisitDTO visitDTO = TestDAO.getJustVisit(brdno);
		return visitDTO;
	}

	// 14-05-13 성훈 수정 한개 일정 보기
	public static BoardDTO onePlanService(int brdno) throws SQLException {

		BoardDTO boardDTO = TestDAO.selectOnePlan(brdno);
		/*if (boardDTO == null) {
			throw new SQLException("정보 없음");
		}*/
		return boardDTO;
	}

	// 14-05-13 성훈 수정 한개 방명록 보기
	public static BoardDTO oneVisitService(int brdno) throws SQLException {

		BoardDTO boardDTO = TestDAO.selectOneVisit(brdno);
		/*if (boardDTO == null) {
			throw new SQLException("정보 없음");
		}*/
		return boardDTO;
	}
	
	// 동일날짜의 일정목록을 저장한 List, 그 List를 날짜별로 저장한 List를 반환
	public static List<List<BoardDTO>> planByDate(ArrayList<String> dateList,
			String userid) throws SQLException {
		List<List<BoardDTO>> list = TestDAO.selectPlanbyDate(dateList, userid);
		return list;
	}
	//14-05-22 성훈추가: 다이어리 목록 페이지 받기
	public static int getDiaryCount(int userno) throws SQLException{
		int pageCount = TestDAO.getDiaryCount(userno);
		return pageCount;
	}
	//14-05-22 성훈추가: 다이어리 10개씩 받아오기
	public static List<DiaryDTO> getTenDiaries(int pageCount,int userno) throws SQLException{
		List<DiaryDTO> list = TestDAO.getTenDiaries(pageCount, userno);
		return list;
	}
	//14-05-22 성훈추가: 일정 목록 페이지 받기
	public static int getPlanCount(int userno) throws SQLException{
		int pageCount = TestDAO.getPlanCount(userno);
		return pageCount;
	}
	//14-05-22 성훈추가: 일정 10개씩 받아오기
	public static List<PlanDTO> getTenPlans(int pageCount,int userno) throws SQLException{
		List<PlanDTO> list = TestDAO.getTenPlans(pageCount, userno);
		return list;
	}
	//14-05-24 성훈추가: 날짜로 일기 검색
	public static List<DiaryDTO> getDiaryBydate(String wrdate,String userid) throws SQLException{
		List<DiaryDTO> list = TestDAO.getDiaryBydate(wrdate, userid);
		return list;
	}
	//14-05-24 성훈추가: 날짜로 일정 검색
	public static List<PlanDTO> getPlanBydate(String wrdate,String userid) throws SQLException{
		List<PlanDTO> list = TestDAO.getPlanBydate(wrdate, userid);
		return list;
	}

}
