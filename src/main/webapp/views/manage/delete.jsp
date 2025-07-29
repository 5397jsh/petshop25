<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-5">
    <h2>회원 삭제 확인</h2>

    <p><strong>${cust.custId}</strong>회원 정보를 정말 삭제하시겠습니까?</p>

    <form action="/manage/deleteimpl" method="post">
        <input type="hidden" name="productId" value="${product.productId}" />
        <button type="submit">삭제</button>
    </form>

</div>
