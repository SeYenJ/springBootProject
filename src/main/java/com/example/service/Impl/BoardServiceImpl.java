package com.example.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.BoardMapper;
import com.example.service.BoardService;
import com.example.vo.CommentVO;
import com.example.vo.MemberVO;
import com.example.vo.PageMaker;
import com.example.vo.SearchVO;


@Service
public class BoardServiceImpl implements BoardService {
 
	@Autowired
    private BoardMapper boardDAO;
    

	@Override
	public Integer totalCount(PageMaker vo) throws Exception {
		return boardDAO.totalCount(vo);
	}
	@Override
	public Integer selectTotalCount(SearchVO vo) throws Exception {
		return boardDAO.selectTotalCount(vo);
	}
    	
    @Override
    public void  insertContent (MemberVO vo){
    	boardDAO.insertContent(vo);
    }
    
    @Override
    public List<MemberVO> listCriteria(PageMaker vo) throws Exception {
 
        return boardDAO.listCriteria(vo);
    }
    
    @Override
    public List<MemberVO> selectlist(SearchVO vo) throws Exception {
 
        return boardDAO.selectlist(vo);
    }
    
    @Override
    public List<MemberVO> selectContent(int num) throws Exception {
 
        return boardDAO.selectContent(num);
    }
    
    @Override
    public void  updateContent (MemberVO vo) throws Exception{
    	boardDAO.updateContent(vo);
    }
    
    @Override
    public void deleteContent (int num) throws Exception {
    	boardDAO.deleteContent(num);
    }
    @Override
    public void updateViews (int num) throws Exception {
    	boardDAO.updateViews(num);
    }
    @Override
    public List<CommentVO> selectComment(int num) throws Exception{
    	return boardDAO.selectComment(num);
    }   
    @Override
    public void insertComment(CommentVO vo){
    	boardDAO.insertComment(vo);
    }
    @Override
    public void deleteComment(CommentVO vo){
    	boardDAO.deleteComment(vo);
    }
    @Override 
    public int countComment(int num){
    	return boardDAO.countComment(num);
    }
    @Override    
    public int titleCheck(String title) throws Exception{
    	return boardDAO.titleCheck(title);
    }
    @Override 
    public int UpdateCheck(MemberVO vo) throws Exception{
    	return boardDAO.UpdateCheck(vo);
    }
    @Override 
    public int deleteCheck(CommentVO vo) throws Exception{
    	return boardDAO.deleteCheck(vo);
    }
    
}

