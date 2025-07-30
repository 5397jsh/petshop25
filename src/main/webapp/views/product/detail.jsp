<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>제품 상세보기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="/css/vendor.css" />
  <link rel="stylesheet" href="/style.css" />
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&amp;family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
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
           style="max-width:100%; max-height:400px; object-fit:contain;" />
    </div>
    <div class="col-md-6">
      <h2>${product.productName}</h2>

      <!-- 가격 표시 -->
      <c:choose>
        <c:when test="${product.discountRate > 0}">
          <c:set var="discountedPrice" value="${product.productPrice * (1 - (product.discountRate / 100.0))}" />
          <p class="card-text">
            <del class="text-muted">
              <fmt:formatNumber value="${product.productPrice}" pattern="###,###"/>원
            </del>
            <span class="mx-2">→</span>
            <span class="card-text fw-bold">
              <fmt:formatNumber value="${discountedPrice}" pattern="###,###"/>원
            </span>
          </p>
          <p><strong>할인율:</strong> <fmt:formatNumber value="${product.discountRate}" pattern="###"/>%</p>
        </c:when>
        <c:otherwise>
          <p><strong>가격:</strong> <fmt:formatNumber value="${product.productPrice}" pattern="###,###"/>원</p>
        </c:otherwise>
      </c:choose>
      <!-- /가격 표시 -->

      <!-- 관리자만 카테고리 표시 -->
      <c:if test="${sessionScope.logincust.custId == 'admin'}">
        <p><strong>카테고리:</strong> ${category.cateUp} &gt; ${category.cateDown}</p>
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
            <input type="text" id="quantity" name="quantity" class="form-control text-center" value="1" readonly />
            <button type="button" class="btn btn-outline-secondary" id="qty-plus">＋</button>
          </div>
        </div>

        <button type="submit" class="btn btn-primary me-2">
          <svg width="16" height="16" class="me-1"><use xlink:href="#cart"/></svg> 장바구니에 담기
        </button>
        <a href="/product" class="btn btn-secondary">목록으로</a>
      </form>
    </div>
  </div>

  <!-- 리뷰 섹션 -->
  <section class="mt-5">
    <h4>리뷰 (${fn:length(reviews)})</h4>

    <!-- 리뷰 쓰기 폼 (로그인 시만) -->
    <c:if test="${not empty newReview}">
      <form action="/product/detail/${product.productId}/review" method="post" class="mb-4">
        <input type="hidden" name="productId" value="${newReview.productId}" />
        <input type="hidden" name="custId"    value="${newReview.custId}" />
        <div class="mb-2">
          <label>별점:</label>
          <select name="rating" required>
            <option value="">선택</option>
            <c:forEach begin="1" end="5" var="i">
              <option value="${i}">${i}점</option>
            </c:forEach>
          </select>
        </div>
        <div class="mb-2">
          <textarea name="comment" class="form-control" rows="3" placeholder="리뷰를 입력하세요" required></textarea>
        </div>
        <button class="btn btn-sm btn-primary">등록</button>
      </form>
    </c:if>

    <!-- 리뷰 리스트 -->
    <c:forEach var="r" items="${reviews}">
      <div class="review-box p-3 mb-3" data-review-id="${r.reviewId}">
        <div class="d-flex align-items-center mb-2">
          <strong class="me-2">${r.custId}</strong>
          <span class="badge bg-warning text-dark me-3 review-rating">${r.rating}점</span>
          <small class="text-muted">${fn:replace(r.commDate,'T',' ')}</small>

          <c:if test="${sessionScope.logincust.custId eq r.custId}">
            <div class="ms-auto">
              <button type="button" class="btn btn-sm btn-outline-secondary edit-btn">수정</button>
              <form action="/product/detail/${product.productId}/review/${r.reviewId}/delete"
                    method="post" class="d-inline" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                <button type="submit" class="btn btn-sm btn-danger">삭제</button>
              </form>
            </div>
          </c:if>
        </div>

        <!-- display 모드 -->
        <div class="display-mode">
          <p class="review-comment">${r.comment}</p>
        </div>
        <!-- edit 모드 -->
        <div class="edit-mode d-none">
          <textarea class="form-control mb-2 edit-comment" rows="3">${r.comment}</textarea>
          <div class="text-end">
            <button type="button" class="btn btn-sm btn-primary save-btn">저장</button>
            <button type="button" class="btn btn-sm btn-secondary cancel-btn">취소</button>
          </div>
        </div>
      </div>
    </c:forEach>
  </section>
</main>

<%@ include file="../footer.jsp" %>

<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  $(function(){
    // 인라인 리뷰 수정 기능
    const productId = '${product.productId}';
    $('.edit-btn').click(function(){
      const box = $(this).closest('.review-box');
      box.find('.display-mode').hide();
      box.find('.edit-mode').removeClass('d-none');
    });
    $('.cancel-btn').click(function(){
      const box = $(this).closest('.review-box');
      box.find('.edit-mode').addClass('d-none');
      box.find('.display-mode').show();
    });
    $('.save-btn').click(function(){
      const box      = $(this).closest('.review-box');
      const reviewId = box.data('review-id');
      const comment  = box.find('.edit-comment').val();
      const rating   = box.find('.review-rating').text().replace('점','');
      $('<form>').attr({
        action: '/product/detail/' + productId + '/review/' + reviewId + '/edit',
        method: 'post'
      })
      .append($('<input>').attr({type:'hidden', name:'comment', value:comment}))
      .append($('<input>').attr({type:'hidden', name:'rating',  value:rating}))
      .appendTo('body')
      .submit();
    });

    // 수량 조절 기능
    $('#qty-minus').click(function(){
      let $q = $('#quantity'), v = parseInt($q.val());
      if(v > 1) $q.val(v - 1);
    });
    $('#qty-plus').click(function(){
      let $q = $('#quantity');
      $q.val(parseInt($q.val()) + 1);
    });
  });
</script>
</body>
</html>