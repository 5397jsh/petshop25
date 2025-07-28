<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

    <%@ include file="/views/icons.jsp" %>

</head>
<body>

<%@ include file="../header.jsp" %>

<div class="container" style="max-width: 600px; margin-top: 50px;">
  <h2 class="mb-4">회원가입 페이지</h2>
  <form action="/mainregisterimpl" method="post">
    <div class="mb-3">
      <label for="custId" class="form-label">아이디</label>
      <input type="text" class="form-control" id="custId" name="custId" placeholder="아이디 입력" required>
    </div>
    <div class="mb-3">
      <label for="custPwd" class="form-label">비밀번호</label>
      <input type="password" class="form-control" id="custPwd" name="custPwd" placeholder="비밀번호 입력" required>
    </div>
    <div class="mb-3">
      <label for="custName" class="form-label">이름</label>
      <input type="text" class="form-control" id="custName" name="custName" placeholder="이름 입력" required>
    </div>
    <div class="mb-3">
      <label for="custMail" class="form-label">이메일 주소</label>
      <input type="email" class="form-control" id="custMail" name="custMail" placeholder="이메일 입력" required>
    </div>
    <div class="mb-3">
      <label for="custPhone" class="form-label">휴대폰 번호</label>
      <input type="text" class="form-control" id="custPhone" name="custPhone"
             placeholder="예시) 010-1234-5678"
             required
             pattern="^010-\d{4}-\d{4}$"
             title="010-1234-5678 형식으로 입력해주세요.">
    </div>
      <button type="submit" class="btn w-100" style="background-color: #ffc107; color: black;">회원가입</button>
  </form>

  <div class="container signin mt-4 text-center">
    <p>이미 계정이 있으신가요?
      <a href="/login" class="text-primary fw-bold">로그인</a>
    </p>
  </div>
</div>
    </div>
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
