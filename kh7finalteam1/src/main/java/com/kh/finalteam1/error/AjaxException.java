package com.kh.finalteam1.error;

//예외 클래스가 되려면 Excepiton을 상속받아야 한다.
//단, 자바에서는 RuntimeException은 따로 처리 안해도 되도록 구현되어 있다.
//public class AjaxException extends Exception{
public class AjaxException extends RuntimeException {
	private static final long serialVersionUID = 1L; 
	public AjaxException(String message) {
		super(message);
	}
}
