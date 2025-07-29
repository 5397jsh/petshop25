<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-5">
  <h2>상품 수정</h2>
  <!-- enctype 필수! -->
  <form action="/product/editimpl" method="post" enctype="multipart/form-data">
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
