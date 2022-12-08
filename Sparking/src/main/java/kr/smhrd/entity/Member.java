package kr.smhrd.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	
// 로그인, 회원가입을 위한 회원 정보
	private String mem_Id;
	private String mem_Pw;
	private String apt_dong;
	private String apt_hnum;
	private String p_intime;
	private String p_outtime;
	private String apt_num;
	private String car_num;
	private String mem_grade;//0이 관리자 , 1이 입주민
	private String check_time;
	 
}
