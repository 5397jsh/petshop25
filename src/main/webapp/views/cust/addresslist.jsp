<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <%-- 배송지 관리 페이지 --%>
  <meta charset="UTF-8">
  <title>배송지 관리</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="/views/header.jsp"/>

<main class="container">
  <h1 class="fw-bold mt-4 mb-4">배송지 관리</h1>

  <a href="<c:url value='/mypage/address/add'/>"
     class="btn btn-primary mb-3">새 주소 등록</a>

  <div class="card shadow-sm mb-4">
    <div class="card-body p-0">
      <table class="table table-hover mb-0 align-middle">
        <thead class="table-light">
        <tr>
          <th scope="col">번호</th>
          <th scope="col">별칭</th>
          <th scope="col">주소</th>
          <th scope="col">동작</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="a" items="${addresses}">
          <tr>
            <td class="py-3 align-middle">${a.addressId}</td>
            <td class="py-3 align-middle">${a.addressName}</td>
            <td class="py-3 align-middle">${a.addressDetail}</td>
            <td class="py-3 align-middle">
              <a href="<c:url value='/mypage/address/edit?addressId=${a.addressId}'/>"
                 class="btn btn-sm btn-outline-primary me-2">수정</a>
              <a href="<c:url value='/mypage/address/delete?addressId=${a.addressId}'/>"
                 class="btn btn-sm btn-outline-danger"
                 onclick="return confirm('정말 삭제하시겠습니까?');">
                삭제
              </a>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty addresses}">
          <tr>
            <td colspan="4" class="text-center py-3">등록된 주소가 없습니다.</td>
          </tr>
        </c:if>
        </tbody>
      </table>
    </div>
  </div>
</main>

<jsp:include page="/views/footer.jsp"/>
</body>
</html>
