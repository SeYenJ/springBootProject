package com.example.service.Impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.MemberMapper;
import com.example.service.memberService;
import com.example.vo.MemberVO;

@Service
public class memberServiceImpl implements memberService {
 
	@Autowired
    private MemberMapper dao;
    //회원가입 처리
    @Override
    public void  insertMember (MemberVO vo){
    	dao.insertMember(vo);
    }
    
    //로그인 session 에 등록
   @Override
	public MemberVO login(MemberVO vo){
	 return dao.login(vo);
   }
   
   @Override
   public MemberVO viewMember (MemberVO vo){
	   return dao.viewMember(vo);
   }
   //로그아웃
   @Override
   public void logout(HttpSession session){
	   session.invalidate();
   }
   //아이디 찾기
   @Override
   public String idCheck(MemberVO vo){
	   return dao.idCheck(vo);
   }

}

