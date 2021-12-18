package com.example.service;

import com.example.vo.ChartVO;

import java.util.List;

public interface ChartService {
    public List<ChartVO> getQuestionDataByCategory() throws Exception;
    public List<ChartVO> getQuestionDataByRank() throws Exception;
}
