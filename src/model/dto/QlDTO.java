package model.dto;

public class QlDTO {
	
	private UserDTO userno;
	private String job;
	private String resstyle;
	private String lifestyle;
	private String family;
	private String personality;
	
	public QlDTO(){}

	public UserDTO getUserno() {
		return userno;
	}

	public void setUserno(UserDTO userno) {
		this.userno = userno;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getResstyle() {
		return resstyle;
	}

	public void setResstyle(String resstyle) {
		this.resstyle = resstyle;
	}

	public String getLifestyle() {
		return lifestyle;
	}

	public void setLifestyle(String lifestyle) {
		this.lifestyle = lifestyle;
	}

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	public String getPersonality() {
		return personality;
	}

	public void setPersonality(String personality) {
		this.personality = personality;
	}

}
