<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>제품 상세보기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">


  <%@ include file="/views/icons.jsp" %>

</head>
<body>

<%@ include file="../header.jsp" %>

<main class="container">
  <h1>제품 상세 정보</h1>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-6">
        <img src="/images/${product.productImg}" alt="${product.productName}"
             class="img-fluid rounded"
             style="max-width: 100%; height: auto; max-height: 400px;" />

      </div>

      <div class="col-md-6">
        <h2>${product.productName}</h2>
        <p><strong>가격:</strong> ${product.productPrice}원</p>
        <p><strong>할인율:</strong> ${product.discountRate}%</p>
        <c:if test="${sessionScope.logincust.custId == 'admin'}">
        <p><strong>카테고리 ID:</strong> ${product.cateId}</p>
        </c:if>



        <!-- 장바구니 추가 폼 -->
        <form action="/cart/add" method="post">
          <input type="hidden" name="productId" value="${product.productId}" />
          <input type="hidden" name="productName" value="${product.productName}" />
          <input type="hidden" name="productPrice" value="${product.productPrice}" />
          <input type="hidden" name="productImg" value="${product.productImg}" />

          <div class="mb-3">
            <label for="quantity" class="form-label">수량</label>
            <input type="number" id="quantity" name="quantity" value="1" min="1" class="form-control" required />
          </div>

          <button type="submit" class="btn btn-warning">장바구니에 담기</button>
          <a href="/product" class="btn btn-secondary">목록으로</a>
        </form>
      </div>
    </div>
  </div>

</main>

<%@ include file="../footer.jsp" %>
<%-- 상단 메뉴바를 눌렀을때 작동하게 되는 script --%>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
</body>
</html>
