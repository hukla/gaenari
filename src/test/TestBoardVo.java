package test;

/**
 * 작성: 2014.04.21
 * 작성 목적: 모든 게시판의 참조클래스
 * 작성 내용: 모든 게시판의 클래스가 extends하도록 공통적인 속성을 선언함.
 * 			  BoardVo의 속성 외의 속성이 필요한 클래스는 BoardVo를 상속받아 이용하고
 * 			  필요에 따라 속성을 추가한다.
 * 			  
 * 
 * @author 최성훈
 */
public class TestBoardVo {
	
	private String content;
	private String userid;
	private int brdno;
	private String title;
	private String wrdate;
	private String loc;
	private int userno;
	
	public TestBoardVo(){}
	public TestBoardVo(int brdno, String title, String wrdate, String content, String userid, int userno,String loc){
		
		this.content = content;
		this.userid = userid;
		this.brdno = brdno;
		this.title = title;
		this.wrdate = wrdate;
		this.userno = userno;
		this.loc = loc;
	}
	
	public TestBoardVo(int brdno,String title, String wrdate, String content, String userid, int userno){
		this.title = title;
		this.brdno = brdno;
		this.wrdate = wrdate;
		this.content = content;
		this.userid = userid;
		this.userno = userno;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getBrdno() {
		return brdno;
	}
	public void setBrdno(int brdno) {
		this.brdno = brdno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWrdate() {
		return wrdate;
	}
	public void setWrdate(String wrdate) {
		this.wrdate = wrdate;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}
