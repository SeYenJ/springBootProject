package com.example.vo;

import java.util.Date;

public class CommentVO {
	
	private int comment_code;	//댓글 번호
	private int parent_num;		//글 번호
	private String writer;		//작성자
	private String comment;		//댓글 내용
	private Date comment_regdate;	//댓글 작성일
	private int comment_delete;		//댓글 삭제여부
	private int member_password;	//댓글 패스워드
	
	public int getComment_code() {
		return comment_code;
	}
	public void setComment_code(int comment_code) {
		this.comment_code = comment_code;
	}
	public int getParent_num() {
		return parent_num;
	}
	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public int getComment_delete() {
		return comment_delete;
	}
	public void setComment_delete(int comment_delete) {
		this.comment_delete = comment_delete;
	}

	@Override
	public String toString() {
		return "CommentVO [comment_code=" + comment_code + ", parent_num=" + parent_num + ", writer=" + writer
				+ ", comment=" + comment + ", comment_regdate=" + comment_regdate + ", comment_delete=" + comment_delete
				+ "]";
	}
	public int getMember_password() {
		return member_password;
	}
	public void setMember_password(int member_password) {
		this.member_password = member_password;
	}
	
	
	
}
