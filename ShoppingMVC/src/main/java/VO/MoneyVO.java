package VO;

import java.sql.Date;

public class MoneyVO {
	private String custno;
	private String saleno1;
	private String post;
	private String amount;
	private String price;
	private String pcode;
	private Date sdate;
	public String getCustno() {
		return custno;
	}
	public void setCustno(String custno) {
		this.custno = custno;
	}
	public String getSaleno1() {
		return saleno1;
	}
	public void setSaleno1(String saleno1) {
		this.saleno1 = saleno1;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
}
