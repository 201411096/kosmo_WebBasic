package temp;

public class TempVO {
	private String id;
	private String password;
	private String name;
	private String tel;
	private String adr;

	public TempVO() {}
	public TempVO(String id, String password, String name, String tel, String adr) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.tel = tel;
		this.adr = adr;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAdr() {
		return adr;
	}
	public void setAdr(String adr) {
		this.adr = adr;
	}
}
