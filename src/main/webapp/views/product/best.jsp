<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>베스트상품</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/vendor.css">
  <link rel="stylesheet" href="/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
  <%@ include file="/views/icons.jsp" %>
</head>
<body>
  <%@ include file="../header.jsp" %>

  <main class="container">
    <h1 class="mb-4">베스트 상품</h1>
    <div class="row">
      <c:forEach var="p" items="${products}">
        <div class="col-md-3 mb-4">
          <div class="card h-100">
            <img src="/images/${p.productImg}"
                 class="card-img-top"
                 alt="${p.productName}"
                 style="height:200px;object-fit:cover;" />
            <div class="card-body d-flex flex-column">
              <h5 class="card-title">${p.productName}</h5>

              <c:choose>
                <c:when test="${p.discountRate > 0}">
                  <p class="card-text mb-2">
                    <span class="text-decoration-line-through text-muted">
                      <fmt:formatNumber value="${p.productPrice}" pattern="###,###"/>원
                    </span>
                    <span class="card-text fw-bold ms-2">
                      <fmt:formatNumber value="${p.productPrice * (1 - p.discountRate/100)}" pattern="###,###"/>원
                    </span>
                  </p>
                  <p class="text-muted mb-3">
                    할인율: <fmt:formatNumber value="${p.discountRate}" pattern="###"/>%
                  </p>
                </c:when>
                <c:otherwise>
                  <p class="card-text fw-bold mb-3">
                    <fmt:formatNumber value="${p.productPrice}" pattern="###,###"/>원
                  </p>
                </c:otherwise>
              </c:choose>

              <!-- 할인 여부와 상관없이 모든 카드에 주문수 표시 -->
              <p class="card-text text-muted mb-3">
                주문수: <strong>${p.soldQty}</strong>회
              </p>

              <div class="mt-auto">
                <a href="/product/detail?id=${p.productId}" class="btn btn-primary btn-sm me-1">상세보기</a>
                <c:if test="${sessionScope.logincust.custId == 'admin'}">
                  <a href="/product/update?id=${p.productId}" class="btn btn-warning btn-sm me-1">수정</a>
                  <a href="/product/delete?id=${p.productId}" class="btn btn-danger btn-sm">삭제</a>
                </c:if>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </main>

  <%@ include file="../footer.jsp" %>

  <script src="/js/jquery-1.11.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/js/plugins.js"></script>
  <script src="/js/script.js"></script>
</body>
</html>
