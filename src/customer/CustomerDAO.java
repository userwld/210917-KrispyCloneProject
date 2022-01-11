package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CustomerDAO {
	
private Connection con;
	
	public CustomerDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="oracle", password="oracle";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	

	public void insert(CustomerDTO dto) {
		String sql = "insert into customer values(customer_seq.nextval,?,?,?,0,?,?,?,?)";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,dto.getSub());
			ps.setString(2, dto.getTitle());
			ps.setString(3,dto.getWriter());
			ps.setString(4,dto.getRegDate());
			ps.setString(5,dto.getContent());
			ps.setString(6, dto.getFileName());
			ps.setString(7,dto.getEmail());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
		}
	}
	
	public ArrayList<CustomerDTO> selectAll() {
		String sql = "select * from customer order by num desc";
		ArrayList<CustomerDTO> all = new ArrayList<CustomerDTO>();
		PreparedStatement ps = null; ResultSet rs = null;
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				CustomerDTO dto = new CustomerDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSub(rs.getString("sub"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setContent(rs.getString("content"));
				dto.setFileName(rs.getString("fileName"));
				dto.setEmail(rs.getString("email"));
				all.add(dto);
			}
			return all;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(rs != null) try { rs.close(); } catch(Exception e) {}
		}
		return null;
	}
	public void updateHit(int num) {
		String sql = "update customer set hit=hit+1 where num = ?";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
		}
	}
	
	public CustomerDTO selectNum(int num) {
		String sql = "select * from customer where num = ?";
		PreparedStatement ps = null; ResultSet rs = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1,num);
			rs = ps.executeQuery();
			if(rs.next()) {
				CustomerDTO dto = new CustomerDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSub(rs.getString("sub"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setContent(rs.getString("content"));
				dto.setFileName(rs.getString("fileName"));
				dto.setEmail(rs.getString("email"));
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
		
	
	public ArrayList<CustomerDTO> search(String condition, String data) {
		data = "%"+data+"%";
		String sql = "select * from customer where title like ?";
		
		if(condition.equals("content")) {
			sql = "select * from customer where content like ?";
		}else if(condition.equals("writer")) {
			sql = "select * from customer where writer like ?";
		}

		ArrayList<CustomerDTO> find = new ArrayList<CustomerDTO>();
		PreparedStatement ps = null; ResultSet rs = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,data);
			rs = ps.executeQuery();
			while(rs.next()) {
				CustomerDTO dto = new CustomerDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSub(rs.getString("sub"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setHit(rs.getInt("hit"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setContent(rs.getString("content"));
				dto.setFileName(rs.getString("fileName"));
				dto.setEmail(rs.getString("email"));
				find.add(dto);
			}
			return find;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(rs != null) try { rs.close(); } catch(Exception e) {}
		}
		return null;
	}
	
	public void modify(CustomerDTO dto) {
		String sql = "update customer set sub=?, title =?, content=? where num =?";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,dto.getSub());
			ps.setString(2,dto.getTitle());
			ps.setString(3,dto.getContent());
			ps.setInt(4,dto.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
		}

	}
	public void modifyUpFile(String fileName, int num) {
		String sql = "update customer set filename = ? where num =?";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,fileName);
			ps.setInt(2,num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
		}

	}
	
	public void delete(int num) {
		String sql = "delete from customer where num = ?";
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1,num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) try { ps.close(); } catch(Exception e) {}
		}
	}
	
	
	
	
}
