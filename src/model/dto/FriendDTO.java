package model.dto;

public class FriendDTO {
	private UserDTO prmuser;
	private int subuser;
	
	public FriendDTO(){}

	public UserDTO getPrmuser() {
		return prmuser;
	}

	public void setPrmuser(UserDTO prmuser) {
		this.prmuser = prmuser;
	}

	public int getSubuser() {
		return subuser;
	}

	public void setSubuser(int subuser) {
		this.subuser = subuser;
	}
}
