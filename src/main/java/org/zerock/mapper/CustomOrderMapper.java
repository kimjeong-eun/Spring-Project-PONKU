package org.zerock.mapper;

import org.zerock.domain.CustomOrderDTO;

public interface CustomOrderMapper {

	public int insertOrder(CustomOrderDTO dto);
	public int insertOrderNomember(CustomOrderDTO dto);
	
}
