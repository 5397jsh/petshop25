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

<main class="container">
  <h1>로그인 페이지</h1>

  <div class="row">
    <div class="col-sm-5">
      <form action="/loginimpl" method="post">
        <div class="form-group">
          <label for="id">아이디</label>
          <input type="text" name="id" class="form-control" placeholder="아이디 입력">
        </div>
        <div class="form-group">
          <label for="pwd">비밀번호</label>
          <input type="password" name="pwd" class="form-control" placeholder="비밀번호 입력">
        </div>
        <button type="submit" class="btn btn-primary mt-3">로그인</button>
      </form>
        <div class="container signin" style="margin-top: 20px; text-align: center;">
            <p>계정이 없으신가요?
                <a href="/register" style="color: #007bff; font-weight: bold; text-decoration: none;">
                    회원가입
                </a>
            </p>
        </div>

    </div>

    <div class="col-sm-4">
      <c:choose>
        <c:when test="${loginstate == 'fail'}">
          <div class="alert alert-danger mt-3">아이디 또는 비밀번호가 틀렸습니다.</div>
        </c:when>
        <c:otherwise>
          <div class="alert alert-secondary mt-3">아이디와 비밀번호를 입력해주세요.</div>
        </c:otherwise>
      </c:choose>
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
