package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Member;
import kr.smhrd.entity.Parking;
import kr.smhrd.service.SparkingService;



public interface SparkingMapper {
		//로그인 mapper
	   @Select("select * from Member where mem_Id=#{mem_Id} and mem_Pw=#{mem_Pw}")
	   public Member login(Member vo);

		/*
		 * @Insert("insert into PMember (memId,memPw,apt_dong,apt_hnum,p_intime,p_outtime,apt_num) "
		 * +
		 * "values (#{memId},#{memPw},#{apt_dong},#{apt_hnum},#{p_intime},#{p_outtime},#{apt_num})"
		 * ) public void join(Member vo);
		 */
	   
	   // 회원가입 
	   public void join(Member vo);
	   
	   public List<Member> loginList();
	   
	   public List<Member> userInfoList();
	   
	   public List<Member> modifyList(); //회원가입 수정

	   public static int idCheck(Member vo) {
		return 0;
	  }
	   
	   public void updateInfo(Member vo);
	  
	   public Member getMember(String memId);	
	
	   // 회원정보 수정 승인시
	   public Member yesInfo(String mem_Id);	
	   public void yesUpdateInfo(Member vo);
	   public void yesDeleteInfo(String mem_Id);
	   
	   // 회원정보 수정 거절시
	   public void noDeleteInfo(String mem_Id);
	   
	   
	   // spring flask 연동
	   public Parking flask(); 
	   
	   public List<Parking> getAptDong(String apt_dong);
}
 