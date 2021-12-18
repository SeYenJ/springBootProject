package com.example.controller;

import com.example.service.ChartService;
import com.example.vo.ChartVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value ="/chart")
public class ChartController {

    private static final Logger logger = LoggerFactory.getLogger(ChartController.class);

    @Autowired
    private ChartService chartService;

    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) throws Exception {

        return "chart/view";

    }

    // 카테고리 별 질문 개수
    @ResponseBody
    @RequestMapping(value = "/category", method = RequestMethod.GET)
    public Map<String, ArrayList<String>> getQuestionDataByCategory() throws Exception{

        ArrayList<String> labels = new ArrayList<>();
        ArrayList<String> data = new ArrayList<>();
        List<ChartVO> list = chartService.getQuestionDataByCategory();
        for (ChartVO vo : list) {
            labels.add(vo.getLabel());
            data.add(vo.getData());
        }

        HashMap<String, ArrayList<String>> dataMap = new HashMap<>();
        dataMap.put("labels", labels);
        dataMap.put("data", data);

        return dataMap;
    }

    // 직급 별 질문 개수
    @ResponseBody
    @RequestMapping(value = "/rank", method = RequestMethod.GET)
    public Map<String, ArrayList<String>> getQuestionDataByRank() throws Exception{

        ArrayList<String> labels = new ArrayList<>();
        ArrayList<String> data = new ArrayList<>();
        List<ChartVO> list = chartService.getQuestionDataByRank();
        for (ChartVO vo : list) {
            labels.add(vo.getLabel());
            data.add(vo.getData());
        }

        HashMap<String, ArrayList<String>> dataMap = new HashMap<>();
        dataMap.put("labels", labels);
        dataMap.put("data", data);

        return dataMap;
    }

}
