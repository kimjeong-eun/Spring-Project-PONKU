package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.domain.ShoppingCartVO;
import org.zerock.service.CustomOrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CoommonController {

	@Setter(onMethod_ = @Autowired )
	CustomOrderService shoppingCartService;
	
	
	@PreAuthorize("permitAll")
	@GetMapping("/custompage")
	public String gotoCustom() {
		//커스텀 페이지로 이동하는 컨트롤러
		
		return "/customview";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/shoppingcart")
	public String gotoShoppingCart(Model model) {
		//쇼핑카트로 이동하는 메서드 

		List<ShoppingCartVO> lists = shoppingCartService.getCartList(64);
		
		model.addAttribute("cartList", lists);
		
		
		
		return "/shoppingCart";
	}
	
	
}
