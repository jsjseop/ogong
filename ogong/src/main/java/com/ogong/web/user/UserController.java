package com.ogong.web.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ogong.common.Page;
import com.ogong.common.Search;
import com.ogong.service.admin.impl.AdminServiceImpl;
import com.ogong.service.board.BoardService;
import com.ogong.service.domain.Board;
import com.ogong.service.domain.User;
import com.ogong.service.study.StudyService;
import com.ogong.service.user.UserService;

import jdk.internal.org.jline.utils.Log;

@Controller
@RequestMapping("/user/*")
public class UserController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BoardService boardService;
	
	@Autowired	
	private StudyService studyService;


	
	/*
	 * @Autowired private StudyService
	 */
	
	// 회원가입 페이지 진입
	@GetMapping("addUser")
	public String addUser() throws Exception {

		return "/userView/addUser";
	}

	// 회원가입
	@PostMapping("addUser")
	public String addUser(@ModelAttribute("user") User user) throws Exception {

		userService.addUser(user);
		
		

		return "/userView/loginView";

	}

	// 로그인 화면
	@GetMapping("loginView")
	public String loginView() throws Exception {

		return "/userView/loginView";
	}

	// 로그인

	@PostMapping("loginView")
	public String getUser(@ModelAttribute("email") User user, HttpServletRequest req, RedirectAttributes rttr)
			throws Exception {

		HttpSession session = req.getSession();
		User login = userService.getUser(user);

		
		if (login == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
			return "/userView/loginView";
		} else {
			session.setAttribute("user", login);
		} 

		return "redirect:/integration/mainPage";
	}

	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "index";
	}

	
	// 비밀번호 찾기 입장이요
	@GetMapping("getPassword")
	public String getPassword() {
		
		return "/userView/getPassword";
	}
	
	// 비밀번호 찾기
	@PostMapping("getPassword")
	public String getPassword(HttpSession session,User user) throws Exception{
		
		userService.getProfile(getPassword());
		
		
		return "/userView/Changedpassword";
	}
	

	
	  // 비밀번호 변경 화면이동
	  
	 
		
		@GetMapping("Changedpassword")
		public String Changedpassword() throws Exception{
			
			return "/userView/Changedpassword";
		}
		
		// 비밀번호 변경
		
		
		@PostMapping("Changedpassword")
		public String Changedpassword(User user , HttpSession session) throws Exception{
			
			
			userService.Changedpassword(user);			
			session.invalidate();
			
			
			return "redirect:/";
		}

		
		/* 비밀번호찾기 이메일 인증 */
		@RequestMapping(value = "/mailpswCheck", method = RequestMethod.GET)
		@ResponseBody
		public String maipswlCheckGET(String email) throws Exception {
			
			/* 뷰(View)로부터 넘어온 데이터 확인 */
			logger.info("이메일 데이터 전송 확인");
			logger.info("이메일 : " + email);

			/* 인증번호(난수) 생성 */
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			logger.info("인증번호 " + checkNum);

			/* 이메일 보내기 */
			String setFrom = "flower9822@naver.com";
			String toMail = email;
			String title = "회원가입 인증 이메일 입니다.";
			String content = "오늘의 공부 홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
					+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

			try {

				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);

			} catch (Exception e) {
				e.printStackTrace();
			}

			String num = Integer.toString(checkNum);

			return num;
		}
		
	   
		
		//프로필 수정 진입
		  
		  @GetMapping("updateProfile") public String updateProfile(HttpSession session,
				 Model model
		  ) throws Exception {

		  model.addAttribute("user", (User)session.getAttribute("user"));
			  
		  return "/userView/updateProfile"; }
		  
		 
		//프로필 수정

		@RequestMapping( value="updateProfile", method=RequestMethod.POST )
			public String updateProfile( @ModelAttribute("user") User user , Model model, HttpSession session ) throws Exception{

				System.out.println("/user/updateUser : POST");
				//Business Logic
				userService.updateProfile(user);
				
				
				
				  String sessionId=((User)session.getAttribute("user")).getEmail();
				  if(sessionId.equals(user.getEmail())){ session.setAttribute("user", user); }
				 
				 
				
				return "index";
			}
		  
		  //프로필 보기
	  
		  
		  @GetMapping("getProfile") 
		  public String getProfile() throws Exception {
		    	  
		  return "/userView/getProfile"; }
		  
	 
		  
		  //회원탈퇴 이동
		  @GetMapping("withdrawreason")
		  public String Withdrawal() throws Exception{
			  
			  return "/userView/withdrawreason";
		  }
		  
		  // 회원탈퇴
		  @PostMapping("withdrawreason")
			public String Withdrawal(User user , HttpSession session) throws Exception{
				
				
				userService.withdrawreason(user);			
				session.invalidate();

				
				
				return "redirect:/";
			}
		  
		  
		  
		  
		  

	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		logger.info("이메일 데이터 전송 확인");
		logger.info("이메일 : " + email);

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "flower9822@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "오늘의 공부 홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;
	}
	
	@GetMapping("Mypostlist")
	public String Mypostlist(Model model) {
		
		Log.info("게시판 진입");
		
		model.addAttribute("list", userService.getList() );
		
			return "/userView/loginView";	
	}


	

 

 
	// 닉네임 중복 검사
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String nickname) throws Exception{
		
		/* logger.info("memberIdChk() 진입"); */
		
		logger.info("idCheck() 진입");
		
		int result = userService.idCheck(nickname);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	// 중복 닉네임 존재
			
		} else {
			
			return "success";	// 중복 닉네임 x
		}
	}
}
			
				
		
	
  
  
  
  








 
