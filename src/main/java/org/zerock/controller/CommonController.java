package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.ShoppingCartVO;
import org.zerock.service.CustomOrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CommonController {

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
	public String gotoShoppingCart(Model model, long member) {
		//쇼핑카트로 이동하는 메서드 

		List<ShoppingCartVO> lists = shoppingCartService.getCartList(member);
		int shoppingCartElements = shoppingCartService.CountCartElements(member);
		
		log.info("==============================");
		log.info(shoppingCartElements);
		log.info("==============================");
		
		model.addAttribute("cartList", lists); //쇼핑카트리스트
		model.addAttribute("cartElemets", shoppingCartElements+""); //쇼핑카트에 담긴 상품수

		return "/shoppingCart";
	}
	
	  @PreAuthorize("isAuthenticated()")
	  @GetMapping("/showCartElements")
	  @ResponseBody
	  public String showShoppingCartElements(String member) {
	 //헤더부분 쇼핑카트 제품수 알려주는 컨트롤라

		  long member_seq = Long.parseLong(member);
  
		  int result = shoppingCartService.CountCartElements(member_seq);
	  
		  log.info("============숖핑카트====================");
		  log.info(result);
		  log.info("================================");
		  
		  return result+"";
	  }

	
}
