package com.kh.finalteam1.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.service.PayService;
import com.kh.finalteam1.vo.KakaoPayApprovePrepareVO;
import com.kh.finalteam1.vo.KakaoPayApproveVO;
import com.kh.finalteam1.vo.KakaoPayReadyPrepareVO;
import com.kh.finalteam1.vo.KakaoPayReadyVO;
import com.kh.finalteam1.vo.KakaoPaySearchVO;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService payService;

	@GetMapping("/confirm")
	public String confirm() {
		return "pay/confirm";
	}
	
	@PostMapping("/confirm")
	public String confirm(
			HttpSession session,
			@ModelAttribute KakaoPayReadyPrepareVO prepareVO) throws URISyntaxException {
		
		KakaoPayReadyVO readyVO = payService.ready(prepareVO);
		
		session.setAttribute("partner_order_id", prepareVO.getPartner_order_id());
		session.setAttribute("partner_user_id", prepareVO.getPartner_user_id());
		session.setAttribute("tid", readyVO.getTid());
		
		return "redirect:"+readyVO.getNext_redirect_pc_url();
	}
	
	@GetMapping("/success")
	public String success(
			HttpSession session,
			@ModelAttribute KakaoPayApprovePrepareVO prepareVO) throws URISyntaxException {
		//세션에서 데이터를 추출 후 삭제
		prepareVO.setPartner_order_id((String)session.getAttribute("partner_order_id"));
		prepareVO.setPartner_user_id((String)session.getAttribute("partner_user_id"));
		prepareVO.setTid((String)session.getAttribute("tid"));
		
		session.removeAttribute("partner_order_id");
		session.removeAttribute("partner_user_id");
		session.removeAttribute("tid");
		
		KakaoPayApproveVO approveVO = payService.approve(prepareVO);
		
		//결제 승인이 완료된 시점 : 승인 정보(KakaoPayApproveVO)를 DB에 저장하는 등의 작업을 수행
		
		//결제 정보 조회 페이지 또는 결제 성공 알림페이지로 리다이렉트 한다
		return "redirect:result_success?tid="+approveVO.getTid();
	}
	
	@GetMapping("/result_success")
	public String resultSuccess(
			@RequestParam String tid,
			Model model) throws URISyntaxException {
		KakaoPaySearchVO searchVO = payService.search(tid);
		model.addAttribute("searchVO", searchVO);
		return "pay/resultSuccess";
	}
  }
