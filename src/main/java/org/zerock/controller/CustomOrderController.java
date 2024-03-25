package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.CustomImgDTO;
import org.zerock.domain.CustomOrderDTO;
import org.zerock.domain.ShopGoodsVO;
import org.zerock.domain.ShoppingCartVO;
import org.zerock.service.CustomOrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CustomOrderController {
	
	@Setter(onMethod_ = @Autowired )
	CustomOrderService service;

	
	
	@PreAuthorize("permitAll")
	@PostMapping("/orderCustom")
	public String orderCustom(CustomImgDTO customimginput, String modelinput, String codeinput, String customcontent,
				String quantity , String totalprice , String userid,String caseimgurl, String casename, String price,Model model) {
		//커스텀케이스 구매 페이지로 이동하는 컨트롤러 
		
		CustomOrderDTO dto = new CustomOrderDTO();
		/* dto.setCustom_image(customimginput.getUploadPath()); */
		dto.setCaseimgurl(caseimgurl);
		dto.setCasename(casename);
		dto.setCustom_content(customcontent);
		dto.setQuantity(quantity);
		dto.setTotalprice(totalprice);
		dto.setUserid(userid);
		dto.setGno(codeinput);
		dto.setPrice(price);
		dto.setModel_name(modelinput);
				
		CustomImgDTO imgdto = new CustomImgDTO();
		imgdto.setFileName(customimginput.getFileName());		
		imgdto.setUploadPath(customimginput.getUploadPath());
		imgdto.setUuid(customimginput.getUuid());
		imgdto.setImage(customimginput.isImage());
		
		model.addAttribute("dto", dto); //구매예정내역
		model.addAttribute("imgdto",imgdto ); //이미지 정보 
		
		
		log.info("================그냥컨트롤라====================");
		log.info(userid);
		log.info(imgdto.getUploadPath());
		log.info(imgdto.getUploadPath());
		
		log.info("====================================");
		
		return "/orderCustom";
	}
	
	//그냥 컨트롤러에서 rest방식 연습..!
	@PreAuthorize("permitAll")
	@GetMapping("/display")	
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		
		log.info("============display 컨트롤러========================");
		log.info("fileName: " + fileName);

		File file = new File("c:\\upload\\"+fileName+".png");
		
		log.info("file: " + file);
		log.info("========================================");
		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	@PreAuthorize("permitAll")
	@PostMapping("/orderComplete")
	public String decideOrder(CustomOrderDTO dto) {
		
		String resultStr = "";
		
		log.info("==================주문 컨트롤러===================");
		
		log.info(dto.getCasename());
		
		log.info("==================주문 컨트롤러===================");
		if(dto.getOrderpw() == "" || dto.getOrderpw()==null) {
			resultStr = service.memberCustomOrder(dto);
		}else {
			resultStr = service.noMemberCustomOrder(dto);
		}

		if(resultStr.equals("success")) {
			
			return "/completeOrder";
			
		}else{
			
			return "/index";
			
		}

	}
	

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/putShoppingCart")
	public String putShoppingCart(Long member_seq , String caseimgurl , String cquantity , String codeinput, String modelinput, Model model) {
		//쇼핑카트에 추가하는 컨트롤러
		
		ShoppingCartVO cartVo = new ShoppingCartVO();
		List<ShoppingCartVO> cartLists ;
		ShopGoodsVO goodsVo = service.getGoddsInfo(codeinput); //케이스정보
		
		cartVo.setMember_seq(member_seq);
		cartVo.setGno(codeinput);
		cartVo.setImage(caseimgurl);		
		cartVo.setQuantity(cquantity);
		cartVo.setModel(modelinput);

		int cartElements  = service.CountCartElements(member_seq);
		
		String nextElemets = cartElements+1+"";
		
		cartVo.setCart_no(nextElemets);
		
		String result = service.putShoppingCart(cartVo, nextElemets);
		
		
		
		if(result.equals("success")) {
			
			cartLists = service.getCartList(member_seq);
			
			model.addAttribute("cartList", cartLists);
		
	
			return "/shoppingCart";
			
		}else {
			
			return "/orderCustom";
		}

	}
	
	
		
	
}
