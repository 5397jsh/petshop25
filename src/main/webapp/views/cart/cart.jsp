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
                    <th>추가일</th>
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
                    <td><fmt:formatNumber value="${c.productPrice}" type="number"/> 원</td>

                    <!-- 수량 수정 입력창 -->
                    <td>
                        <form action="/cart/update" method="post" class="d-flex justify-content-center align-items-center">
                            <input type="hidden" name="custId" value="${c.custId}">
                            <input type="hidden" name="productId" value="${c.productId}">
                            <input type="number" name="productQt" value="${c.productQt}" min="1" class="form-control" style="width: 70px; margin-right: 5px;">
                            <button type="submit" class="btn btn-outline-secondary btn-sm">수정</button>
                        </form>
                    </td>

                    <td><fmt:formatNumber value="${c.productPrice * c.productQt}" type="number"/> 원</td>
                    <td><fmt:formatDate value="${c.cartRegdate}" pattern="yyyy-MM-dd HH:mm"/></td>

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

        </table>
    </c:if>
</main>

<%@ include file="../footer.jsp" %>

<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
</body>
</html>
