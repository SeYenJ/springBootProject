package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.service.BoardService;
import com.example.vo.MemberVO;
import com.example.vo.PageMaker;



@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private static final String UPLOAD_PATH = "resources/images";

	@Autowired
	private BoardService service;
	
	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String main(Model model) throws Exception {
	   	           
        return "main";
	}

	@RequestMapping(value ="/board", method = RequestMethod.GET)
	public String home(HttpSession session,PageMaker vo,Model model) throws Exception {
		
		if(session.getAttribute("login") == null || session.getAttribute("login").toString().equals("")) {
			return "redirect:/";
		}
	    int listCount = service.totalCount(vo);
		
		List<MemberVO> memberList = service.listCriteria(vo);
	    PageMaker pageMaker = new PageMaker();
	   	    
	    pageMaker.setTotalCount(listCount);
	    pageMaker.page(vo);
	            
        model.addAttribute("memberList", memberList);      
        model.addAttribute("pageMarker", pageMaker);
        
        return "board/list";
	}
	
	@RequestMapping(value ="/board/content", method = RequestMethod.GET)
	public String content(HttpSession session, HttpServletRequest req) {
		if(session.getAttribute("login") == null || session.getAttribute("login").toString().equals("")) {
			return "redirect:/";
		}
		return "board/content";
	}
	
	@RequestMapping(value= "/board/titleCheck")
	@ResponseBody
	public Map<Object, Object> titleCheck(@RequestBody String title) throws Exception{
	
	int count = 0;
    Map<Object, Object> map = new HashMap<Object, Object>();
	count = service.titleCheck(title);
	map.put("cnt", count);
	
	return map;
	}
	
	@RequestMapping(value ="/board/insertContent", method = RequestMethod.POST)
	public String insertContent(MultipartHttpServletRequest request) throws Exception {
		MemberVO vo = new MemberVO();
		
		vo.setMember_id(request.getParameter("member_id"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		vo.setMember_password(request.getParameter("member_password"));
		
		MultipartFile mf = request.getFile("uploadfile"); 
		if(mf.getOriginalFilename() != null && !mf.getOriginalFilename().toString().equals("")) {
			UUID uuid = UUID.randomUUID();
		    String saveName = uuid + "_" + mf.getOriginalFilename();
		    String path = request.getSession().getServletContext().getRealPath("resources/images");  
			File uploadFile = new File(path +"//"+ saveName); 
			
			try{
				mf.transferTo(uploadFile); 
				
			} catch(IllegalStateException e){
				e.printStackTrace();
				
			} catch(IOException e){
				e.printStackTrace();
			}
			
			vo.setUploadfile(saveName);
		}else {
			
			vo.setUploadfile("");
		}
	    
		
					
		service.insertContent(vo); 
			    
		return "redirect:/board";
	}

	@RequestMapping(value="/board/view", method=RequestMethod.GET)
	public ModelAndView view(HttpSession session,@RequestParam int board_num) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("login") == null || session.getAttribute("login").toString().equals("")) {
			mav.setViewName("redirect:/");
		}else {
			service.updateViews(board_num);
			
			mav.setViewName("/board/view");
			mav.addObject("dto",service.selectContent(board_num));
			mav.addObject("board_num",board_num);
			mav.addObject("C_dto",service.selectComment(board_num));
			mav.addObject("count",service.countComment(board_num));
		}
		return mav;
	}
		
	@RequestMapping(value="/board/delete", method=RequestMethod.GET)
	public String delete(@RequestParam int board_num)throws Exception {
		service.deleteContent(board_num);
		
		return "redirect:/board";
	}
	
	@RequestMapping(value="/board/updatPage", method=RequestMethod.GET)
	public ModelAndView viewUpdate(@RequestParam int board_num,Model model) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/updateView");
		mav.addObject("dto",service.selectContent(board_num));
		
		return mav;
	}
	
	@RequestMapping(value= "/board/UpdateCheck")
	@ResponseBody
	public Map<Object, Object> UpdateCheck(MemberVO vo) throws Exception{
	int count = 0;
	
    Map<Object, Object> map = new HashMap<Object, Object>();    
	count = service.UpdateCheck(vo);	
	if(count >0){
		service.updateContent(vo);
	}
	map.put("cnt", count);
	
	return map;
			
	}

}
	

