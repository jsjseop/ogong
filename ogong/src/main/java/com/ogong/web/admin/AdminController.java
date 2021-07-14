package com.ogong.web.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogong.common.Page;
import com.ogong.common.Search;
import com.ogong.service.admin.AdminService;
import com.ogong.service.domain.Report;
import com.ogong.service.domain.User;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	//Filed
	@Autowired
	private AdminService adminService;
	
	public AdminController() {
		System.out.println(this.getClass());
	}
	
	@GetMapping("addReport")
	public String addReport(@ModelAttribute("report") Report report,
							User user) throws Exception{
		
		System.out.println("/admin/addReport : GET");
		User sendReporter = new User();
		sendReporter.setEmail("user01");
		
		report.setSendReporter(sendReporter);
		
		
		return "/adminView/addReport";
	}
	
	
	@PostMapping("addReport")
	public String addReport( @ModelAttribute("report") Report report, Model model) throws Exception{
		
		System.out.println("addReport/Post 시작");
		
		adminService.addReport(report);
		
		
			
		return "/admin/listUserReport";
		
	}
	
	@RequestMapping(value="listReport")
	public String listReport(@ModelAttribute("search") Search search, Model model,
													   HttpServletRequest request) throws Exception{
		int pageSize = 5;
		int pageUnit = 5;
		
		System.out.println("/listReport 시작");
		int reportType = 3;
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(request.getParameter("reportType") != null) {
			if(request.getParameter("reportType").equals("1")) {
				reportType = 1;
			}
			if(request.getParameter("reportType").equals("2")) {
				reportType = 2;
			}
			if(request.getParameter("reportType").equals("3")) {
				reportType = 3;
			}
		}else {
			System.out.println("null");
		}
		/* search.setPageSize(pageSize); */
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("reportType", "1");
		
		Map<String,Object> result = adminService.getlistReport(map);
		List<Object> list = (List<Object>)map.get("list");
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("여기는 resultType " + reportType);
		System.out.println("여기는 resultPage " + resultPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("reportType", 1);
		return "/adminView/listReport";
	}
	
	@RequestMapping(value="listUserReport")
	public String listUserReport(@ModelAttribute("search") Search search, Model model,
			   HttpServletRequest request) throws Exception{
		
		int pageSize = 5;
		int pageUnit = 5;
		
		HttpSession session = request.getSession();
		
		System.out.println("/listUserReport 시작");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		Map<String,Object> result = adminService.getlistUserReport(map);
		List<Object> list = (List<Object>)map.get("list");
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("여기는 resultPage " + resultPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		
		
		return "/adminView/listUserReport";
	}
	
	
}













