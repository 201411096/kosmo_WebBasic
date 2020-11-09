package user;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
//import com.sun.corba.se.pept.transport.Connection;

public class UserDAO {
	
	private Connection conn; // 데이터베이스에 접근하는 객체
	private PreparedStatement pstmt; 
	private ResultSet rs; // 정보를 담을 수 있는 객체
	
	public UserDAO()
	{
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword="dbpassword..";
			Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버 로딩
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public int login(String userID, String userPassword)
	{
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
				{
					return 1; // 로그인 성공
				}
				else
					return 0; // 비밀번호 불일치
			}
			return -1; //아이디 존재 x
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public int join(User user)
	{
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate(); //pstmt의 sql문을 실행
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // db오류
	}
}
