<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>ONLYPETS</title>
  <link rel="icon" href="<c:url value='/img/favicon.png'/>">

  <!-- Bootstrap CSS & Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link rel="stylesheet" href="<c:url value='/style.css'/>">
</head>
<body>

<!-- 상단바 -->
<div class="d-flex justify-content-between align-items-center px-4 py-2 bg-white border-bottom small">
  <div>
    For Support? <strong>010-8920-3471</strong>
  </div>
  <div>
    <a href="<c:url value='/login.jsp'/>" class="me-2 text-decoration-none">로그인</a>
    <i class="bi bi-person me-2"></i>
    <i class="bi bi-heart-fill text-primary me-2"></i>
    <strong>1000000원</strong>
  </div>
</div>

<!-- 메인 네비게이션 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
  <div class="container">
    <a class="navbar-brand" href="<c:url value='/'/>">
      <img src="<c:url value='/img/logo.png'/>" alt="ONLYPETS 로고" style="height: 50px;">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/cat">고양이</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="dogDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            강아지
          </a>
          <ul class="dropdown-menu" aria-labelledby="dogDropdown">
            <li><a class="dropdown-item" href="/dog/food">사료</a></li>
            <li><a class="dropdown-item" href="#">간식</a></li>
            <li><a class="dropdown-item" href="#">목욕/미용</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">신상품</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">베스트상품</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
