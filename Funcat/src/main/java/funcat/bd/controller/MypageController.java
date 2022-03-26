package funcat.bd.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import funcat.bd.domain.Mypage;
import funcat.bd.service.MypageService;
import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member")
@AllArgsConstructor
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	private String test ="";
	//로그인

	//마이페이지 조회
	@GetMapping("/list.do")
	public ModelAndView list(String member_id) {
		Mypage mypageParam = new Mypage();
		mypageParam.setMember_id(member_id);
		
		Mypage mypage = mypageService.list(mypageParam);
		List<Mypage> orderList = mypageService.getMyOrderlist(mypageParam);	
		
		ModelAndView mv = new ModelAndView("mypage/list");
		mv.addObject( "mypage", mypage);
		mv.addObject( "orderList", orderList);
//		ModelAndView mv = new ModelAndView("mypage/list", "mypage", mypage);
		return mv;	
	}
	
	//마이페이지 수정 폼
	@GetMapping("/update.do")
	public ModelAndView update(String member_id) {
		Mypage mypageParam = new Mypage();
		mypageParam.setMember_id(member_id);
		Mypage mypage = mypageService.getMypage(mypageParam);
		ModelAndView mv = new ModelAndView("mypage/update", "mypage", mypage);
		return mv;
	}
	
	//마이페이지 수정하기
	@PostMapping("/update.do")
	public String update(Mypage mypage) {
		mypageService.update(mypage);
		return "redirect:list.do?member_id="+mypage.getMember_id();
	}
	
	//크리에이터조회
	@GetMapping("/creator.do")
	public ModelAndView creator(String member_id) {
		Mypage mypageParam = new Mypage();
		mypageParam.setMember_id(member_id);
		
		Mypage mypage = mypageService.getCreator(mypageParam);
		List<Mypage> projectlist = mypageService.getProjectlist(mypageParam);	
		
		ModelAndView mv = new ModelAndView("mypage/creator");
		mv.addObject( "mypage", mypage);
		mv.addObject( "projectlist", projectlist);
		return mv;	
	}
	
	@GetMapping("/projectdetail.do")
	public ModelAndView projectdetail(long project_num) {
		Mypage mypageParam = new Mypage();
		mypageParam.setProject_num(project_num);
		Mypage mypage = mypageService.getProjectdetail(mypageParam);
		ModelAndView mv = new ModelAndView("mypage/projectdetail", "mypage", mypage);
		return mv;
	}
	
	//내 프로젝트 수정하기
	@PostMapping("/projectdetailupdate.do")
	@ResponseBody
	public String projectupdate(Mypage mypage) {
		
		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);

		mypage.setProject_mdate(date);
		mypageService.projectupdate(mypage);
		
		
		//return "redirect:projectdetail.do?project_num="+mypage.getProject_num();
		
		return "ok";
	}
	
	//내 프로젝트 삭제
	@GetMapping("del.do")
	@ResponseBody
	public String delete(long project_num, String member_id) {
		mypageService.delete(project_num);
		
		return "ok";
	}
}
