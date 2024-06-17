package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import utill.DBConnection;

public class CalenderDAO {
	Connection conn = DBConnection.getConnection();
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public Date getJoin() {
		Date join = null;
		try {
			String sql = "select nvl(to_char(max(join_date), 'YYYYMMDD'), '20240101') as join_date from member_tbl_001";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			if(rs.next()) {
				String joinDateStr = rs.getString("join_date");
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
				java.util.Date utilDate = format.parse(joinDateStr);
				join = new Date(utilDate.getTime());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, stmt, conn);
		}
		
		return join;
	}
}
