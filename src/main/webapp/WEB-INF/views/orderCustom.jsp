<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

주문페이지에요 ~
<br/><br/>

모델명: ${dto.model_name } <br/>
커스텀 이미지 저장위치:${dto.custom_image }<br/>
커스텀 입력 문구: ${dto.custom_content }<br/>
 수량 : ${dto.quantity }<br/>
총 가격 : ${dto.totalprice }<br/>
유저아이디 :${dto.userid }<br/>
상품번호: ${dto.gno }<br/>

</body>
</html>