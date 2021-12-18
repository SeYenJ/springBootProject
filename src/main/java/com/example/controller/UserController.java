package com.example.controller;


import javax.servlet.http.HttpSession;

import com.example.service.Impl.MailServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.service.memberService;
import com.example.vo.MemberVO;


@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private memberService service;

	@Autowired
	private MailServiceImpl mailService;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() throws Exception {	
		return "/user/join";
	}
	
	@RequestMapping(value = "/insertMember", method = RequestMethod.POST)
	public String insertMember(MemberVO vo) throws Exception {
		service.insertMember(vo);

		// 회원가입 성공시 가입축하 메일 발송
		mailService.welcomeMailSend(vo);

		return "redirect:/board";
	}	
	
	/**
	* 아이디 찾기 페이지 
	*/
	@RequestMapping(value="/userhelp")
	public ModelAndView userhelp(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/userhelp");
		mav.addObject("member_id","find");
		return mav;
		
	}
	
	@RequestMapping(value="/idCheck")
	public ModelAndView idCheck(MemberVO vo){
		String member_id = service.idCheck(vo);
		System.out.println(member_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/userhelp");
		
		if (member_id == "" || member_id == null){
			mav.addObject("check","not");
		}else{
			mav.addObject("check","check");
			mav.addObject("member_id",member_id);
		}
		return mav;
		
	}
	
	/**
	* 로그인을 처리하는 부분 
	*/
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String login(MemberVO vo,HttpSession session) throws Exception {
		String returnURL ="";
		
		if (session.getAttribute("login") != null){
			//기존에 로그인이란 세션 값이 존재한다면
			session.removeAttribute("login");
		}
		//로그인이 성공한다면 MemberVO 객체를 반환
		MemberVO dto = service.login(vo);
		
		if (dto != null){
			session.setAttribute("login", dto);
			returnURL ="redirect:/board";
		}else{
			returnURL ="redirect:/";
		}
		
		return returnURL;
	}
	
	/**
	* 로그아웃 처리 부분
	*/
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session){
		service.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		
		return mav;
		
	}
	
	
}
