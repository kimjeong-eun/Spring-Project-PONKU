<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="dropdown col">
		<button class="btn btn-secondary dropdown-toggle" type="button"
			id="dropdownMenuButton1" data-bs-toggle="dropdown"
			aria-expanded="false">대분류</button>
		<select class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
			<option><p class="dropdown-item dropdown-item1">애플</p>
			</option>
			<option><p class="dropdown-item dropdown-item2">삼성</p>
			</option>
			<option><p class="dropdown-item dropdown-item3">구글</p>
			</option>
		</select>
	</div>
	<!-- Footer Section Begin -->

	<jsp:include page="./includes/footer.jsp"></jsp:include>

	<!-- Footer Section End -->