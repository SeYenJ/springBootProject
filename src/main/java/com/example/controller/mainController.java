package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.service.mainService;

@Controller
public class mainController {
	@Autowired
	mainService service;
	@RequestMapping("/")
	public String home(Model model){
		String name = service.test();
		model.addAttribute("name",name);
		return "index";
	}

}
