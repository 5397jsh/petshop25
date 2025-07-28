<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>전체 상품</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">




  <html>
  <head>
    <meta charset="UTF-8">
    <title>전체 상품</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">


  <%@ include file="/views/icons.jsp" %>

</head>
<body>

<%@ include file="../header.jsp" %>

  <main class="container">
    <h1>전체 상품 페이지</h1>
    <p>여기에 전체 상품들을 나열하면 됩니다.</p>
    <a href="/product/add" class="btn btn-success mb-3">상품 등록</a>
    <div class="row">
  <c:forEach var="p" items="${products}">
    <div class="col-md-3 mb-4">
      <div class="card">
        <img src="/images/${p.productImg}" class="card-img-top" alt="${p.productName}" style="height: 200px; object-fit: cover;">
        <div class="card-body">
          <h5 class="card-title">${p.productName}</h5>
          <p class="card-text">
            <fmt:formatNumber value="${p.productPrice}" pattern="###,###"/>원
          </p>
          <p class="card-text">
            할인율: ${p.discountRate}%
          </p>
          <a href="/productitem/detail?id=${p.productId}" class="btn btn-primary">상세보기</a>
        </div>
      </div>
    </div>
  </c:forEach>
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
