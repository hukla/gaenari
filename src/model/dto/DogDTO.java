package model.dto;
/**
 * 작성: 프로젝트 시작
 * 작성자: 최성훈
 * 내용: 강아지정보DTO
 * 
 * 수정: 최성훈,2014-05-29
 * 내용: UserDTO상속받도록 수정
 */
public class DogDTO extends UserDTO{
	
	private int dogno;
	private String dogname;
	private int dogage;
	private String dogkind;
	private UserDTO userdto; //UserDTO에서 int로 수정
	private int userno;
	
	public DogDTO(){}
	/*public DogDTO(int dogno, String dogname, int dogage, String dogkind, UserDTO userdto){
		this.dogage = dogage;
		this.dogkind = dogkind;
		this.dogname = dogname;
		this.userdto = userdto;
		this.dogno = dogno;
	}*/
	public DogDTO(int dogno, String dogname, int dogage, String dogkind, int userno){
		this.dogage = dogage;
		this.dogkind = dogkind;
		this.dogname = dogname;
		this.userno = userno;
		this.dogno = dogno;
	}
	//14-05-27 성훈추가
	public DogDTO(String dogname, int dogage, String dogkind, int userno){
		this.dogage = dogage;
		this.dogkind = dogkind;
		this.dogname = dogname;
		this.userno = userno;
	}
	public DogDTO(UserDTO userdto){
		this.userdto = userdto;
	}
	public int getDogno() {
		return dogno;
	}
	public void setDogno(int dogno) {
		this.dogno = dogno;
	}
	public String getDogname() {
		return dogname;
	}
	public void setDogname(String dogname) {
		this.dogname = dogname;
	}
	public int getDogage() {
		return dogage;
	}
	public void setDogage(int dogage) {
		this.dogage = dogage;
	}
	public String getDogkind() {
		return dogkind;
	}
	public void setDogkind(String dogkind) {
		this.dogkind = dogkind;
	}
	public UserDTO getUserdto() {
		return userdto;
	}
	public void setUserdto(UserDTO userdto) {
		this.userdto = userdto;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("DogDTO [dogno=").append(dogno).append(", dogname=")
				.append(dogname).append(", dogage=").append(dogage)
				.append(", dogkind=").append(dogkind).append(", userdto=")
				.append(userdto).append(", userno=").append(userno).append("]");
		return builder.toString();
	}
	
}