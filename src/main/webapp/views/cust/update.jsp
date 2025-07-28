<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

  <style>
    input.form-control:not([readonly]),
    textarea.form-control {
      color: #212529;
    }
  </style>

  <%@ include file="/views/icons.jsp" %>

</head>
<body style="font-family: 'Open Sans', sans-serif; color: #212529;">

<%@ include file="../header.jsp" %>

<main>
  <div class="container" style="max-width: 600px; margin-top: 50px;">
    <h2 class="mb-4">회원정보 수정</h2>

    <!-- 수정하는 폼 -->
    <form action="/cust/updateimpl" method="post">
      <div class="mb-3">
        <label for="custId" class="form-label">아이디</label>
        <input type="text" class="form-control"
               name="custId"
               value="${cust.custId}"
               readonly
               style="background-color: #e9ecef; color: #495057; font-weight: bold; cursor: not-allowed;"/>
      </div>

      <div class="mb-3">
        <label for="custPwd" class="form-label">비밀번호</label>
        <input type="password" class="form-control" id="custPwd" name="custPwd" value="${cust.custPwd}" required>
      </div>
      <div class="mb-3">
        <label for="custName" class="form-label">이름</label>
        <input type="text" class="form-control" id="custName" name="custName" value="${cust.custName}" required>
      </div>
      <div class="mb-3">
        <label for="custMail" class="form-label">이메일 주소</label>
        <input type="email" class="form-control" id="custMail" name="custMail" value="${cust.custMail}" required>
      </div>
      <div class="mb-3">
        <label for="custPhone" class="form-label">휴대폰 번호</label>
        <input type="text" class="form-control" id="custPhone" name="custPhone"
               value="${cust.custPhone}"
               required
               pattern="^010-\d{4}-\d{4}$"
               title="010-1234-5678 형식으로 입력해주세요.">
      </div>

      <!-- 저장 버튼 -->
      <button type="submit" class="btn w-100" style="background-color: #0d6efd; color: white;">저장하기</button>
      <a href="/mypage" class="btn btn-secondary w-100 mt-2">취소</a>
    </form>
  </div>
</main>


<%-- 상단 메뉴바를 눌렀을때 작동하게 되는 script --%>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<%@ include file="../footer.jsp" %>
</body>
</html>
