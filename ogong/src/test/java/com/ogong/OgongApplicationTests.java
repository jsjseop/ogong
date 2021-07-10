package com.ogong;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ogong.service.domain.User;
import com.ogong.service.user.UserService;

@SpringBootTest
class OgongApplicationTests {

	@Autowired
	private UserService userService;
	
	@Test
	@DisplayName("회원 조회")
	void testGetUser() throws Exception {
		
		User user = new User();
		
		user = userService.getUser("user01");
		
		System.out.println(user);
	}

}
