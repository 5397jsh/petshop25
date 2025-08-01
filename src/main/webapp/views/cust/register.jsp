<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <%@ include file="/views/icons.jsp" %>

  <style>
    input.form-control, textarea.form-control {
      color: #212529;
    }
  </style>

</head>
<body>

<%@ include file="../header.jsp" %>
<div class="container" style="max-width: 600px; margin-top: 50px; font-family: 'Open Sans', sans-serif; color: #212529;">
 <h2 class="mb-4">회원가입 페이지</h2>

  <!-- 경고 메시지 출력 -->
  <c:if test="${not empty msg}">
    <div class="alert alert-danger mt-3">${msg}</div>
  </c:if>

  <form action="/mainregisterimpl" method="post">
    <div class="mb-3">
              <label for="custId" class="form-label">아이디</label>
              <input type="text" class="form-control" id="custId" name="custId"
                     placeholder="아이디 입력" value="${cust.custId}"
                     required minlength="1" maxlength="30"
                     oninvalid="this.setCustomValidity('아이디는 1~30자 사이여야 합니다')"
                     oninput="this.setCustomValidity('')">
            </div>

            <div class="mb-3">
              <label for="custPwd" class="form-label">비밀번호</label>
              <input type="password" class="form-control" id="custPwd" name="custPwd"
                     placeholder="비밀번호 입력" value="${cust.custPwd}"
                     required minlength="1" maxlength="20"
                     oninvalid="this.setCustomValidity('비밀번호는 1~20자 사이여야 합니다')"
                     oninput="this.setCustomValidity('')">
            </div>

            <div class="mb-3">
              <label for="custName" class="form-label">이름</label>
              <input type="text" class="form-control" id="custName" name="custName"
                     placeholder="이름 입력" value="${cust.custName}"
                     required maxlength="20"
                     oninvalid="this.setCustomValidity('이름은 1~20자 이내여야 합니다')"
                     oninput="this.setCustomValidity('')">
            </div>

            <div class="mb-3">
              <label for="custMail" class="form-label">이메일 주소</label>
              <input type="email" class="form-control" id="custMail" name="custMail"
                     placeholder="이메일 입력" value="${cust.custMail}"
                     required maxlength="50"
                     oninvalid="this.setCustomValidity('유효한 이메일 형식으로 50자 이내로 입력해주세요')"
                     oninput="this.setCustomValidity('')">
            </div>

            <div class="mb-3">
              <label for="custPhone" class="form-label">휴대폰 번호</label>
              <input type="text" class="form-control" id="custPhone" name="custPhone"
                     placeholder="예시) 010-1234-5678"
                     value="${cust.custPhone}"
                     required maxlength="15"
                     pattern="^010-\d{4}-\d{4}$"
                     title="010-1234-5678 형식으로 입력해주세요."
                     oninvalid="this.setCustomValidity('010-1234-5678 형식으로 입력해주세요')"
                     oninput="this.setCustomValidity('')">
            </div>

    <button type="submit" class="btn w-100" style="background-color: #ffc107; color: black;">회원가입</button>
  </form>

  <div class="container signin mt-4 text-center">
    <p>이미 계정이 있으신가요?
      <a href="/login" class="text-primary fw-bold">로그인</a>
    </p>
  </div>
</div>

<%@ include file="../footer.jsp" %>

<!-- JS -->
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>

</body>
</html>