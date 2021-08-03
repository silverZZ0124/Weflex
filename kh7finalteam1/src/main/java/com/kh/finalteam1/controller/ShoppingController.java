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

import com.kh.finalteam1.entity.BuyListDto;
import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.entity.ProductDto;
import com.kh.finalteam1.repository.BuyListDao;
import com.kh.finalteam1.repository.ClientDao;
import com.kh.finalteam1.repository.ProductDao;
import com.kh.finalteam1.service.PayService;
import com.kh.finalteam1.vo.KakaoPayApprovePrepareVO;
import com.kh.finalteam1.vo.KakaoPayApproveVO;
import com.kh.finalteam1.vo.KakaoPayReadyPrepareVO;
import com.kh.finalteam1.vo.KakaoPayReadyVO;



@Controller
@RequestMapping("/shop")
public class ShoppingController {

	@Autowired
	private ProductDao productDao;
	
	
	
	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("list", productDao.list());
		return "shop/home";
	}
	
	@RequestMapping("/buy")
	public String buy(@RequestParam int no, @RequestParam int quantity,Model model) {
		ProductDto productDto=productDao.get(no);
		model.addAttribute("productDto",productDto);
		model.addAttribute("quantity",quantity);
		model.addAttribute("total_amount",productDto.getProductPrice());
		return "shop/buy";
	}
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private BuyListDao buyListDao;
	
	@PostMapping("/confirm")
	public String confirm(HttpSession session, @RequestParam int no, @ModelAttribute KakaoPayReadyPrepareVO prepareVO) throws URISyntaxException {
		
		int clientNo=(int)session.getAttribute("clientNo");
		
		
		prepareVO.setPartner_user_id(String.valueOf(clientNo));
		int buyNo=buyListDao.getSequence();
		prepareVO.setPartner_order_id(String.valueOf(buyNo));
		
		KakaoPayReadyVO readyVO=payService.ready(prepareVO);
		
		BuyListDto buyListDto=BuyListDto.builder()
				.buyNo(buyNo)
				.buyPaymentTid(readyVO.getTid())
				.clientNo(clientNo)
				.productNo(no)
				.build();
		buyListDao.ready(buyListDto);
		session.setAttribute("partner_order_id", String.valueOf(buyNo));
		session.setAttribute("partner_user_id", String.valueOf(clientNo));
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
		
		
		
		//결제 정보 조회 페이지 또는 결제 성공 알림페이지로 리다이렉트 한다
		return "redirect:result_success?tid="+approveVO.getTid();
	}
	

}











