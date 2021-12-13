package com.example.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper.MainMapper;
import com.example.service.mainService;

@Service
public class mainServiceImpl implements mainService{

	@Autowired
	 MainMapper mainMapper;
	 
	@Override
	public String test() {
		return mainMapper.test();
	}
}
