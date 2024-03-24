package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.CustomOrderDTO;


public interface CustomOrderService {

	public String memberCustomOrder(CustomOrderDTO dto);
	public String noMemberCustomOrder(CustomOrderDTO dto);

}
