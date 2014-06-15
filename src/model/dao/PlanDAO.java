package model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import model.dto.BoardDTO;
import model.dto.PlanDTO;
import model.dto.UserDTO;

import org.apache.ibatis.session.SqlSession;

import util.DBUtil;

public class PlanDAO {
	
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
	
	
	//14-05-14 성훈 추가: brdno를 통한 일정검색, planDTO반환 [OnePlanAction에서 사용]
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
	
	//14-05-22 성훈추가: 전체 일정에 대한 페이지 번호수 가져오기 [일정페이지에서 사용]
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
	
	//14-05-22 성훈추가: 페이지 번호에 해당하는 일정 10개단위로 가져오기 [일정페이지에서 사용]
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
	
	//14-05-23 성훈추가: 날짜로 일정 검색해오기 [CalendarAction에서 사용]
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
	
	//PlanDTO의 일정 내용을 delete
	public static void deletePlan(int brdno) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			result = session.insert("delete.deletePlan", brdno) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result) throw new SQLException("일정 삭제에 실패했습니다.");
	}
	
	//BoardDTO의 일정 내용을 update
	public static void updatePlanBoard(BoardDTO boardDTO) throws SQLException {

		SqlSession session = null;
		boolean result = false;
		try {
			session = DBUtil.getSqlSession();
			result = session.update("update.updatePlanBoard", boardDTO) > 0 ? true : false;
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
			result = session.insert("update.updatePlan", planDTO) > 0 ? true : false;
		} finally {
			DBUtil.closeSession(session, result);
		}
		if(!result) throw new SQLException("일정 수정에 실패했습니다.");
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

	//플랜 보드내용 입력 후 입력된 brdno를 반환하기(insert 후 select)
	public static int insertPlanBoard(BoardDTO boardDTO) throws SQLException{
		
		SqlSession session = null;
		boolean result = false;
		int brdno = 0;
		try{
			session = DBUtil.getSqlSession();
			result = session.insert("insert.insertPlanBoard",boardDTO)>0 ? true:false;
			brdno = session.selectOne("test.selectBoard", boardDTO);
		}finally{
			DBUtil.closeSession(session, result);
		}
		if(!result || brdno==0){
			throw new SQLException("일정보드 입력실패!");
		}
		return brdno;
	}
	
	//일정 내용 입력하기
	public static void insertPlan(PlanDTO planDTO) throws SQLException{
		
		SqlSession session = null;
		boolean result = false;
		try{
			session = DBUtil.getSqlSession();
			result = session.insert("insert.insertPlan",planDTO)>0 ? true:false;
		}finally{
			DBUtil.closeSession(session, result);
		}
		if(!result)	throw new SQLException("일정 등록에 실패했습니다.");
	}
	
}
