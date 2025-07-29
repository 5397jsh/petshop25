<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <%@ include file="/views/icons.jsp" %>
</head>
<body>

<%@ include file="../header.jsp" %>

<main class="container mt-5">
    <h1 class="mb-4">장바구니</h1>

    <c:if test="${empty carts}">
        <p>장바구니가 비어 있습니다.</p>
    </c:if>

    <c:if test="${not empty carts}">
        <table class="table table-bordered align-middle text-center">
            <thead class="table-light">
                <tr>
                    <th>이미지</th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>총합</th>
                    <td>삭제</td>
                </tr>
            </thead>
        <tbody>
            <c:forEach var="c" items="${carts}">
                <tr>
                    <td>
                        <img src="/images/${c.productImg}" width="80" height="80" style="object-fit: cover;">
                    </td>
                    <td>${c.productName}</td>
                    <c:set var="discountedPrice" value="${c.productPrice * (1 - (c.discountRate / 100.0))}" />
                    <td><fmt:formatNumber value="${discountedPrice}" type="number"/> 원</td>

                    <!-- 수량 수정 입력창 -->
                    <td>
                      <form action="/cart/update" method="post" class="d-flex justify-content-center align-items-center" onsubmit="return validateSubmit(this)">
                        <input type="hidden" name="custId" value="${c.custId}">
                        <input type="hidden" name="productId" value="${c.productId}">

                        <button type="button" class="btn btn-outline-secondary btn-sm" onclick="decreaseQty(this)">-</button>

                        <input type="text" name="productQt" value="${c.productQt}"
                               class="form-control text-center mx-1"
                               style="width: 50px;"
                               readonly> <!-- ✅ 입력 막기 -->

                        <button type="button" class="btn btn-outline-secondary btn-sm" onclick="increaseQty(this)">+</button>

                        <button type="submit" class="btn btn-outline-success btn-sm ms-2">수정</button>
                      </form>
                    </td>

                    <c:set var="discountedPrice" value="${c.productPrice * (1 - (c.discountRate / 100.0))}" />
                    <td><fmt:formatNumber value="${discountedPrice * c.productQt}" type="number" /> 원</td>


                    <!-- 삭제 버튼 -->
                    <td>
                        <form action="/cart/delete" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                            <input type="hidden" name="cartId" value="${c.cartId}">
                            <input type="hidden" name="custId" value="${c.custId}">
                            <input type="hidden" name="productId" value="${c.productId}">
                            <button type="submit" class="btn btn-outline-danger btn-sm">삭제</button>
                        </form>

                    </td>
                </tr>
            </c:forEach>
        </tbody>

        <%--  장바구니 총 가격  --%>
        <c:set var="totalPrice" value="0" />
        <c:forEach var="c" items="${carts}">
            <c:set var="discountedPrice" value="${c.productPrice * (1 - (c.discountRate / 100.0))}" />
            <c:set var="subtotal" value="${discountedPrice * c.productQt}" />
            <c:set var="totalPrice" value="${totalPrice + subtotal}" />
        </c:forEach>

        </table>
                <!-- 장바구니 리스트 아래쪽 -->
            <div class="d-flex justify-content-end align-items-center gap-3 mt-4">
              <h5 class="m-0">
                총 주문 금액:
                <fmt:formatNumber value="${totalPrice}" type="number" /> 원
              </h5>
              <form action="checkout" method="get" class="m-0">
                  <input type="hidden" name="custId" value="${logincust.custId}">
                  <button class="btn btn-primary">주문하기</button>
              </form>
            </div>
    </c:if>
</main>

<%@ include file="../footer.jsp" %>

<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>

<script>
    function decreaseQty(btn) {
        const input = btn.parentNode.querySelector('input[name="productQt"]');
        let val = parseInt(input.value) || 1;
        if (val > 1) input.value = val - 1;
    }

    function increaseQty(btn) {
        const input = btn.parentNode.querySelector('input[name="productQt"]');
        let val = parseInt(input.value) || 1;
        input.value = val + 1;
    }

    function validateSubmit(form) {
        const input = form.querySelector('input[name="productQt"]');
        const val = parseInt(input.value);
        if (isNaN(val) || val < 1) {
            alert("수량은 1 이상이어야 합니다.");
            return false;
        }
        return true;
    }
</script>



</body>
</html>