package com.example.service;

import javax.servlet.http.HttpSession;

import com.example.vo.MemberVO;
 
public interface memberService {
    
	public void insertMember(MemberVO vo);
	
	public MemberVO login(MemberVO vo);
	
	public MemberVO viewMember(MemberVO vo);
	
	public void logout(HttpSession session);
	
	public String idCheck(MemberVO vo);		
	

}
