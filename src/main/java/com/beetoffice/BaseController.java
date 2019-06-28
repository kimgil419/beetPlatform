package com.beetoffice;

import com.beetoffice.searchemployee.SearchEmployeeVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BaseController {

	@RequestMapping("/")
	public String base() {
		return "login";
	}

}
