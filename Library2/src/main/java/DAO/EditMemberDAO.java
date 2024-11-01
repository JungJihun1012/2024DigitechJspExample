package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.MemberVO;
import utill.DBConnection;

public class EditMemberDAO {
	Connection conn = DBConnection.getConnection();
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public int getCustno() {
		int custno = 0;
		try {
			String sql = "select nvl(max(cust_no), 100000)+1 cust_no from member_tbl_001";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				custno = rs.getInt("cust_no");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBConnection.close(rs,stmt, conn);
		}
		return custno;
	}
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
			String sql = "select * from member_tbl_001 order by cust_no";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCust_no(rs.getInt("cust_no"));
				vo.setCust_name(rs.getString("cust_name"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoin_date(rs.getDate("join_date"));
				vo.setStat_fg(rs.getString("stat_fg"));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, stmt, conn);
		}
		return list;
	}
}
