<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>배송지 등록/수정</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="/views/header.jsp"/>

<main class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card shadow-lg">
        <div class="card-header bg-white text-center">
          <h2 class="fw-bold mb-0">
            <c:choose>
              <c:when test="${address.addressId != 0}">배송지 수정</c:when>
              <c:otherwise>새 배송지 등록</c:otherwise>
            </c:choose>
          </h2>
        </div>
        <div class="card-body p-4">
          <form action="<c:choose>
                              <c:when test='${address.addressId != 0}'><c:url value='/mypage/address/edit'/></c:when>
                              <c:otherwise><c:url value='/mypage/address/add'/></c:otherwise>
                            </c:choose>"
                method="post">
            <!-- 수정 시 주소Id 전달 -->
            <c:if test="${address.addressId != 0}">
              <input type="hidden" name="addressId" value="${address.addressId}"/>
            </c:if>

            <div class="mb-3">
              <label for="addressName" class="form-label">별칭</label>
              <input type="text" id="addressName" name="addressName"
                     class="form-control form-control-lg" required
                     value="${address.addressName}" placeholder="집, 회사 등" />
            </div>

            <div class="mb-3">
              <label for="addressDetail" class="form-label">주소</label>
              <input type="text" id="addressDetail" name="addressDetail"
                     class="form-control form-control-lg" required
                     value="${address.addressDetail}" placeholder="도로명, 지번 입력" />
            </div>

            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-primary btn-lg">
                <c:choose>
                  <c:when test="${address.addressId != 0}">수정 완료</c:when>
                  <c:otherwise>등록 완료</c:otherwise>
                </c:choose>
              </button>
              <a href="<c:url value='/mypage/addresses'/>"
                 class="btn btn-outline-secondary btn-lg">취소</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</main>

<jsp:include page="/views/footer.jsp"/>
</body>
</html>
