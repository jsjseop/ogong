package com.ogong.web.banana;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ogong.service.banana.BananaService;

@RestController
@RequestMapping("/banana/*")
public class bananaRestController {
	
	@Autowired
	private BananaService bananaService;

	public bananaRestController() {
		System.out.println(this.getClass());
	}
	
	@GetMapping(value="json/deleteBanana/{bananaNo}")
	public void deleteBanana(@PathVariable("bananaNo")int bananaNo) throws Exception{
		
		System.out.println("deleteBanana : GET");
		
		bananaService.deleteBanana(bananaNo);
		
	}
	
}
