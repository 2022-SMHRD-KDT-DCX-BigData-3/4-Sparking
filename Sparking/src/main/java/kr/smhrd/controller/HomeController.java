package kr.smhrd.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.smhrd.entity.Member;
import kr.smhrd.mapper.SparkingMapper;
import kr.smhrd.service.SparkingService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private SparkingService sparkingService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "Login";
	}

	@PostMapping("/Login") // 로그인
	public String login(Member vo, HttpSession session) { // memId, memPwd
		Member mvo = sparkingService.login(vo);
		if (mvo != null) { // 로그인 성공 => 객체 바인딩(HttpSession)
			session.setAttribute("mvo", mvo); // JSP -> ${empty mvo}
			
			session.setAttribute("message", "login");
			return "resident";
		}else {
			session.setAttribute("message", "error");
			return "Login";
		}
		 // 
		
		//return "redirect:/";
	}
	
	@PostMapping("/Logout") // 로그아웃
	public String login(HttpSession session, RedirectAttributes rttr) {// 세션이 끊기고나서 값을 가져가야 할 때 사용
		session.invalidate();	// 세션을 끊을 때 사용	
		rttr.addAttribute("message", "logout");
		return "redirect:/";
	}
	
	
	@GetMapping("/joinForm") // 회원가입 페이지 이동
	public String join() {
		
		return "join"; 
			
	}
	@PostMapping("/join") // 회원가입 하기
	public String join(Member vo) {
		sparkingService.join(vo);
		//int result 
		
		return "redirect:/"; 
			
	}
	
	@GetMapping("/admin") // 관리자 로그인 성공 후 관리자 페이지 클릭 시 관리자 페이지로 접속
	public String admin(Model model) {
		List<Member> list=sparkingService.loginList();
		model.addAttribute("list", list);
		return "admin";
	
	}
	
	@GetMapping("/resident") // 입주민 로그인 성공 후 바로 입주민 페이지로 접속
	public String resident(HttpSession session , Model model) {
		Member vo = (Member) session.getAttribute("mvo");
		Member mvo = sparkingService.getMember(vo.getMemId());
		session.setAttribute("mvo", mvo);
		return "resident";
	}
	
	@GetMapping("/infoList") // 새로고침 하여 회원정보 등록한 입주민들을 화면 변화 없이 업데이트
	public @ResponseBody List<Member> infoList()         {
		List<Member> list=sparkingService.loginList();
		//model.addAttribute("list", list);
		return list;
	}
	@GetMapping("/modifyList") // 회원정보 수정 요청한 회원 
	public@ResponseBody List<Member> modifyList() {
		List<Member> mlist = sparkingService.modifyList();		
		return mlist;
	}
	
	
	
	// 동화면(parking.jsp)에서 동 선택시 해당 동의 주차장.jsp로 이동
	 @GetMapping("/parking") //a태그로 받은 것은 getmapping 해주기, resident.jsp 파일에서 a태그에 있는 parking으로 getmapping을 받을거니까 parking으로 적어줘야 함.  
	 public String parking() {
		 return "parking";
	 }
	
		// 회원가입 승인, 거절
		 @ResponseBody
		 @PostMapping("/dropid") public void dropID(String id) {
		  SparkingService.dropUser(id); }
		  
		  @ResponseBody
		  @PostMapping("/successid") public void successid(String id) {
		  System.out.println(id);
		  System.out.println("open! user sign success id ajax!");
		  SparkingService.successId(id); };
		  
		  @ResponseBody
		  @PostMapping("/failed") public void failed(String id) {
		  System.out.println(id);
		  System.out.println("open! user sign failed id ajax!");
		  SparkingService.failed(id); }
		 
	// 아이디 중복체크
		  @ResponseBody
		  @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
		  public int idCheck(Member vo) {
			  int result = SparkingMapper.idCheck(vo);
			  return result;
		  }
	
		 @RequestMapping("/update")
		 public String update(Member vo) {
			 System.out.println(vo);
			 sparkingService.update(vo);
			 return "redirect:/resident";
		 }
			/*
			 * @RequestMapping("/updateInfo") public String updateInfo(Member vo) {
			 * 
			 * }
			 */
		
		 
}