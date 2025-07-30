<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>주문하기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/vendor.css">
  <link rel="stylesheet" href="/style.css">
  <%@ include file="/views/icons.jsp" %>
  <style>
    body { font-family: 'Open Sans', sans-serif; font-size: 17px; padding: 8px; }
    .container-box { background: #f2f2f2; padding: 20px; border: 1px solid lightgray; border-radius: 3px; }
    .icon-container i { margin-right: 8px; }
    span.price { float: right; color: grey; }
    @media (max-width: 800px) { .row { flex-direction: column-reverse; } }
  </style>
</head>
<body>

<jsp:include page="../header.jsp" />

<%-- 1) 총액 계산 (할인 적용된 가격 기준) --%>
<c:set var="total" value="0" />
<c:forEach var="c" items="${carts}">
  <c:set var="discountedPrice" value="${c.productPrice * (1 - (c.discountRate / 100.0))}" />
  <c:set var="subtotal" value="${discountedPrice * c.productQt}" />
  <c:set var="total" value="${total + subtotal}" />
</c:forEach>

<div class="container mt-4">
  <h2>주문 정보 입력</h2>
  <p>
    <strong>총 결제금액: </strong>
    <span class="price">
      <b><fmt:formatNumber value="${total}" type="number" />원</b>
    </span>
  </p>

  <form action="<c:url value='/create'/>" method="post">
    <input type="hidden" name="custId" value="${logincust.custId}" />
    <input type="hidden" id="totalPriceHidden" name="totalPrice" />

    <%-- 3) JS로 totalPriceHidden 에 쉼표 없는 정수값 세팅 --%>
    <script>
      document.addEventListener("DOMContentLoaded", function() {
        var raw = "${total}";
        document.getElementById("totalPriceHidden").value = parseInt(raw);
      });
    </script>

    <div class="row">
      <div class="col-md-8">
        <div class="container-box">
          <h4>배송 정보</h4>
          <label for="receiverName">수령자 이름</label>
          <input type="text" name="receiverName" id="receiverName" class="form-control mb-3" required>

          <label for="receiverPhone">연락처</label>
          <input type="text" name="receiverPhone" id="receiverPhone" class="form-control mb-3" required>

          <label for="addressId">배송지 선택</label>
          <select id="addressId" name="addressId" class="form-select mb-3">
            <option value="">직접 입력</option>
            <c:forEach var="a" items="${addresses}">
              <option value="${a.addressId}">${a.addressName} — ${a.addressDetail}</option>
            </c:forEach>
          </select>

          <label for="receiverAddress">배송 주소</label>
          <input type="text" name="receiverAddress" id="receiverAddress" class="form-control mb-3" placeholder="직접 입력할 경우 작성하세요" required>

          <h4 class="mt-4">결제 정보</h4>
          <label>결제 수단</label>
          <div class="icon-container mb-3">
            <i class="fa fa-cc-visa" style="color:navy;"></i>
            <i class="fa fa-cc-amex" style="color:blue;"></i>
            <i class="fa fa-cc-mastercard" style="color:red;"></i>
            <i class="fa fa-cc-discover" style="color:orange;"></i>
          </div>

          <label for="cardName">카드 소유자 이름</label>
          <input type="text" name="cardName" id="cardName" class="form-control mb-3" placeholder="홍길동" required>

          <label for="cardNumber">카드 번호</label>
          <input type="text" name="cardNumber" id="cardNumber" class="form-control mb-3" placeholder="1111-2222-3333-4444" required>

          <div class="d-flex gap-3 mb-3">
            <div class="flex-fill">
              <label for="expMonth">만료 월</label>
              <input type="text" name="expMonth" id="expMonth" class="form-control" placeholder="MM" required>
            </div>
            <div class="flex-fill">
              <label for="expYear">만료 년</label>
              <input type="text" name="expYear" id="expYear" class="form-control" placeholder="YYYY" required>
            </div>
            <div class="flex-fill">
              <label for="cvv">CVV</label>
              <input type="text" name="cvv" id="cvv" class="form-control" placeholder="123" required>
            </div>
          </div>
<%--카드 폼 체크--%>
          <div class="form-check my-3">
            <input type="checkbox" id="loadSavedCard" class="form-check-input">
            <label for="loadSavedCard" class="form-check-label">저장된 결제정보 불러오기</label>
          </div>
          <div class="form-check mt-3">
            <input type="checkbox" class="form-check-input" id="sameadr" name="sameadr" checked>
            <label class="form-check-label" for="sameadr">배송지와 결제지 동일</label>
          </div>
        </div>
      </div>

      <div class="col-md-4">
        <div class="container-box">
          <h4>장바구니 (총 <b>${fn:length(carts)}</b>개)</h4>
          <hr>
          <c:forEach var="c" items="${carts}">
            <c:set var="disc" value="${c.productPrice * (1 - (c.discountRate/100.0))}" />
            <p>${c.productName} (x${c.productQt})
              <span class="price">
                <fmt:formatNumber value="${disc * c.productQt}" type="number" />원
              </span>
            </p>
          </c:forEach>
          <hr>
          <p><strong>총 결제금액</strong>
            <span class="price">
              <b><fmt:formatNumber value="${total}" type="number" />원</b>
            </span>
          </p>
          <button type="submit" class="btn btn-warning w-100 mt-2">주문하기</button>
        </div>
      </div>
    </div>
  </form>
</div>

<script>
  const sel = document.getElementById('addressId');
  const addrInput = document.getElementById('receiverAddress');
  sel.addEventListener('change', () => {
    const opt = sel.selectedOptions[0];
    if (opt.value) {
      addrInput.value = opt.text.split(' — ')[1] || '';
      addrInput.readOnly = true;
    } else {
      addrInput.readOnly = false;
      addrInput.value = '';
    }
  });
</script>

<jsp:include page="../footer.jsp" />
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const checkbox = document.getElementById("loadSavedCard");

    checkbox.addEventListener("change", function () {
      if (this.checked) {
        fetch("/paymentinfo")
          .then(response => {
            if (!response.ok) throw new Error("HTTP error " + response.status);
            return response.json();
          })
          .then(data => {
            if (!data) return;

            document.querySelector("input[name='cardName']").value   = data.cardName || '';
            document.querySelector("input[name='cardNumber']").value = data.cardNumber || '';
            document.querySelector("input[name='expMonth']").value   = data.expMonth || '';
            document.querySelector("input[name='expYear']").value    = data.expYear || '';
            document.querySelector("input[name='cvv']").value        = data.cvv || '';
          })
          .catch(err => {
            alert("결제정보를 불러오지 못했습니다.");
            console.error("결제정보 오류:", err);
          });
      }
    });
  });
</script>

</body>
</html>
