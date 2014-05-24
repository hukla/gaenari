package test;
/**
 * 작성: 2014.04.21
 * 작성 목적: 일기 게시판 이용
 * 작성 내용: BoardVo의 brdno, title, wrdate, content, userid, userno의 속성을 상속받고
 * 			  추가속성으로 기분(mood)를 선언한다.
 * 
 * @author 최성훈
 */
public class TestDiaryVo extends TestBoardVo {
	
	private String mood;
	
	public TestDiaryVo(){}
	public TestDiaryVo(int brdno, String title, String wrdate, String content, String userid, int userno, String mood){
		super(brdno, title, wrdate, content, userid, userno);
		this.mood = mood;
	}

	public String getMood() {
		return mood;
	}

	public void setMood(String mood) {
		this.mood = mood;
	}
	
	

}
