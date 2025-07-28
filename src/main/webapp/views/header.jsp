<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
  <div class="container-fluid">
    <div class="row py-3 border-bottom align-items-center">

      <!-- 로고 영역 -->
      <div class="col-12 col-lg-3 text-center text-lg-start mb-3 mb-lg-0">
        <div class="main-logo">
          <a href="/">
            <img src="/images/logo.png" alt="Petshop Logo" width="200" height="100" class="img-fluid">
          </a>
        </div>
      </div>

      <!-- 우측 정보 영역 -->
      <div class="col-12 col-lg-9 d-flex justify-content-end align-items-center gap-4 flex-wrap">

        <!-- 로그인 상태일 때만 표시 -->
        <c:if test="${not empty sessionScope.logincust}">
          <div class="d-flex align-items-center gap-2 me-2 text-dark" style="font-family: 'Open Sans', sans-serif;">
              <span class="fw-bold">${sessionScope.logincust.custName}</span>
              <span class="fw-normal">님 환영합니다</span>
              <a href="/logout" class="btn btn-sm btn-outline-secondary text-dark">로그아웃</a>
          </div>
        </c:if>

        <!-- 고객센터 -->
        <div class="text-end">
          <span class="fs-6 text-muted">고객센터</span>
          <h5 class="mb-0">010-8099-3471</h5>
        </div>

        <!-- 아이콘 -->
        <ul class="d-flex list-unstyled m-0 gap-2">
          <li>
            <c:choose>
               <c:when test="${not empty sessionScope.logincust}">
                <a href="/mypage" class="rounded-circle bg-light p-2 mx-1">
                  <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#user"></use></svg>
                </a>
               </c:when>
            <c:otherwise>
              <a href="/login" class="rounded-circle bg-light p-2 mx-1">
               <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#user"></use></svg>
              </a>
            </c:otherwise>
            </c:choose>
          </li>
          <li>
            <a href="/cart" class="rounded-circle bg-light p-2">
              <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#cart"></use></svg>
            </a>
          </li>
        </ul>
      </div>

    </div>
  </div>

    <div class="container-fluid">
        <div class="row py-3">
            <div class="d-flex justify-content-center justify-content-sm-between align-items-center">
                <nav class="main-menu d-flex navbar navbar-expand-lg">

                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                         aria-labelledby="offcanvasNavbarLabel">

                        <div class="offcanvas-header justify-content-center">
                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>

                        <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-end menu-list list-unstyled d-flex gap-md-3 mb-0">

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" role="button" id="pages"
                                       data-bs-toggle="dropdown" aria-expanded="false">고양이</a>
                                    <ul class="dropdown-menu" aria-labelledby="pages">
                                        <li><a href="/cat/food" class="dropdown-item">사료</a></li>
                                        <li><a href="/cat/snack" class="dropdown-item">간식</a></li>
                                        <li><a href="/cat/sand" class="dropdown-item">모래</a></li>
                                        <li><a href="/cat/bathroom" class="dropdown-item">화장실</a></li>
                                        <li><a href="/cat/toy" class="dropdown-item">장난감</a></li>
                                        <li><a href="/cat/house" class="dropdown-item">하우스/방석</a></li>
                                    </ul>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" role="button" id="pages"
                                       data-bs-toggle="dropdown" aria-expanded="false">강아지</a>
                                    <ul class="dropdown-menu" aria-labelledby="pages">
                                        <li><a href="/dog/food" class="dropdown-item">사료</a></li>
                                        <li><a href="/dog/snack" class="dropdown-item">간식</a></li>
                                        <li><a href="/dog/bathitem" class="dropdown-item">목욕/미용</a></li>
                                        <li><a href="/dog/rope" class="dropdown-item">애견줄</a></li>
                                        <li><a href="/dog/toy" class="dropdown-item">장난감</a></li>
                                        <li><a href="/dog/house" class="dropdown-item">하우스/방석</a></li>
                                    </ul>
                                </li>

                                <li class="nav-item">
                                    <a href="/product/new" class="nav-link">신상품</a>
                                </li>
                                <li class="nav-item">
                                    <a href="/product/best" class="nav-link">베스트상품</a>
                                </li>
                                <li class="nav-item">
                                    <a href="/product" class="nav-link">전체상품</a>
                                </li>

                            </ul>
                        </div>

                    </div>
                </nav>
            </div>
        </div>
    </div>

</header>