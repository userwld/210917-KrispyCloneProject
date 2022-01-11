package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
private Connection con;
	
	public MemberDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="oracle", password="oracle";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void insert(MemberDTO dto) {
		String sql = "insert into promember values(promember_seq.nextval,?,?,?,?,?,?,?)";
		PreparedStatement ps = null; 
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getPw());
			ps.setString(4, dto.getPwQuestion());
			ps.setString(5, dto.getPwAnswer());
			ps.setString(6, dto.getAddress());
			ps.setString(7, dto.getMobile());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
		}
	}
	
	public MemberDTO selectEmail(String email) {
		String sql = "select * from promember where email = ?";
		PreparedStatement ps = null; ResultSet rs = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,email);
			rs = ps.executeQuery();
			if(rs.next()) {
				MemberDTO dto = new MemberDTO(rs.getString("name"), 
						rs.getString("email"), rs.getString("pw"), 
						rs.getString("pwQuestion"), rs.getString("pwAnswer"), rs.getString("address"), rs.getString("mobile"));				
						dto.setNum(rs.getInt("num"));
				return dto;		
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(rs != null) try { rs.close(); } catch(Exception e) {}
		}
		return null;
	}
	
	
	public void update(MemberDTO dto) {
		String sql = "update promember set pw=?, pwQuestion=?, pwAnswer=?, address=?, mobile=? where email=?";
		PreparedStatement ps = null; 
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,dto.getPw());
			ps.setString(2,dto.getPwQuestion());
			ps.setString(3,dto.getPwAnswer());
			ps.setString(4,dto.getAddress());
			ps.setString(5,dto.getMobile());
			ps.setString(6,dto.getEmail());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
		}

	}
	
	public void delete(MemberDTO dto) {
		String sql = "delete from promember where email=?";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,dto.getEmail());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
		}
		
	}
	
	
	
}
