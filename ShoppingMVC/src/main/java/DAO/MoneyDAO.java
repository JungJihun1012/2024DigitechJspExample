package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import VO.MoneyVO;
import utill.DBConnection;

public class MoneyDAO {
	MoneyVO vo = null;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	public MoneyVO getMoney(String custno) {
		MoneyVO vo = new MoneyVO();
		
		try {
			conn = DBConnection.getConnection();
			String sql = "select max(custno)+1 custno from member_tbl_02";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				vo = new MoneyVO();
				vo.setCustno(rs.getString("custno"));
			}
			rs = stmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, stmt, conn);
		}
		return vo;
	}
}
