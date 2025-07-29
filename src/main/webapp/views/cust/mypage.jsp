<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 마이페이지 본문 -->
<html>
<head>
  <meta charset="UTF-8">
  <title>마이페이지</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

  <%@ include file="/views/icons.jsp" %>

</head>
<body style="font-family: 'Open Sans', sans-serif; color: #212529;">

<%@ include file="../header.jsp" %>

<main class="container">

  <c:if test="${not empty msg}">
    <div class="alert alert-success mt-3">${msg}</div>
  </c:if>

  <h1>내 정보 페이지</h1>
  <p><strong>아이디:</strong> ${logincust.custId}</p>
  <p><strong>이름:</strong> ${logincust.custName}</p>
  <p><strong>이메일:</strong> ${logincust.custMail}</p>
  <p><strong>전화번호:</strong> ${logincust.custPhone}</p>
  <p><strong>가입일: <fmt:formatDate value="${logincust.custRegdate}" pattern="yyyy-MM-dd"/></strong></p>

<%-- 수정, 탈퇴 버튼 --%>
  <div class="text-end mt-4">
    <a href="/cust/update" class="btn btn-outline-primary me-2">회원 정보 수정</a>
    <a href="/cust/delete" class="btn btn-outline-danger"
       onclick="return confirm('정말로 탈퇴하시겠습니까?')">회원 탈퇴</a>
  </div>

</main>

<%-- 상단 메뉴바를 눌렀을때 작동하게 되는 script --%>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>

<%@ include file="../footer.jsp" %>


</body>
</html>
