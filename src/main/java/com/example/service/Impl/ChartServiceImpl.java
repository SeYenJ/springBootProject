package com.example.service.Impl;

import com.example.mapper.ChartMapper;
import com.example.service.ChartService;
import com.example.vo.ChartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChartServiceImpl implements ChartService {

    @Autowired
    private ChartMapper chartDAO;

    @Override
    public List<ChartVO> getQuestionDataByCategory() throws Exception {
        return chartDAO.getQuestionDataByCategory();
    }

    @Override
    public List<ChartVO> getQuestionDataByRank() throws Exception {
        return chartDAO.getQuestionDataByRank();
    }
}
