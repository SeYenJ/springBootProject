package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.service.BoardService;
import com.example.vo.CommentVO;


@Controller
@RequestMapping(value ="/board")
public class CommentController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
    private BoardService service;

	/**
	* 해당 게시물 댓글 입력
	* 
	*/
	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	public String insertComment(@RequestParam int board_num, CommentVO vo, Model model) throws Exception {
		
        service.insertComment(vo);     
        model.addAttribute("board_num",board_num);
        
        return "redirect:/board/view?board_num="+board_num;
	}
			
	/**
	* 게시물 패스워드 오류시 삭제 보류
	* , 맞다면 삭제
	*/
	@RequestMapping(value= "/deleteCheck")
	@ResponseBody
	public Map<Object, Object> deleteCheck(CommentVO vo) throws Exception{

	int count = 0;
	
    Map<Object, Object> map = new HashMap<Object, Object>();
	count = service.deleteCheck(vo);
	map.put("cnt", count);	
	
	if(count>0){
		 service.deleteComment(vo);
	}
	
	return map;
		
	}
}
	

