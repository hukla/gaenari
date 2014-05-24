package model.dto;

public class CommentDTO {
	private int cmtno;
	private String content;
	private String wrtdate;
	private String userid;
	private UserDTO userno;
	private UserDTO brdno;
	public int getCmtno() {
		return cmtno;
	}
	public void setCmtno(int cmtno) {
		this.cmtno = cmtno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrtdate() {
		return wrtdate;
	}
	public void setWrtdate(String wrtdate) {
		this.wrtdate = wrtdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public UserDTO getUserno() {
		return userno;
	}
	public void setUserno(UserDTO userno) {
		this.userno = userno;
	}
	public UserDTO getBrdno() {
		return brdno;
	}
	public void setBrdno(UserDTO brdno) {
		this.brdno = brdno;
	}
	
}
