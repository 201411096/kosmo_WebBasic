package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TempDAO {
	// 연결 객체 생성시 필요한 변수 선언
	String url;
	String user;
	String pass;
	/* Thread safe lazy initialization + Double-checkd locking */	
	private volatile static TempDAO instance;
	
	public static TempDAO getInstance() throws ClassNotFoundException {
		if(instance==null) {
			synchronized(TempDAO.class) {
				if(instance==null) {
					instance = new TempDAO();
				}
			}
		}
		return instance;		
	}
	
	private TempDAO() throws ClassNotFoundException {
		//1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		url = "jdbc:oracle:thin:@192.168.0.18:1521:orcl";
		user = "scott";
		pass = "tiger";		
	}
	
	public void insert(TempVO vo) {
		// 2. Connection 연결객체 얻어오기
		Connection con = null;
		try {
			con = DriverManager.getConnection(url, user, pass);
			// 3. sql 문장 만들기
			String sql = "INSERT INTO TEMP2(id, password, name, tel, addr) VALUES(?, ?, ?, ?, ?)";
			// 4. sql 전송객체 (PreparedStatement)
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPassword());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getTel());
			ps.setString(5, vo.getAdr());
			// 5. sql 전송
			int result = ps.executeUpdate();
			// 6. 닫기 
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				// 6. 닫기 
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//insert 종료
	public boolean login(TempVO vo) {
		// 2. Connection 연결객체 얻어오기
		boolean check = false;
		Connection con = null;
		String getPassword = null;
		try {
			con = DriverManager.getConnection(url, user, pass);
			// 3. sql 문장 만들기
			String sql = "SELECT password from TEMP2 where id = ?";
			// 4. sql 전송객체 (PreparedStatement)
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			// 5. sql 전송
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				getPassword = rs.getString("password");
			}
			if(vo.getPassword().equals(getPassword)) {
				check=true;
			}
			
			// 6. 닫기 
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				// 6. 닫기 
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check;
	}//login 종료
	public int login2(TempVO vo) {
		// 2. Connection 연결객체 얻어오기
		int check = 0; // 0이면 아이디 존재x 1이면 틀림 2이면 맞음
		Connection con = null;
		String getPassword = null;
		try {
			con = DriverManager.getConnection(url, user, pass);
			// 3. sql 문장 만들기
			String sql = "SELECT password from TEMP2 where id = ?";
			// 4. sql 전송객체 (PreparedStatement)
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			// 5. sql 전송
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				getPassword = rs.getString("password");
			}
			if(vo.getPassword().equals(getPassword)) {
				check=2;
			}else if(getPassword=="" || getPassword==null){
				check=0;
			}else {
				check=1;
			}
			
			// 6. 닫기 
			ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				// 6. 닫기 
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check;
	}//login 종료
}
