package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CustomOrderDTO;
import org.zerock.mapper.CustomOrderMapper;

import lombok.Setter;

@Service
public class CustomOrderImpl implements CustomOrderService {

	@Setter(onMethod_=@Autowired )
   CustomOrderMapper mapper;

	@Override
	public String memberCustomOrder(CustomOrderDTO dto) {
		// 회원주문 
		
		int insertResult = mapper.insertOrder(dto);
		String resultStr;
		
		if(insertResult<=0) {
			
			resultStr ="fail";
			
		}else {
			
			resultStr="success";
			
		}

		return resultStr;
	}

	@Override
	public String noMemberCustomOrder(CustomOrderDTO dto) {
		// 비회원주문 
		
		int insertResult = mapper.insertOrderNomember(dto);
		String resultStr;
		
		if(insertResult<=0) {
			
			resultStr ="fail";
			
		}else {
			
			resultStr="success";
			
		}

		return resultStr;
		

	}
	


}
