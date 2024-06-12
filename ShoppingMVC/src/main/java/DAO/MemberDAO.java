package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import VO.MemberVO;
import utill.DBConnection;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public int MemberAction(MemberVO vo) {
		int result = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "insert into member_tbl_02 values((select max(custno)+1 from member_tbl_02),? ,?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, vo.getCustno());
			stmt.setString(2, vo.getCustname());
			stmt.setString(3, vo.getPhone());
			stmt.setString(4, vo.getAddress());
			stmt.setDate(5, vo.getJoindate());
			stmt.setString(6, vo.getGrade());
			stmt.setString(7, vo.getCity());
			
			result = stmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	
}
