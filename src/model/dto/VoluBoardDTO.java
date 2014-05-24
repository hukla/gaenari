/**
 * 작성자 : 최성훈
 * 내용 : voluboardinfo 테이블에 해당하는 DTO
 * 
 * 수정 :
 * 2014-04-22 21:32 장재희
 * -> BoardDTO 상속하는 걸로 변경
 * -> toString() 추가
 */
package model.dto;

public class VoluBoardDTO extends BoardDTO {
	 
	private int vbrdno;
	private String vhour;

	public VoluBoardDTO(){}
	public VoluBoardDTO(String title, String brdcontent, String userid, String brdtype, String vhour) {
		super(brdcontent,null,userid,title,brdtype,0);
		this.vhour=vhour;
	}
	public VoluBoardDTO(String title, String brdcontent, String userid, String brdtype, String vhour, int vbrdno) {
		super(brdcontent,null,userid,title,brdtype,0);
		this.vbrdno=vbrdno;
		this.vhour=vhour;
	}
	public VoluBoardDTO(String title, String brdcontent, String vhour, int vbrdno, int brdno){
		super(brdno,brdcontent,null, title);//null은 wrdate
		this.vbrdno=vbrdno;
		this.vhour=vhour;
	}
	
	public int getVbrdno() {
		return vbrdno;
	}
	public void setVbrdno(int vbrdno) {
		this.vbrdno = vbrdno;
	}
	public String getVhour() {
		return vhour;
	}
	public void setVhour(String vhour) {
		this.vhour = vhour;
	}
	@Override
	public String toString() {
		return super.toString()+"\nVoluBoardDTO [vbrdno=" + vbrdno + ", vhour=" + vhour + "]";
	}
}
