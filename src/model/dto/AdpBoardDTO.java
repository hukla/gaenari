/**
 * 작성자 : 최성훈
 * 내용 : adpboardinfo 테이블에 해당하는 DTO
 * 
 * 수정 :
 * 2014-04-22 21:32 장재희
 * -> BoardDTO 상속하는 걸로 변경
 * -> toString() 추가
 * 
 * 수정:
 * 2014-06-06 12:17 이수진
 * -> adpdoginfo 삭제
 */
package model.dto;

public class AdpBoardDTO extends BoardDTO {
	private int abrdno;

	public AdpBoardDTO() {}
	public AdpBoardDTO(int brdno) {
		super(brdno);
	}
	
	public int getAbrdno() {
		return abrdno;
	}
	public void setAbrdno(int abrdno) {
		this.abrdno = abrdno;
	}
	@Override
	public String toString() {
		return super.toString()+"\nAdpBoardDTO [abrdno=" + abrdno + "]";
	}
	
}
