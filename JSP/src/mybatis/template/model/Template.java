package mybatis.template.model;

public class Template {
	private int tempId;		//오라클 테이블 생성시 temp_id로 생성
	private int tempName;	//오라클 테이블 생성시 temp_name으로 생성
	public int getTempId() {
		return tempId;
	}
	public void setTempId(int tempId) {
		this.tempId = tempId;
	}
	public int getTempName() {
		return tempName;
	}
	public void setTempName(int tempName) {
		this.tempName = tempName;
	}
}
