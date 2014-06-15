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
import model.dto.CommentDTO;
import model.dto.DiaryDTO;
import model.dto.DogDTO;
import model.dto.PlanDTO;
import model.dto.PtBoardDTO;
import model.dto.UserDTO;
import model.dto.VisitDTO;
import model.dto.VoluBoardDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class TestDAO {

	// 일정 전체목록받기 ((14-05-27 성훈수정중 - 삭제예정))
	public static List<BoardDTO> selectPlan(UserDTO user) throws SQLException {
		SqlSession session = null;
		List<BoardDTO> list = null;

		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("test.selectPlan", user.getUserno());
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
			list = session.selectList("test.selectPlan", userno);
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

	//14-05-21 성훈수정: 쿼리문 명 selectVisit에서 selectReverseVisit으로 바꿈
	public static List<BoardDTO> selectVisit(UserDTO user) throws SQLException {
		SqlSession session = null;
		List<BoardDTO> list = null;
		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("test.selectReverseVisit", user.getUserno());
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
			list = session.selectList("test.selectReverseVisit", user.getUserno());
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
			list = session.selectList("test.selectLastThree", user.getUserno());
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
			list = session.selectList("test.selectLastThreePlan",user.getUserno());
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
			list = session.selectList("test.selectLastThreeVisit",user.getUserno());
		} finally {
			DBUtil.closeSession(session);
		}

		return list;
	}

	public static PlanDTO selectOnePlan(int brdno) throws SQLException {
		SqlSession session = null;
		PlanDTO planDTO = null;
		try {
			session = DBUtil.getSqlSession();
			planDTO = session.selectOne("test.selectOnePlan", brdno);

		} finally {
			DBUtil.closeSession(session);
		}
		return planDTO;
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
	
	//14-05-14 성훈 추가: dbrdno를 통한 diary검색, diaryDTO반환
	public static DiaryDTO getOneDiary(int dbrdno,int userno) throws SQLException {
		SqlSession session = null;
		DiaryDTO diaryDTO = null;
		HashMap<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("dbrdno", dbrdno);
			map.put("userno",userno);
			diaryDTO = session.selectOne("test.selectOneDiaryByMap", map);
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
			map = new HashMap<String,Integer>();
			map.put("pbrdno", pbrdno);
			map.put("userno", userno);
			planDTO = session.selectOne("test.selectOnePlanByMap", map);
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
			map = new HashMap<String,Integer>();
			map.put("vbrdno", vbrdno);
			map.put("userno", userno);
			visitDTO = session.selectOne("test.selectOneVisitByMap", map);
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
			diaryDTO = session.selectOne("test.selectOneDiaryBybrdno", brdno);
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
			planDTO = session.selectOne("test.selectOnePlanBybrdno", brdno);
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
			visitDTO = session.selectOne("test.selectOneVisitBybrdno", brdno);

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
			boardDTO = session.selectOne("test.selectOneVisit", brdno);
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
			for (String str : dateList) { // 날짜정보가 저장되어 있는 만큼 for문 돈다.
				map = new HashMap<String, String>();
				map.put("wrdate", str);
				map.put("userid", userid);
				list = session.selectList("test.selectPlanbyDate", map);// 그 달의 일정 목록받기
				papaList.add(list);
			}
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
			diaryCount = session.selectOne("test.selectCountDiary",userno);
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
			list = session.selectList("test.selectTenDiaries",map);
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
			planCount = session.selectOne("test.selectCountPlan",userno);
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
			list = session.selectList("test.selectTenPlans",map);
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
			map.put("wrdate", wrdate);
			map.put("userid", userid);
			list = session.selectList("test.selectDiaryBydate",map);
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
			list = session.selectList("test.selectPlanBydate",map);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	//14-05-29 성훈추가: 내 강아지정보 가져오기
	public static List<DogDTO> getMyDogInfo(int userno) throws SQLException{
		SqlSession session = null;
		List<DogDTO> list = null;
		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("dog.getInfo",userno);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	//14-05-30 성훈추가: 나와 친구 간의 친구요청상태 확인 (14-06-05 성훈수정)
	public static int amIsender(int sender, int receiver) throws SQLException{
		SqlSession session = null;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("sender", sender);
			map.put("receiver", receiver);
			if(session.selectOne("test.checkFrndReq",map)!=null){
				return 1;		//sender가 요청한 사실이 맞다.
			}else{
				map = new HashMap<String,Integer>();
				map.put("sender", receiver);
				map.put("receiver", sender);
				if(session.selectOne("test.checkFrndReq",map)!=null){
					return 2;	//sender가 요청을 받은 것이다.
				}
			}
		} finally {
			DBUtil.closeSession(session);
		}
		return 3;	//둘은 서로에게 친구요청을 한 적이 없다.
	}	
	//14-05-30 성훈추가: 나와 친구간의 친구상태 확인
	public static boolean areWeFriends(int sender, int receiver) throws SQLException{
		SqlSession session = null;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("subuser", sender);
			map.put("prmuser", receiver);	//누가 친구신청했는지 누가 승인했는지 구분없이 쿼리문 돌리려면?
			if(session.selectOne("test.areWeFriends",map)==null){
				map = new HashMap<String,Integer>();
				map.put("subuser", receiver);
				map.put("prmuser", sender);
				if(session.selectOne("test.areWeFriends",map)==null){
					return false;
				}
			}
		} finally {
			DBUtil.closeSession(session);
		}
		return true;
	}	
	
	//14-05-30 성훈추가: 내가 받은 친구요청리스트
	public static List<Integer> checkMyReqinfo(int receiver) throws SQLException{
		SqlSession session = null;
		List<Integer> list = null;
		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("test.checkMyReqinfo",receiver);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}	
	//14-05-30 성훈추가: 내 친구목록불러오기(selfJoin + Union)
	public static List<Integer> getMyFriends(int userno) throws SQLException{
		SqlSession session = null;
		List<Integer> list = null;
		Map<String,Integer> map = null;
		try {
			session = DBUtil.getSqlSession();
			map = new HashMap<String,Integer>();
			map.put("subuser", userno);
			map.put("prmuser", userno);
			list = session.selectList("test.getMyFriends",userno);
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
	public static List<PlanDTO> myTodaysPlan(String userid) throws SQLException {
		SqlSession session = null;
		List<PlanDTO> list = null;
		try {
			session = DBUtil.getSqlSession();
			list = session.selectList("test.myTodaysPlan", userid);
		} finally {
			DBUtil.closeSession(session);
		}
		return list;
	}
	
	
	public static PlanDTO unfinishedPlan(String userid) throws SQLException {
		SqlSession session = null;
		PlanDTO plan = null;
		try {
			session = DBUtil.getSqlSession();
			plan = session.selectOne("test.unfinishedPlan", userid);
		} finally {
			DBUtil.closeSession(session);
		}
		return plan;
	}
	
	public static List<PlanDTO> getPlanByDogno(int dogno) throws SQLException {
		SqlSession session = null;
		List<PlanDTO> planList = null;
		try {
			session = DBUtil.getSqlSession();
			planList = session.selectList("test.getPlanByDogno", dogno);
		} finally {
			DBUtil.closeSession(session);
		}
		return planList;
	}
	//자원봉사 게시판에서 최신 글의 DTO 1개 가져옴
	public static VoluBoardDTO getLatestVolu() throws SQLException {
		SqlSession session = null;
		VoluBoardDTO vdto = null;
		try{
			session = DBUtil.getSqlSession();
			vdto = session.selectOne("voluboard.latestVolu");
		}finally{
			DBUtil.closeSession(session);
		}
		return vdto;
	}
	//펫도우미 게시판에서 최신 글의 DTO 1개 가져옴
	public static PtBoardDTO getLatestPt() throws SQLException {
		SqlSession session = null;
		PtBoardDTO pdto = null;
		try{
			session = DBUtil.getSqlSession();
			pdto = session.selectOne("ptboard.latestPt");
		}finally{
			DBUtil.closeSession(session);
		}
		return pdto;
	}
}
