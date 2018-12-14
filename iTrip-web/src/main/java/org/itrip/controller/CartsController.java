package org.itrip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartsController {
	@RequestMapping("charts-5.do")
	public String carts5() {
		return "charts-5";
	}
}
