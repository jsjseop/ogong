package com.ogong.web.user;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("/")
	public String test() throws Exception{
		
		return "hello";
	}
}
