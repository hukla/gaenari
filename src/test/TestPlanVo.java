package test;
/**
 * 작성: 2014.04.21
 * 작성 목적: 일정 게시판 이용
 * 작성 내용: BoardVo의 brdno, title, wrdate, content, userid, userno의 속성을 상속받고
 * 			  추가속성으로 장소(loc)를 선언한다.
 * 			  
 * 
 * @author 최성훈
 */
public class TestPlanVo extends TestBoardVo{

	private String loc;
	
	public TestPlanVo(){}
	public TestPlanVo(int brdno, String title, String wrdate, String content, String userid, int userno, String loc){
		super(brdno,title,wrdate,content,userid,userno);
		this.loc = loc;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}
}
