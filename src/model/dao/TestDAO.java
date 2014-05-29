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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.dto.BoardDTO;
import model.dto.DiaryDTO;
import model.dto.DogDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;
import model.dto.VisitDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class TestDAO {

	// 일정 전체목록받기 ((14-05-27 성훈수정중 - 삭제예정))
	public static List<BoardDTO> selectPlan(UserDTO user) throws SQLException {
		SqlSession session = null;
		List<BoardDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			System.out.println("==planDAO진입==");
			list = session.selectList("test.selectPlan", user.getUserno());
			System.out.println("==planDAO종료==");
		} finally {
			DBUtil.closeSession(session);
		}

		return list;
	}
	// 일정 전체목록받기(14-05-27 성훈추가)
	public static List<PlanDTO> selectAllPlan(UserDTO user) throws SQLException {
		SqlSession session = null;
		List<PlanDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			System.out.println("==planDAO진입==");
			list = session.selectList("test.selectPlan", user.getUserno());
			System.out.println("==planDAO종료==");
		} finally {
			DBUtil.closeSession(session);
		}

		return list;
	}
	
	// 일정 전체목록받기 (확인후 위에꺼나 이것 중 하나 지우기)
	public static List<PlanDTO> selectPlanList(int userno) throws SQLException {
		SqlSession session = null;
		List<PlanDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			System.out.println("==planListDAO진입==");
			list = session.selectList("test.selectPlan", userno);
			System.out.println("==planListDAO종료==");
		} finally {
			DBUtil.closeSession(session);
		}

		return list;
	}

	// 일기 전체목록받기(14-05-27 성훈수정중 - 삭제예정)
	public static List<BoardDTO> selectDiary(UserDTO user) throws SQLException {
		SqlSession session = null;
		List<BoardDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			System.out.println("==diaryDAO진입==");
			list = session.selectList("test.selectDiary", user.getUserno());
			System.out.println("==diaryDAO종료==");
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
			System.out.println("==diaryDAO진입==");
			list = session.selectList("test.selectDiary", user.getUserno());
			System.out.println("==diaryDAO종료==");
		} finally {
			DBUtil.closeSession(session);
		}

		return list;
	}

	//14-05-21 성훈수정: 쿼리문 명 selectVisit에서 selectReverseVisit으로 바꿈
	public static List<BoardDTO> selectVisit(UserDTO user) throws SQLException {
		SqlSession session = null;
		List<BoardDTO> list = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==visitDAO진입==");
			list = session.selectList("test.selectReverseVisit", user.getUserno());
			System.out.println("==visitDAO종료==");
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	public static List<VisitDTO> selectAllVisit(UserDTO user) throws SQLException {
		SqlSession session = null;
		List<VisitDTO> list = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==visitDAO진입==");
			list = session.selectList("test.selectReverseVisit", user.getUserno());
			System.out.println("==visitDAO종료==");
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}

	// 14-05-13 성훈 추가 미리보기용 일기 3개 받기
	public static List<BoardDTO> selectThreeDiaries(UserDTO user)
			throws SQLException {
		SqlSession session = null;
		List<BoardDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			System.out.println("==diary미리보기DAO진입==");
			list = session.selectList("test.selectLastThree", user.getUserno());
			System.out.println("==diary미리보기DAO종료==");
		} finally {
			DBUtil.closeSession(session);
		}

		return list;
	}

	// 14-05-13 성훈 추가 미리보기용 일기 3개 받기
	public static List<BoardDTO> selectThreePlans(UserDTO user)
			throws SQLException {
		SqlSession session = null;
		List<BoardDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			System.out.println("==plan미리보기DAO진입==");
			list = session.selectList("test.selectLastThreePlan",user.getUserno());
			System.out.println("==plan미리보기DAO종료==");
		} finally {
			DBUtil.closeSession(session);
		}

		return list;
	}

	// 14-05-13 성훈 추가 미리보기용 일기 3개 받기
	public static List<BoardDTO> selectThreeVisits(UserDTO user)
			throws SQLException {
		SqlSession session = null;
		List<BoardDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			System.out.println("==plan미리보기DAO진입==");
			list = session.selectList("test.selectLastThreeVisit",user.getUserno());
			System.out.println("==plan미리보기DAO종료==");
		} finally {
			DBUtil.closeSession(session);
		}

		return list;
	}

	public static BoardDTO selectOnePlan(int brdno) throws SQLException {
		SqlSession session = null;
		BoardDTO boardDTO = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==onePlanDAO진입==");
			boardDTO = session.selectOne("test.selectOnePlan", brdno);
			System.out.println("==onePlanDAO종료==");
			/* System.out.println(boardVo.getTitle()); */

		} finally {
			DBUtil.closeSession(session);
		}
		return boardDTO;
	}

	public static BoardDTO selectOneDiary(int brdno) throws SQLException {
		SqlSession session = null;
		BoardDTO boardDTO = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==oneDiaryDAO진입==");
			boardDTO = session.selectOne("test.selectOneDiary", brdno);
			System.out.println("==oneDiaryDAO종료==");

		} finally {
			DBUtil.closeSession(session);
		}
		return boardDTO;
	}
	
	//14-05-14 성훈 추가: dbrdno를 통한 diary검색, diaryDTO반환
	public static DiaryDTO getOneDiary(int dbrdno,int userno) throws SQLException {
		SqlSession session = null;
		DiaryDTO diaryDTO = null;
		HashMap<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			System.out.println("==getOneDiary진입==");
			map.put("dbrdno", dbrdno);
			map.put("userno",userno);
			diaryDTO = session.selectOne("test.selectOneDiaryByMap", map);
			System.out.println("==getOneDiary종료==");
			
		} finally {
			DBUtil.closeSession(session);
		}
		if(diaryDTO == null)	throw new SQLException("페이지의 마지막입니다.");
		return diaryDTO;
	}
	
	//14-05-14 성훈 추가: pbrdno를 통한 일정검색, planDTO반환
	public static PlanDTO getOnePlan(int pbrdno,int userno) throws SQLException {
		SqlSession session = null;
		PlanDTO planDTO = null;
		HashMap<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==getOnePlan진입==");
			map = new HashMap<String,Integer>();
			map.put("pbrdno", pbrdno);
			map.put("userno", userno);
			System.out.println("pbrdno="+pbrdno+"  userno="+userno);
			/*planDTO = session.selectOne("test.selectOnePlanBypbrdno", pbrdno);*/
			planDTO = session.selectOne("test.selectOnePlanByMap", map);
			System.out.println("==getOnePlan종료==");
		} finally {
			DBUtil.closeSession(session);
		}
		if(planDTO == null)	throw new SQLException("페이지끝입니다.");
		return planDTO;
	}
	
	//14-05-21 성훈 추가: vbrdno를 통한 일정검색, visitDTO반환
	public static VisitDTO getOneVisit(int vbrdno,int userno) throws SQLException {
		SqlSession session = null;
		VisitDTO visitDTO = null;
		HashMap<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==getOneVisit진입==");
			map = new HashMap<String,Integer>();
			map.put("vbrdno", vbrdno);
			map.put("userno", userno);
			System.out.println("vbrdno="+vbrdno+"  userno="+userno);
			visitDTO = session.selectOne("test.selectOneVisitByMap", map);
			System.out.println("==getOneVisit종료==");
		} finally {
			DBUtil.closeSession(session);
		}
		if(visitDTO == null)	throw new SQLException("페이지끝입니다.");
		return visitDTO;
	}

	//14-05-14 성훈 추가: brdno를 통한 diary검색, diaryDTO반환
	public static DiaryDTO getJustDiary(int brdno) throws SQLException {
		SqlSession session = null;
		DiaryDTO diaryDTO = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==getJustDiary진입==");
			diaryDTO = session.selectOne("test.selectOneDiaryBybrdno", brdno);
			System.out.println("==getJustDiary종료==");

		} finally {
			DBUtil.closeSession(session);
		}
		return diaryDTO;
	}
	
	//14-05-14 성훈 추가: brdno를 통한 일정검색, planDTO반환
	public static PlanDTO getJustPlan(int brdno) throws SQLException {
		SqlSession session = null;
		PlanDTO planDTO = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==getJustDiary진입==");
			planDTO = session.selectOne("test.selectOnePlanBybrdno", brdno);
			System.out.println("==getJustDiary종료==");

		} finally {
			DBUtil.closeSession(session);
		}
		return planDTO;
	}
	
	// 14-05-21 성훈 추가: brdno를 통한 방명록검색, visitDTO반환
	public static VisitDTO getJustVisit(int brdno) throws SQLException {
		SqlSession session = null;
		VisitDTO visitDTO = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==getJustVisit진입==");
			visitDTO = session.selectOne("test.selectOneVisitBybrdno", brdno);
			System.out.println("==getJustVisit종료==");

		} finally {
			DBUtil.closeSession(session);
		}
		return visitDTO;
	}
	
	public static BoardDTO selectOneVisit(int brdno) throws SQLException {
		SqlSession session = null;
		BoardDTO boardDTO = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==selectOneVisit진입==");
			boardDTO = session.selectOne("test.selectOneVisit", brdno);
			System.out.println("==selectOneVisit종료==");
			/* System.out.println(boardVo.getTitle()); */

		} finally {
			DBUtil.closeSession(session);
		}
		return boardDTO;
	}

	// 14-05-13 성훈 추가 날짜 정보와 User정보를 통해 해당 User의 전체 일정목록을 리스트의 리스트로 받기
	public static List<List<BoardDTO>> selectPlanbyDate(
			ArrayList<String> dateList, String userid) throws SQLException {
		SqlSession session = null;
		List<BoardDTO> list = null;
		Map<String, String> map = null;
		List<List<BoardDTO>> papaList = new ArrayList<List<BoardDTO>>();
		try {
			session = DBUtil.getSqlSession();
			System.out.println("★==selectPlanbyDate진입==");

			for (String str : dateList) { // 날짜정보가 저장되어 있는 만큼 for문 돈다.
				System.out.println("받은 날짜값:" + str);
				map = new HashMap<String, String>();
				map.put("wrdate", str);
				map.put("userid", userid);
				list = session.selectList("test.selectPlanbyDate", map);// 그 달의
																		// 일정
																		// 목록받기
				System.out.println("가져온 날의 정보:" + list);
				papaList.add(list);
			}
			System.out.println("==selectPlanbyDate종료==");

		} finally {
			DBUtil.closeSession(session);
		}
		return papaList;
	}
	
	//14-05-22 성훈추가: 전체 일기에 대한 페이지 번호수 가져오기
	public static int getDiaryCount(int userno) throws SQLException{
		SqlSession session = null;
		int diaryCount = 0;
		int pageCount = 0;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==getDiaryCount진입==");
			diaryCount = session.selectOne("test.selectCountDiary",userno);
			System.out.println("==getDiaryCount종료==");
			pageCount = diaryCount/10;
			if(diaryCount%10 > 0)	pageCount++;
		} finally {
			DBUtil.closeSession(session);
		}
		return pageCount;
	}
	
	//14-05-22 성훈추가: 페이지 번호에 해당하는 일기 10개단위로 가져오기
	public static List<DiaryDTO> getTenDiaries(int pageCount, int userno) throws SQLException{
		SqlSession session = null;
		List<DiaryDTO> list = null;
		HashMap<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("value", pageCount);
			map.put("userno", userno);
			System.out.println("==getTenDiaries진입==");
			list = session.selectList("test.selectTenDiaries",map);
			System.out.println("==getTenDiaries종료==");
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	
	//14-05-22 성훈추가: 전체 일정에 대한 페이지 번호수 가져오기
	public static int getPlanCount(int userno) throws SQLException{
		SqlSession session = null;
		int planCount = 0;
		int pageCount = 0;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==getPlanCount진입==");
			planCount = session.selectOne("test.selectCountPlan",userno);
			System.out.println("==getPlanCount종료==");
			pageCount = planCount/10;
			if(planCount%10 > 0)	pageCount++;
		} finally {
			DBUtil.closeSession(session);
		}
		return pageCount;
	}
	
	//14-05-22 성훈추가: 페이지 번호에 해당하는 일정 10개단위로 가져오기
	public static List<PlanDTO> getTenPlans(int pageCount, int userno) throws SQLException{
		SqlSession session = null;
		List<PlanDTO> list = null;
		HashMap<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("value", pageCount);
			map.put("userno", userno);
			System.out.println("==getTenPlans진입==");
			list = session.selectList("test.selectTenPlans",map);
			System.out.println("==getTenPlans종료==");
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	
	//14-05-23 성훈추가: 날짜로 일기 검색해오기
	public static List<DiaryDTO> getDiaryBydate(String wrdate, String userid) throws SQLException{
		SqlSession session = null;
		List<DiaryDTO> list = null;
		HashMap<String,String> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,String>();
			System.out.println(wrdate+" "+userid);
			map.put("wrdate", wrdate);
			map.put("userid", userid);
			System.out.println("==getDiaryBydate진입==");
			list = session.selectList("test.selectDiaryBydate",map);
			System.out.println("==getDiaryBydate종료==");
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	
	//14-05-23 성훈추가: 날짜로 일정 검색해오기
	public static List<PlanDTO> getPlanBydate(String wrdate, String userid) throws SQLException{
		SqlSession session = null;
		List<PlanDTO> list = null;
		HashMap<String,String> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,String>();
			map.put("wrdate", wrdate);
			map.put("userid", userid);
			System.out.println("==getPlanBydate진입==");
			list = session.selectList("test.selectPlanBydate",map);
			System.out.println("==getPlanBydate종료==");
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	public static List<DogDTO> getMyDogInfo(int userno) throws SQLException{
		SqlSession session = null;
		List<DogDTO> list = null;
		try {
			session = DBUtil.getSqlSession();
			System.out.println("==getMyDogInfo진입==");
			list = session.selectList("dog.getInfo",userno);
			System.out.println("==getMyDogInfo종료==");
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
}
