/**
 * 작성자 : 최성훈
 * 내용 : diaryinfo 테이블에 해당하는 DTO
 * 
 * 수정 :
 * 2014-04-22 21:32 장재희
 * -> BoardDTO 상속하는 걸로 변경
 * -> toString() 추가
 */
package model.dto;

public class DiaryDTO extends BoardDTO {
	
	private int dbrdno;
	private String mood;
	
	public DiaryDTO(){}
	public DiaryDTO(int brdno, String mood){
		super.setBrdno(brdno);
		this.mood = mood;
	}
	public DiaryDTO(String wrdate,String title, String mood){
		super.setWrdate(wrdate);
		super.setTitle(title);
		this.mood = mood;
	}

	public int getDbrdno() {
		return dbrdno;
	}
	public void setDbrdno(int dbrdno) {
		this.dbrdno = dbrdno;
	}
	public String getMood() {
		return mood;
	}
	public void setMood(String mood) {
		this.mood = mood;
	}

	@Override
	public String toString() {
		return super.toString()+"\nDiaryDTO [dbrdno=" + dbrdno + ", mood=" + mood + "]";
	}
	
}
