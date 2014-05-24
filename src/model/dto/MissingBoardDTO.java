/**
 * 작성자 : 최성훈
 * 내용 : mfboardinfo 테이블에 해당하는 DTO
 * 
 * 수정 :
 * 2014-04-22 21:32 장재희
 * -> BoardDTO 상속하는 걸로 변경
 * -> toString() 추가
 * 
 * 수정 :
 * 2014-05-24 12:16 이수진
 * -> missingBoardDTO와 findingBoardDTO로 분리
 */
package model.dto;

public class MissingBoardDTO extends BoardDTO {
	private int mfbrdno;
	private String mfloc;
	private String mfdoginfo;
	private char mftype;
	
	public int getMfbrdno() {
		return mfbrdno;
	}
	public void setMfbrdno(int mfbrdno) {
		this.mfbrdno = mfbrdno;
	}
	public String getMfloc() {
		return mfloc;
	}
	public void setMfloc(String mfloc) {
		this.mfloc = mfloc;
	}
	public String getMfdoginfo() {
		return mfdoginfo;
	}
	public void setMfdoginfo(String mfdoginfo) {
		this.mfdoginfo = mfdoginfo;
	}
	public char getMftype() {
		return mftype;
	}
	public void setMftype(char mftype) {
		this.mftype = mftype;
	}
	@Override
	public String toString() {
		return super.toString()+"\nMfBoardDTO [mfbrdno=" + mfbrdno + ", mfloc=" + mfloc
				+ ", mfdoginfo=" + mfdoginfo + ", mftype=" + mftype + "]";
	}
	
	
}
