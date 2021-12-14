package com.example.service;

import java.util.List;

import com.example.vo.CommentVO;
import com.example.vo.MemberVO;
import com.example.vo.PageMaker;
import com.example.vo.SearchVO;

 
public interface BoardService {
	
	
	public Integer totalCount(PageMaker vo) throws Exception;
	
	public Integer selectTotalCount(SearchVO vo) throws Exception;
	  
	public void insertContent(MemberVO vo);
	
	public List<MemberVO> listCriteria(PageMaker vo) throws Exception;
	
    public List<MemberVO> selectlist(SearchVO vo) throws Exception;
    
    public List<MemberVO> selectContent(int num) throws Exception;
    
    public void updateContent(MemberVO vo)throws Exception;
    
    public void deleteContent(int num)throws Exception;
    
    public void updateViews(int num)throws Exception;
    
    public List<CommentVO> selectComment(int num) throws Exception;
    
    public void insertComment(CommentVO vo);
    
    public void deleteComment(CommentVO vo);
    
    public int countComment(int num);
    
    public int titleCheck(String title) throws Exception;
    
    public int UpdateCheck(MemberVO vo) throws Exception;
    
    public int deleteCheck(CommentVO vo) throws Exception;
    
    

}
