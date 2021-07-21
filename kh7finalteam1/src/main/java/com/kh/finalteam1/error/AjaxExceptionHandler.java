package com.kh.finalteam1.error;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.kh.finalteam1.restcontroller.MemberDataController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestControllerAdvice(basePackageClasses = {MemberDataController.class})
public class AjaxExceptionHandler {
	
	@ExceptionHandler(AjaxException.class)
	public ResponseEntity<String> ajaxFail(Exception ex){
		//log.error("ajax fail error", ex);
		return ResponseEntity.internalServerError().body(ex.getMessage());
	}
	
}
