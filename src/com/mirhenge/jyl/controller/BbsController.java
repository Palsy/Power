package com.mirhenge.jyl.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mirhenge.jyl.mboard.dao.JYLMBoardService;
import com.mirhenge.jyl.mboard.help.BbsParam;
import com.mirhenge.jyl.mboard.model.JYLMBoard;
import com.mirhenge.jyl.member.dao.JYLMemberService;
import com.mirhenge.jyl.member.model.JYLMember;

@Controller
public class BbsController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(BbsController.class);
	private int sumOfVote=0;
	@Autowired
	private JYLMBoardService jYLMBoardService;
	
	@Autowired
	private JYLMemberService jylMemberService;
	
	@RequestMapping(value = "bbslist.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String bbslist(BbsParam param,Model model) throws Exception {
		
		URL obj;
		try {
			obj = new URL("http://192.168.55.78:5100/trans");

			HttpURLConnection con = (HttpURLConnection)obj.openConnection();
			con.setRequestMethod("GET");
			logger.info("----- Restful Success :"+con.getResponseCode());
			con.disconnect();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info("Restful Error");
			e.printStackTrace();
		}

		
		logger.info("Welcome FintechBBSController bbslist! "+ new Date());
		
		int sn=param.getPageNumber();
		int start=(sn)*param.getRecordCountPerPage()+1;
		int end=(sn+1)*param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		logger.info("Welcome FintechBBSController param! "+ param);
		int totalRecordCount=
				jYLMBoardService.getBbsTotalCount(param);
		logger.info("Welcome FintechBBSController totalRecordCount! "+ totalRecordCount);
		List<JYLMBoard> bbslist=
				jYLMBoardService.getBbsPageList(param);
		logger.info("Welcome FintechBBSController bbslist! "+ bbslist.size());
		model.addAttribute("doc_title", "BBS 글목록");
		model.addAttribute("bbslist", bbslist);

		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		return "bbslist.tiles";
	}//
	@RequestMapping(value = "voting.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String voting(JYLMBoard mboard,String update_id, Model model) {
		logger.info("Welcome voting! "+ new Date());
		logger.info("Welcome voting! "+ update_id);
		JYLMBoard update_board = new JYLMBoard();
		update_board.setSeq(Integer.parseInt(update_id));
		logger.info("Welcome voting! "+ update_board.toString());
		
		jYLMBoardService.voteBbs(update_board);
		
		model.addAttribute("doc_title", "BBS 상세보기");
		model.addAttribute("bbs", 
				jYLMBoardService.getBbs(mboard));
		model.addAttribute("bbslist", 
				jYLMBoardService.getBbsList());
		return "bbsdetail.tiles";
	}//
	
	@RequestMapping(value = "votingEnd.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String votingEnd(JYLMBoard mboard,Model model) {
		logger.info("Welcome voting End! "+ new Date());
		
		int id = mboard.getSeq();
		sumOfVote = 0;
		jYLMBoardService.getBbsList().forEach((item)->{
			int sum=0;
			if(id == item.getParent())
			{
				sumOfVote += item.getVote();
			}
		});
		logger.info("Welcome voting End! "+ sumOfVote);

		jYLMBoardService.getBbsList().forEach((item)->{
			
			if(id == item.getParent())
			{
				logger.info("Welcome voting End! "+ item.getVote());
				logger.info("Welcome voting End! "+ sumOfVote);
				
				float coin=((float)item.getVote()/(float)sumOfVote)*100;
				
				logger.info("Welcome voting End! coin "+ coin);

				JYLMember member = new JYLMember();
				member.setId(item.getId());
				member.setCoin((int)coin);
				jylMemberService.updateCoin(member);
				logger.info("Welcome voting End! "+ member.toString());

			}
		});
		
		model.addAttribute("doc_title", "BBS 상세보기");
		model.addAttribute("bbs", 
				jYLMBoardService.getBbs(mboard));
		model.addAttribute("bbslist", 
				jYLMBoardService.getBbsList());
		return "bbsdetail.tiles";
	}
	
	@RequestMapping(value = "bbswrite.do", 
			method = RequestMethod.GET)
	public String bbswrite(Model model) {
		logger.info("Welcome BBSController bbswrite! "+ new Date());
		model.addAttribute("doc_title", "BBS 글쓰기");
		return "bbswrite.tiles";
	}//
	@RequestMapping(value = "bbswriteAf.do", 
			method = RequestMethod.POST)
	public String bbswriteAf(JYLMBoard bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbswriteAf! "+ new Date());
		logger.info("Welcome BBSController bbswriteAf! "+ bbs.toString());
		jYLMBoardService.writeBbs(bbs);
		return "redirect:/bbslist.do";
	}//
	@RequestMapping(value = "bbsdetail.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String bbsdetail(JYLMBoard mboard, Model model) {
		
		URL obj;
		try {
			obj = new URL("http://192.168.55.78:5100/trans");

			HttpURLConnection con = (HttpURLConnection)obj.openConnection();
			con.setRequestMethod("GET");
			logger.info("----- Restful Success :"+con.getResponseCode());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info("Restful Error");
			e.printStackTrace();
		}

		
		
		logger.info("Welcome BBSController bbsdetail! "+ new Date());
		model.addAttribute("doc_title", "BBS 상세보기");
		model.addAttribute("bbs", 
				jYLMBoardService.getBbs(mboard));
		model.addAttribute("bbslist", 
				jYLMBoardService.getBbsList());
		return "bbsdetail.tiles";
	}//
	@RequestMapping(value = "bbsreply.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String bbsreply(JYLMBoard mboard, Model model) {
		logger.info("Welcome BBSController bbsreply! "+ new Date());
		model.addAttribute("doc_title", "BBS 답글달기");
		model.addAttribute("bbs", 
				jYLMBoardService.getBbs(mboard));
		return "bbsreply.tiles";
	}//
	
	
		@RequestMapping(value = "bbsupdate.do", 
		method = {RequestMethod.GET,RequestMethod.POST})
public String bbsupdate(JYLMBoard mboard, Model model) {
	logger.info("Welcome BBSController bbsupdate! "+ new Date());
	logger.info("Welcome BBSController HKMBoard! "+ mboard);
	model.addAttribute("doc_title", "BBS 수정하기");
	model.addAttribute("bbs", 
			jYLMBoardService.getBbs(mboard));
	return "bbsupdate.tiles";
}//
	
	
	@RequestMapping(value = "bbsreplyAf.do", 
			method = {RequestMethod.GET,RequestMethod.POST})
	public String bbsreplyAf(JYLMBoard mboard, Model model) {
		logger.info("Welcome BBSController bbsreplyAf! "+ new Date());
	
		boolean isS=false;
		try {
			jYLMBoardService.reply(mboard);
			isS=true;
		} catch (Exception e) {
		}
		if(isS){
			return "redirect:/bbslist.do";
		}else{
			return "redirect:/bbslist.do";
		}
	}//
	@RequestMapping(value = "bbsupdateAf.do", 
			method = RequestMethod.POST)
	public String bbsupdateAf(JYLMBoard bbs,Model model) throws Exception {
		logger.info("Welcome BBSController bbsupdateAf! "+ new Date());
		jYLMBoardService.updateBbs(bbs);
		return "redirect:/bbslist.do";
	}//
}
