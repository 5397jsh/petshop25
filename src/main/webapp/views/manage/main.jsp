<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 관리</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">


    <%@ include file="/views/icons.jsp" %>

</head>
<body>

<%@ include file="../header.jsp" %>
<div class="container">
    <h1>회원 관리 페이지</h1>
    <p>회원 정보를 관리</p>
</div>

<table class="container" border="1" cellpadding="10" cellspacing="0">
    <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>가입일</th>
        <th>관리</th>
    </tr>

    <c:forEach var="cust" items="${custList}">
        <tr>
            <td>${cust.custId}</td>
            <td>${cust.custName}</td>
            <td>${cust.custMail}</td>
            <td>${cust.custPhone}</td>
            <td><fmt:formatDate value="${cust.custRegdate}" pattern="yyyy-MM-dd" /></td>
            <td>
                <a href="/manage/update?id=${cust.custId}">✏️</a>
                <a href="/delete?id=${cust.custId}" onclick="return confirm('정말 삭제할까요?')">🗑️</a>
            </td>
        </tr>
    </c:forEach>
</table>
<%@ include file="../footer.jsp" %>



<%-- 상단 메뉴바 작동하게 하는 스크립트 --%>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>


</body>
</html>
