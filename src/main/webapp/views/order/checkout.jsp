<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
  <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="/views/icons.jsp" %>
  <style>
    body { font-family: Arial; font-size: 17px; padding: 8px; }
    * { box-sizing: border-box; }
    .row { display: flex; flex-wrap: wrap; margin: 0 -16px; }
    .col-25 { flex: 25%; }
    .col-50 { flex: 50%; }
    .col-75 { flex: 75%; }
    .col-25, .col-50, .col-75 { padding: 0 16px; }
    .container {
      background-color: #f2f2f2; padding: 5px 20px 15px 20px;
      border: 1px solid lightgrey; border-radius: 3px;
    }
    input[type=text] {
      width: 100%; margin-bottom: 20px; padding: 12px;
      border: 1px solid #ccc; border-radius: 3px;
    }
    label { margin-bottom: 10px; display: block; }
    .icon-container {
      margin-bottom: 20px; padding: 7px 0; font-size: 24px;
    }
    hr { border: 1px solid lightgrey; }
    span.price { float: right; color: grey; }
    @media (max-width: 800px) {
      .row { flex-direction: column-reverse; }
      .col-25 { margin-bottom: 20px; }
    }
  </style>
</head>
<body>

<%@ include file="../header.jsp" %>

<%-- 총액 계산: 할인 적용된 가격 기준 --%>
<c:set var="total" value="0" />
<c:forEach var="c" items="${carts}">
  <c:set var="discountedPrice" value="${c.productPrice * (1 - (c.discountRate / 100.0))}" />
  <c:set var="subtotal" value="${discountedPrice * c.productQt}" />
  <c:set var="total" value="${total + subtotal}" />
</c:forEach>

<div class="container" style="font-family: 'Open Sans', sans-serif; color: #212529;">
  <h2>주문 정보 입력</h2>

  <form action="/create" method="post">
    <input type="hidden" name="custId" value="${logincust.custId}">
    <input type="hidden" name="totalPrice" value="${total}">

    <div class="row">
      <div class="col-75">
        <div class="container">
          <div class="row">
            <div class="col-50">
              <h3>배송 정보</h3>
              <label for="receiverName"><i class="fa fa-user"></i> 수령자 이름</label>
              <input type="text" id="receiverName" name="receiverName" required>

              <label for="receiverPhone"><i class="fa fa-phone"></i> 연락처</label>
              <input type="text" id="receiverPhone" name="receiverPhone" required>

              <label for="receiverAddress"><i class="fa fa-address-card-o"></i> 배송 주소</label>
              <input type="text" id="receiverAddress" name="receiverAddress" required>
            </div>

            <div class="col-50">
              <h3>결제 정보</h3>
              <label for="cardtype">결제 수단</label>
              <div class="icon-container">
                <i class="fa fa-cc-visa" style="color:navy;"></i>
                <i class="fa fa-cc-amex" style="color:blue;"></i>
                <i class="fa fa-cc-mastercard" style="color:red;"></i>
                <i class="fa fa-cc-discover" style="color:orange;"></i>
              </div>

              <label for="cname">카드 소유자 이름</label>
              <input type="text" id="cname" name="cardname" placeholder="홍길동">

              <label for="ccnum">카드 번호</label>
              <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">

              <label for="expmonth">만료 월</label>
              <input type="text" id="expmonth" name="expmonth" placeholder="12">

              <div class="row">
                <div class="col-50">
                  <label for="expyear">만료 년</label>
                  <input type="text" id="expyear" name="expyear" placeholder="2025">
                </div>
                <div class="col-50">
                  <label for="cvv">CVV</label>
                  <input type="text" id="cvv" name="cvv" placeholder="123">
                </div>
              </div>
            </div>
          </div>

          <label>
            <input type="checkbox" checked="checked" name="sameadr"> 배송지와 결제지 동일
          </label>
        </div>
      </div>

      <div class="col-25">
        <div class="container">
          <h4>장바구니 <span class="price" style="color:black;"><i class="fa fa-shopping-cart"></i> <b>${fn:length(carts)}</b></span></h4>
          <c:forEach var="c" items="${carts}">
            <c:set var="discountedPrice" value="${c.productPrice * (1 - (c.discountRate / 100.0))}" />
            <p>
              <a>${c.productName} (x${c.productQt})</a>
              <span class="price"><fmt:formatNumber value="${discountedPrice * c.productQt}" type="number" /></span>
            </p>
          </c:forEach>
          <hr>
          <p>총 결제금액
            <span class="price" style="color:black;">
              <b><fmt:formatNumber value="${total}" type="number" />원</b>
            </span>
          </p>

          <div style="text-align: right;">
            <input type="submit" value="주문하기" class="btn btn-warning mt-3" style="background-color: #ffc107; color: black;">
          </div>
        </div>
      </div>
    </div>
  </form>
</div>

<%@ include file="../footer.jsp" %>

<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
</body>
</html>
