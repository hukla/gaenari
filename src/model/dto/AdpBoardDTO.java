/**
 * 작성자 : 최성훈
 * 내용 : adpboardinfo 테이블에 해당하는 DTO
 * 
 * 수정 :
 * 2014-04-22 21:32 장재희
 * -> BoardDTO 상속하는 걸로 변경
 * -> toString() 추가
 */
package model.dto;

public class AdpBoardDTO extends BoardDTO {
	private String abrdno;
	private String adpdoginfo;
	
	public String getAbrdno() {
		return abrdno;
	}
	public void setAbrdno(String abrdno) {
		this.abrdno = abrdno;
	}
	public String getAdpdoginfo() {
		return adpdoginfo;
	}
	public void setAdpdoginfo(String adpdoginfo) {
		this.adpdoginfo = adpdoginfo;
	}
	@Override
	public String toString() {
		return super.toString()+"\nAdpBoardDTO [abrdno=" + abrdno + ", adpdoginfo=" + adpdoginfo
				+ "]";
	}
	
}
