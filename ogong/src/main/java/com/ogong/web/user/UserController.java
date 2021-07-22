package com.ogong.web.user;

<<<<<<< new/test
=======
import java.util.HashMap;
import java.util.Map;
>>>>>>> e6de961 희빈 : 프로필수정 비밀번호 변경 ㅇ
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ogong.service.domain.User;
import com.ogong.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSender mailSender;

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

<<<<<<< new/test
	/*
	 * // 비밀번호 변경 화면이동
	 * 
	 * 
	 * @GetMapping("updatePasswordView") public String updatePasswordView() throws
	 * Exception {
	 * 
	 * 
	 * User user = userService.getUser(email)
	 * 
	 * Model.addAttribute()
	 * 
	 * 
	 * return "/userView/updatePasswordView"; }
	 * 
	 * 
	 * 
	 * // 비밀번호 변경
	 * 
	 * @PostMapping("updatePassword") public String
	 * updatePassword(@ModelAttribute("user") User user , Model model, HttpSession
	 * session) throws Exception{
	 * 
	 * userService.updatePassword(user);
	 * 
	 * String sessionId=((User)session.getAttribute("user")).getEmail();
	 * 
	 * 
	 * if(sessionId.equals(user.getEmail())) { session.setAttribute("user", user); }
	 * 
	 * return "index"; }
	 */
=======
	
	  // 비밀번호 변경 화면이동
	  
	 
		
		@GetMapping("Changedpassword")
		public String Changedpassword() throws Exception{
			
			return "/userView/Changedpassword";
		}
		
		 
		 
		 @GetMapping("updateProfile") 
		  public String updateProfile(HttpServletRequest request) throws Exception {
		   
			  HttpSession session = request.getSession();
			  String email = (String) session.getAttribute(getProfile());
			  
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
		  
	 
>>>>>>> e6de961 희빈 : 프로필수정 비밀번호 변경 ㅇ

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
		String setFrom = "abcd960141@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
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
}
<<<<<<< new/test
<<<<<<< new/test

/*
 * @RequestMapping( value="addUser", method=RequestMethod.POST ) public String
 * addUser( @ModelAttribute("user") User user ) throws Exception {
 * 
 * System.out.println("/user/addUser : POST"); //Business Logic
 * userService.addUser(user);
 * 
 * return "redirect:/user/loginView"; }
 * 
 * 
 * @PostMapping("userView/addUser")
 */
//	public String addUser() throws {

/*
 * @RequestMapping(value="/adduser", method=RequestMethod.POST) public String
 * joinPOST(User user) throws Exception{
 * 
 * String rawPw = ""; // 인코딩 전 비밀번호 String encodePw = ""; // 인코딩 후 비밀번호
 * 
 * rawPw = member.getMemberPw(); // 비밀번호 데이터 얻음 encodePw =
 * pwEncoder.encode(rawPw); // 비밀번호 인코딩 member.setMemberPw(encodePw); // 인코딩된
 * 비밀번호 member객체에 다시 저장
 * 
 * 회원가입 쿼리 실행 userServce.addUser(user);
 * 
 * return "redirect:/main";
 */

/*
 * @PostMapping("userView/checkDuplication") public String
 * checkDuplication(@ModelAttribute("user") User user) throws Exception {
 * 
 * System.out.println("userView/checkDuplication : POST");
 * 
 * userServce.checkDuplication(user);
 * 
 * return "userView/checkDuplication"; }
 */

/*
 * @RequestMapping( value="userView/checkDuplication", method=RequestMethod.POST
 * ) public String checkDuplication( @RequestParam("userId") String userId ,
 * Model model ) throws Exception{
 * 
 * System.out.println("/user/checkDuplication : POST"); //Business Logic boolean
 * result=UserService.checkDuplication(email); // Model 과 View 연결
 * model.addAttribute("result", new Boolean(result));
 * model.addAttribute("userId", userId);
 * 
 * return "forward:/user/checkDuplication"; }
 */

/*
 * 
 * public UserController(){ System.out.println(this.getClass()); }
 * 
 */
=======
=======
>>>>>>> e6de961 희빈 : 프로필수정 비밀번호 변경 ㅇ
}
>>>>>>> e6de961 희빈 : 프로필수정 비밀번호 변경 ㅇ

/*
<<<<<<< new/test
<<<<<<< new/test
 * @GetMapping("userView/addUser") public String addUser() throws Exception{
 * 
 * System.out.println("/UserView/adduser : GET");
 * 
 * return "userView/addUser"; }
 */
/*
 * 
 * @PostMapping("addUserView") public String addUser(@ModelAttribute("user")
 * User user ) throws Exception{
 * 
 * System.out.println("/user/addUser : POST"); //Business Logic
 * userService.addUser(user);
 * 
 * return "/userView/loginView";
 * 
 * }
 * 
 * 
 * 
 * 
 * @RequestMapping( value="getUser", method=RequestMethod.GET ) public String
 * getUser( @RequestParam("userId") String userId , Model model ) throws
 * Exception {
 * 
 * System.out.println("/user/getUser : GET"); //Business Logic User user =
 * userService.getUser(userId); // Model 과 View 연결 model.addAttribute("user",
 * user);
 * 
 * return "forward:/user/getUser.jsp"; }
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * }
 */
=======
=======
>>>>>>> e6de961 희빈 : 프로필수정 비밀번호 변경 ㅇ
 * 
 * // 닉네임 수정
 * 
 * @RequestMapping("updateNickname") public String
 * updateNickname( @RequestParam("email") String email,
 * 
 * @RequestParam("nickname") String nickname,
 * 
 * @ModelAttribute("user") User user) throws Exception {
 * System.out.println("닉네임수정"); userService.updateNickname(user); return
 * "user/updatenickname"; }
 * 
 * // 관심사 수정
 * 
 * @RequestMapping("updateInterest") public String
 * updateInterest( @RequestParam("email") String email,
 * 
 * @RequestParam("studyInterest1") String studyInterest1,
 * 
 * @RequestParam("studyInterest2") String studyInterest2,
 * 
 * @RequestParam("studyInterest3") String studyInterest3,
 * 
 * @ModelAttribute("user") User user) throws Exception {
 * System.out.println("관심사수정"); userService.updatestudyInterest(user); return
 * "user/updateInterest"; } // 이름 수정
 * 
 * @RequestMapping("updatename") public String
 * updatename( @RequestParam("email") String email,
 * 
 * @RequestParam("name") String name,
 * 
 * @ModelAttribute("user") User user) throws Exception {
 * System.out.println("이름수정"); userService.updatename(user); return
 * "user/updatename"; }
 * 
 * // 생년월일
 * 
 * @RequestMapping("updatebirth") public String
 * updatebirth( @RequestParam("email") String email,
 * 
 * @RequestParam("name") String name,
 * 
 * @ModelAttribute("user") User user) throws Exception {
 * System.out.println("이름수정"); userService.updatename(user); return
 * "user/updatename"; }
 * 
 * }
 */

// 
<<<<<<< new/test
>>>>>>> e6de961 희빈 : 프로필수정 비밀번호 변경 ㅇ
=======
>>>>>>> e6de961 희빈 : 프로필수정 비밀번호 변경 ㅇ
