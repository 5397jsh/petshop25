<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>제품 상세보기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&amp;family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet">
  <%@ include file="/views/icons.jsp" %>
</head>
<body>

<%@ include file="../header.jsp" %>

<main class="container my-5">
  <h1>제품 상세 정보</h1>
  <div class="row mt-4">
    <div class="col-md-6">
      <img src="/images/${product.productImg}"
           alt="${product.productName}"
           class="img-fluid rounded"
           style="max-width:100%;max-height:400px;object-fit:contain;" />
    </div>
    <div class="col-md-6">
      <h2>${product.productName}</h2>

      <%-- 가격 표시: 할인율이 있을 때만 취소선 + 할인가, 없으면 일반가 --%>
      <c:choose>
        <c:when test="${product.discountRate > 0}">
          <c:set var="discountedPrice"
                 value="${product.productPrice * (1 - (product.discountRate / 100.0))}" />
          <p class="card-text">
            <!-- 원래 가격(취소선) -->
            <del class="text-muted">
              <fmt:formatNumber value="${product.productPrice}" pattern="###,###"/>원
            </del>
            <!--→ 화살표는 me-2로 간격 주기-->
            <span class="mx-2">→</span>
            <!-- 할인가 -->
            <span class="card-text fw-bold">
              <fmt:formatNumber value="${discountedPrice}" pattern="###,###"/>원
            </span>
          </p>
          <p>
            <strong>할인율:</strong>
            <fmt:formatNumber value="${product.discountRate}" pattern="###"/>%
          </p>
        </c:when>

        <c:otherwise>
          <p>
            <strong>가격:</strong>
            <fmt:formatNumber value="${product.productPrice}" pattern="###,###"/>원
          </p>
        </c:otherwise>
      </c:choose>
      <%-- /가격 표시 --%>

      <c:if test="${sessionScope.logincust.custId == 'admin'}">
        <p><strong>카테고리 ID:</strong> ${product.cateId}</p>
      </c:if>

      <!-- 장바구니 담기 폼 -->
      <form action="/cart/add" method="post" class="mt-4">
        <input type="hidden" name="productId"   value="${product.productId}" />
        <input type="hidden" name="productName" value="${product.productName}" />
        <input type="hidden" name="productPrice" value="${product.productPrice}" />
        <input type="hidden" name="discountRate" value="${product.discountRate}" />
        <input type="hidden" name="productImg"   value="${product.productImg}" />

        <div class="mb-3">
          <label for="quantity" class="form-label">수량</label>
          <div class="input-group" style="width:140px;">
            <button type="button" class="btn btn-outline-secondary" id="qty-minus">−</button>
            <input type="text" id="quantity" name="quantity"
                   class="form-control text-center" value="1" readonly />
            <button type="button" class="btn btn-outline-secondary" id="qty-plus">＋</button>
          </div>
        </div>

        <button type="submit" class="btn btn-primary me-2">
          <svg width="16" height="16" class="me-1"><use xlink:href="#cart"/></svg>
          장바구니에 담기
        </button>
        <a href="/product" class="btn btn-secondary">목록으로</a>
      </form>

    </div>
  </div>
</main>

<%@ include file="../footer.jsp" %>

<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // 수량 조절 버튼
  $(function(){
    $('#qty-minus').click(function(){
      let $q = $('#quantity'), v = parseInt($q.val());
      if(v>1) $q.val(v-1);
    });
    $('#qty-plus').click(function(){
      let $q = $('#quantity');
      $q.val(parseInt($q.val())+1);
    });
  });
</script>

</body>
</html>
