package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.MemberMoneyVO;
import utill.DBCOnnection;

public class MoneyDAO {
	Connection conn = DBCOnnection.getConnection();
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	public ArrayList<MemberMoneyVO> getMoneyList() {
		ArrayList<MemberMoneyVO> list = new ArrayList<MemberMoneyVO>();
		
		try {
			String sql = "select mem.custno, custname, decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, sum(price) amount from money_tb1_02 mon, member_tb1_02 mem where mon.custno = mem.custno group by mem.custno, mem.custname, grade order by 4 desc";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				MemberMoneyVO vo = new MemberMoneyVO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setGrade(rs.getString("grade"));
				vo.setAmount(rs.getInt("amount"));
				
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
}
