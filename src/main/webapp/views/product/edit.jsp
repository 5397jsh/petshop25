<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>상품 수정</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">


  <%@ include file="/views/icons.jsp" %>

</head>
<body>

<%@ include file="../header.jsp" %>
<div class="container mt-5">
  <h2>상품 수정</h2>
  <!-- enctype 필수! -->
  <form action="/product/editimpl" method="post" enctype="multipart/form-data"style="max-width:600px;">
    <input type="hidden" name="productId" value="${product.productId}"/>

    <div class="mb-3">
      <label class="form-label">상품명</label>
      <input type="text" name="productName" class="form-control" value="${product.productName}" required/>
    </div>

    <div class="mb-3">
      <label class="form-label">가격</label>
      <input type="number" name="productPrice" class="form-control" value="${product.productPrice}" required/>
    </div>

    <div class="mb-3">
      <label class="form-label">카테고리 ID</label>
      <input type="number" name="cateId" class="form-control" value="${product.cateId}" required/>
    </div>

    <div class="mb-3">
      <label class="form-label">기존 이미지</label><br/>
      <img src="/images/${product.productImg}" alt="기존 이미지" style="width: 150px; height: auto;"/>
    </div>

    <div class="mb-3">
      <label class="form-label">새 이미지 업로드</label>
      <input type="file" name="productImgFile" class="form-control"/>
    </div>

    <div class="mb-3">
      <label class="form-label">할인율 (%)</label>
      <input type="number" step="0.1" name="discountRate" class="form-control" value="${product.discountRate}" />
    </div>

    <button type="submit" class="btn btn-primary">수정 완료</button>
    <a href="/product" class="btn btn-secondary">취소</a>
  </form>
</div>

</body>
</html>
<%@ include file="../footer.jsp" %>
<%-- 상단 메뉴바를 눌렀을때 작동하게 되는 script --%>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
</body>
</html>
