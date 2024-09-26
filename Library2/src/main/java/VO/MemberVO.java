package VO;

import java.sql.Date;

public class MemberVO {
	private int cust_no;
	private String cust_name;
	private String phone;
	private String address;
	private Date join_date;
	private String stat_fg;
	public int getCust_no() {
		return cust_no;
	}
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getStat_fg() {
		return stat_fg;
	}
	public void setStat_fg(String stat_fg) {
		this.stat_fg = stat_fg;
	}
}
