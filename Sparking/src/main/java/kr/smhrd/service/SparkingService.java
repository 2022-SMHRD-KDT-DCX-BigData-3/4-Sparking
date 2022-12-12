package kr.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.smhrd.entity.Member;
import kr.smhrd.entity.Parking;
import kr.smhrd.mapper.SparkingMapper;

@Service
public class SparkingService {

	@Autowired
	private SparkingMapper Sparkingmapper;

	// 로그인
	public Member login(Member vo) {
		return Sparkingmapper.login(vo);
	}

	// 회원가입
	public void join(Member vo) {
		Sparkingmapper.join(vo);
	}

	// 관리자 페이지
	public void admin(Member vo) {
		Sparkingmapper.login(vo);

	}

	// 입주민 회원가입 정보 보여주기
	public void loginInfo(Member vo) {
		Sparkingmapper.login(vo);
	}

	// 업데이트 된 입주민 정보 화면에 뿌려주기
	public List<Member> loginList() {
		return Sparkingmapper.loginList();
	}
	
	// 업데이트 된 입주민 정보 화면에 뿌려주기
		public List<Member> userInfoList() {
			return Sparkingmapper.userInfoList();
		}


	// 회원정보 수정
	public List<Member> modifyList() {
		return Sparkingmapper.modifyList();
	}

	  // 회원가입 승인, 거절
	  public static void dropUser(String id) {
	  
	  }
	  
	  public static void successId(String id) {
	  
	  
	  }
	  
	  public static void failed(String id) {
	  
	  }
	 // 아이디 중복체크
	  public static void idCheck(Member vo) {
		  
	  }

	  public void updateInfo(Member vo) {
		  Sparkingmapper.updateInfo(vo);
	  }
	  
	  public Member getMember(String memId) {
		  return Sparkingmapper.getMember(memId);
	  }

	public void modify1List(Member vo) {
		// TODO Auto-generated method stub
		
	}
	  
	  // 회원정보 수정 승인 및 거절 
	 public Member yesInfo(String mem_Id) {
		 
		 return Sparkingmapper.yesInfo(mem_Id);
	 }
	 
    public void yesUpdateInfo(Member vo) {
		 
		  Sparkingmapper.yesUpdateInfo(vo);
	 }
	  
    public void yesDeleteInfo(String mem_Id) {
		 
		  Sparkingmapper.yesDeleteInfo(mem_Id);
	 }  
    public void noDeleteInfo(String mem_Id) {
		 
		  Sparkingmapper.noDeleteInfo(mem_Id);
	 }  
    
    public Parking flask() {
    	return Sparkingmapper.flask();
		
    }
    
    public List<Parking> getAptDong(String apt_dong){
    	return Sparkingmapper.getAptDong(apt_dong);
    }
}
