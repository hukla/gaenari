package model.dto;

public class DogDTO {
	private int dogno;
	private String dogname;
	private int dogage;
	private String dogkind;
	private UserDTO userdto; //UserDTO에서 int로 수정
	
	public DogDTO(){}
	public DogDTO(int dogno, String dogname, int dogage, String dogkind, UserDTO userdto){
		this.dogage = dogage;
		this.dogkind = dogkind;
		this.dogname = dogname;
		this.userdto = userdto;
		this.dogno = dogno;
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
	public void setDogking(String dogkind) {
		this.dogkind = dogkind;
	}
	public UserDTO getUserdto() {
		return userdto;
	}
	public void setUserdto(UserDTO userdto) {
		this.userdto = userdto;
	}
}