package com.example.mapper;

import com.example.vo.MemberVO;
 
public interface MemberMapper {
	
	public void insertMember(MemberVO vo);
	
	public MemberVO login(MemberVO vo);
	
	public MemberVO viewMember(MemberVO vo);

    public String idCheck(MemberVO vo);

}

