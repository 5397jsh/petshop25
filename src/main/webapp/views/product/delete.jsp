<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-5">
  <h2>상품 삭제 확인</h2>

  <p><strong>${product.productName}</strong> 상품을 정말 삭제하시겠습니까?</p>

  <form action="/product/deleteimpl" method="post">
    <input type="hidden" name="productId" value="${product.productId}" />
    <button type="submit">삭제</button>
  </form>

</div>
