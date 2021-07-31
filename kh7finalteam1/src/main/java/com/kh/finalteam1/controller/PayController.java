package com.kh.finalteam1.controller;

import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.BuyListDto;
import com.kh.finalteam1.entity.ProductDto;
import com.kh.finalteam1.repository.BuyListDao;
import com.kh.finalteam1.repository.ClientDao;
import com.kh.finalteam1.repository.ProductDao;
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
	
	@Autowired
	private ClientDao clientDao;
	
	@Autowired
	private BuyListDao buyListDao;
	
	@Autowired
	private ProductDao productDao;

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
		
		
		
		KakaoPayApproveVO approveVO = payService.approve(prepareVO);
		
		int clientNo=(int)session.getAttribute("clientNo");
		clientDao.updateExpire(clientNo);

		String buyNo=(String)session.getAttribute("partner_order_id");

		BuyListDto buyListDto=buyListDao.get(Integer.parseInt(buyNo));
		if(buyListDto.getProductNo()==1) {
			clientDao.updateGradeStandard(clientNo);
		}else if(buyListDto.getProductNo()==2) {
			clientDao.updateGradePremium(clientNo);
		}
		
		session.removeAttribute("partner_order_id");
		session.removeAttribute("partner_user_id");
		session.removeAttribute("tid");
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
	
	
	@GetMapping("/payHistory")
	public String payHistory(HttpSession session, Model model) {
		int clientNo=(int)session.getAttribute("clientNo");
		List<BuyListDto> buyList=buyListDao.list(clientNo);
		model.addAttribute("list", buyListDao.list(clientNo));
		
		List<ProductDto> productList=new ArrayList<>();
		for(int i=0;i<buyList.size();i++) {
			productList.add(productDao.get(buyList.get(i).getProductNo()));
		}
		
		
		model.addAttribute("productList",productList);
;		return "pay/payHistory";
	}
	

}
