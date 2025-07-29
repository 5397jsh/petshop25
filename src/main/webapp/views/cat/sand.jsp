<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>고양이 모래</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">


    <%@ include file="/views/icons.jsp" %>

</head>
<body>

<%@ include file="../header.jsp" %>

<main class="container">
    <div class="container">
  <h2>고양이 모래</h2>
  <div class="row">
    <c:forEach var="p" items="${products}">
      <div class="col-md-3 mb-4">
        <div class="card">
         <img src="/images/${p.productImg}" class="card-img-top" alt="${p.productName}" style="height: 200px; object-fit: cover;">
          <div class="card-body">
            <h5 class="card-title">${p.productName}</h5>
            <p><fmt:formatNumber value="${p.productPrice}" pattern="###,###원" /></p>
            <p>할인율: ${p.discountRate}</p>
            <a href="/product/detail?id=${p.productId}" class="btn btn-primary btn-sm">상세보기</a>
            <c:if test="${sessionScope.logincust.custId == 'admin'}">
                <a href="/product/update?id=${p.productId}" class="btn btn-warning btn-sm">수정</a>
                <a href="/product/delete?id=${p.productId}" class="btn btn-danger btn-sm">삭제</a>
            </c:if>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
</main>

<%@ include file="../footer.jsp" %>

<%-- 상단 메뉴바 작동하게 하는 스크립트 --%>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>

</body>
</html>
