package com.kh.finalteam1.service;

import java.net.URISyntaxException;

import com.kh.finalteam1.vo.KakaoPayApprovePrepareVO;
import com.kh.finalteam1.vo.KakaoPayApproveVO;
import com.kh.finalteam1.vo.KakaoPayCancelPrepareVO;
import com.kh.finalteam1.vo.KakaoPayCancelVO;
import com.kh.finalteam1.vo.KakaoPayReadyPrepareVO;
import com.kh.finalteam1.vo.KakaoPayReadyVO;
import com.kh.finalteam1.vo.KakaoPaySearchVO;

public interface PayService {

	//결제 준비 요청
		KakaoPayReadyVO ready(KakaoPayReadyPrepareVO kakaoPayReadyPrepareVO) throws URISyntaxException;
		//묶음 결제 준비 요청
		KakaoPayReadyVO ready2(KakaoPayReadyPrepareVO prepareVO) throws URISyntaxException;
		//결제 승인 요청
		KakaoPayApproveVO approve(KakaoPayApprovePrepareVO kakaoPayApprovePrepareVO) throws URISyntaxException;
		//결제 조회 기능
		KakaoPaySearchVO search(String tid) throws URISyntaxException;
		//결제 취소 기능
		KakaoPayCancelVO cancel(KakaoPayCancelPrepareVO prepareVO) throws URISyntaxException;
}
