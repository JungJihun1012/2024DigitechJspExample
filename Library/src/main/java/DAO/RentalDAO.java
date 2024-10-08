package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import VO.MemberVO;
import VO.RentalVO;
import utill.DBConnection;

public class RentalDAO {
	Connection conn = DBConnection.getConnection();
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public int insertRent(RentalVO vo) {
		int result = 0;
		
		try {
			String sql = "INSERT INTO member_tbl_001 VALUES((SELECT NVL(MAX(cust_no), 100000)+1 cust_no FROM member_tbl_001), ?, ?, ?, ?, ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, rs.getString("rent_no"));
			
			result = stmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, stmt, conn);
		}
		return result;
	}
	
	public RentalVO getRent() {
		RentalVO rent = null;
		try {
			
			String sql = "select sysdate rent_ymd, sysdate+7 close_ymd, to_char(nvl(max(rent_no), 0) +1, 'fm00000') rent_no from rental_tbl_001 where rent_ymd = sysdate";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				rent = new RentalVO();
				rent.setRent_no(rs.getString("rent_no"));
				rent.setClose_ymd(rs.getString("close_ymd"));
				rent.setRent_ymd(rs.getString("rent_ymd"));
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, stmt, conn);
		}
		return rent;
		
	}
}
