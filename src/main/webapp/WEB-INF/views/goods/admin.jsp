<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자1님 환영합니다</h1>

<ul>
    <li>상품 관리
        <ul>
            <li>상품 등록</li>
            <li>상품 수정</li>
            <li>상품 삭제</li>
        </ul>
    </li>
    <li>회원 목록
        <ul>
            <li>회원 목록</li>
        </ul>
    </li>
    <li>주문 관리
        <ul>
            <li>주문 목록</li>
        </ul>
    </li>
</ul>


<%-- <p>principal : <sec:authentication property="principal"/></p> <!-- principal: UserDetailsService에서 반환된 객체 -->
<p>MemverVO : <sec:authentication property="principal.member"/></p>
<p>사용자 이름 : <sec:authentication property="principal.member.username"/></p>
<p>사용자 아이디 : <sec:authentication property="principal.username"/></p>
<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>

<a href="/customLogout">Logout</a> --%>

</body>
</html>