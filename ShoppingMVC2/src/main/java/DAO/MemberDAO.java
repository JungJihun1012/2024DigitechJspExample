package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.MemberVO;
import utill.DBCOnnection;

public class MemberDAO {
	Connection conn = DBCOnnection.getConnection();
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
			String sql = "select * from member_tb1_02 order by custno";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setAddress(rs.getString("address"));
				vo.setCity(rs.getString("city"));
				vo.setGrade(rs.getString("grade"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setPhone(rs.getString("phone"));
			
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBCOnnection.close(rs, stmt, conn);
		}
		
		return list;
	}
	
	public int insertMember(MemberVO vo ) {
		int result = 0;
		try {
			String sql = "INSERT INTO member_tb1_02 VALUES ((SELECT NVL(MAX(custno), 100000)+1 custno FROM member_tb1_02), ?, ?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, vo.getCustname());
			stmt.setString(2, vo.getPhone());
			stmt.setString(3, vo.getAddress());
			stmt.setDate(4, vo.getJoindate());
			stmt.setString(5, vo.getGrade());
			stmt.setString(6, vo.getCity());
			
			result = stmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBCOnnection.close(rs, stmt, conn);
		}
		return result;
	}
	
	
	public int getCustno() {
		int custno = 0;
		try {
			String sql = "select nvl(max(custno), 100000)+1 custno from member_tb1_02";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				custno = rs.getInt("custno");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBCOnnection.close(rs,stmt, conn);
		}
		
		return custno;
	}
}
