<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 완료</title>


<style type="text/css">


.sub-header{

	position: absolute;
	width: 100%;
	height:20%;
/* 	border: 1px solid green;  */
	background-image: url("/resources/img/subheader.png");
	background-size: cover;
	
	}

	.completeMsg{
	    width: 100%;
	    height: 100%;
	    position: relative;
	}

	h1#complete {
		    font-size: 50px;
		    font-weight: 800;
		    text-align: center;
		    position: absolute;
		    left: 40rem;
		    top: 20rem;
	}
	
	element.style {
    position: absolute;
    left: 40rem;
    top: 30rem;
}
	

</style>

</head>
<body>

<jsp:include page="./includes/header.jsp"></jsp:include>
<div class="sub-header" id="sub-header"></div>

<div class="completeMsg">

	<h1 id="complete"> 구매가 확정되었습니다.</h1>
	<p style=" position: absolute; left: 40rem; top: 30rem;"> 구매해주셔서 감사합니다.&nbsp; &nbsp;출고는 주문접수 후 최대 2~3일 소요됩니다. </p>
</div>

<jsp:include page="./includes/footer.jsp"></jsp:include>
</body>
</html>