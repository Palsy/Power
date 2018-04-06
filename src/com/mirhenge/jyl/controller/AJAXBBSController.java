package com.mirhenge.jyl.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mirhenge.jyl.mboard.dao.JYLMBoardService;

@Controller
public class AJAXBBSController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private JYLMBoardService jYLMBoardService;

	@RequestMapping(value="boardAjax.do",method=RequestMethod.GET)
	public void ajaxlist(HttpServletRequest req, HttpServletResponse res) throws IOException {

		logger.info("ajaxxxxxxxxxxxxxxxxxxxxxx ");
	}
	
}
