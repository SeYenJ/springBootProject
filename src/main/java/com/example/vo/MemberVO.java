package com.example.vo;

import java.util.Date;

public class MemberVO {
	
	 private Integer board_num;
	 private String member_dprtm;
	 private String member_rank;
	 private String member_id;
	 private String type;
	 private String title;
	 private String content;
	 private Integer views;
	 private String member_password;
	 private String member_name;
	 private String uploadfile;
	 private Date board_regdate;
	 private String member_email;
	 private int c_num;
	 
	 
	 
	public String getMember_dprtm() {
		return member_dprtm;
	}
	public void setMember_dprtm(String member_dprtm) {
		this.member_dprtm = member_dprtm;
	}
	public String getMember_rank() {
		return member_rank;
	}
	public void setMember_rank(String member_rank) {
		this.member_rank = member_rank;
	}
	public Integer getBoard_num() {
		return board_num;
	}
	public void setBoard_num(Integer board_num) {
		this.board_num = board_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(String uploadfile) {
		this.uploadfile = uploadfile;
	}
	public Date getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	
	@Override
	public String toString() {
		return "MemberVO [board_num=" + board_num + ", member_id=" + member_id + ", type=" + type + ", title=" + title
				+ ", content=" + content + ", views=" + views + ", member_password=" + member_password
				+ ", member_name=" + member_name + ", uploadfile=" + uploadfile + ", board_regdate=" + board_regdate
				+ ", member_email=" + member_email + ", c_num=" + c_num + "]";
	}
	 	 
	 

}
