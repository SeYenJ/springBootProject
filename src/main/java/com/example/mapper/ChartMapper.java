package com.example.mapper;

import com.example.vo.ChartVO;
import java.util.List;

public interface ChartMapper {
    public List<ChartVO> getQuestionDataByCategory() throws Exception;
    public List<ChartVO> getQuestionDataByRank() throws Exception;
}
