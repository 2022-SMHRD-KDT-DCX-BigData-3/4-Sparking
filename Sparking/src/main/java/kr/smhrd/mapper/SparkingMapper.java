package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Member;
import kr.smhrd.service.SparkingService;



public interface SparkingMapper {
		//로그인 mapper
	   @Select("select * from Member where mem_Id=#{memId} and mem_Pw=#{memPw}")
	   public Member login(Member vo);

		/*
		 * @Insert("insert into PMember (memId,memPw,apt_dong,apt_hnum,p_intime,p_outtime,apt_num) "
		 * +
		 * "values (#{memId},#{memPw},#{apt_dong},#{apt_hnum},#{p_intime},#{p_outtime},#{apt_num})"
		 * ) public void join(Member vo);
		 */
	   
	   public void join(Member vo);
	   
	   public List<Member> loginList();
	   
	   public List<Member> modifyList(); //회원가입 수정

	   public static int idCheck(Member vo) {
		return 0;
	  }
	   
	   public void update(Member vo);
	  
	   public Member getMember(String memId);	
		
}
 