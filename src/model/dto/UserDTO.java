package model.dto;
/**
 * 작성: 2014.04.21
 * 작성 목적: User정보 관리
 * 작성 내용: id, pw, email, name, addr, userno, usertype 등을 입력, 수정 등,
 * 			  User의 정보를 관리할 수 있다.
 * 
 * @author 최성훈
 * 
 * 수정 2014-05-24(재희)
 * point 추가
 * 
 * 수정: 2014-05-24, 최성훈
 * 내용: 회원가입을 위한 생성자 추가
 */
public class UserDTO {
	
	private String userid;
	
	private String passwd;
	private String email;
	private String username;
	private String address;
	private int userno;
	private int usertype;
	private int point; 
	
	public UserDTO(){}
	public UserDTO(String userid, String passwd, String email, 
			String username, String address, int userno, int usertype){
		this.userid = userid;
		this.passwd = passwd;
		this.email = email;
		this.username = username;
		this.address = address;
		this.userno = userno;
		this.usertype = usertype;
	}
	//14-05-24 성훈추가: 회원가입위한 userDTO 생성자 추가
	public UserDTO(String userid, String passwd, String email, String username, String address,int usertype){
		this.userid = userid;
		this.passwd = passwd;
		this.email = email;
		this.username = username;
		this.address = address;
		this.usertype = usertype;
	}
	public UserDTO(String userid, String passwd){
		this.userid = userid;
		this.passwd = passwd;
	}
	public UserDTO(int userno){
		this.userno = userno;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getUsertype() {
		return usertype;
	}
	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "UserDTO [userid=" + userid + ", passwd=" + passwd + ", email="
				+ email + ", username=" + username + ", address=" + address
				+ ", userno=" + userno + ", usertype=" + usertype + ", point=" + point + "]";
	}

}
