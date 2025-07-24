<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
  <div class="container-fluid">
    <div class="row py-3 border-bottom">

      <div class="col-sm-4 col-lg-3 text-center text-sm-start">
        <div class="main-logo">
          <a href="/">
            <img src="/images/logo.png" alt="Petshop Logo" width="200" height="100" class="img-fluid">
          </a>
        </div>
      </div>

      <div class="col-sm-6 offset-sm-2 offset-md-0 col-lg-5 d-none d-lg-block">

      </div>

      <div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">
        <div class="support-box text-end d-none d-xl-block">
          <span class="fs-6 text-muted">고객센터</span>
          <h5 class="mb-0">031-XXX-XXXX</h5>
        </div>

        <ul class="d-flex justify-content-end list-unstyled m-0">
          <li>
            <a href="#" class="rounded-circle bg-light p-2 mx-1">
              <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#user"></use></svg>
            </a>
          </li>
          <li>
            <a href="#" class="rounded-circle bg-light p-2 mx-1">
              <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#heart"></use></svg>
            </a>
          </li>
          <li class="d-lg-none">
            <a href="#" class="rounded-circle bg-light p-2 mx-1" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">
              <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#cart"></use></svg>
            </a>
          </li>
          <li class="d-lg-none">
            <a href="#" class="rounded-circle bg-light p-2 mx-1" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSearch" aria-controls="offcanvasSearch">
              <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#search"></use></svg>
            </a>
          </li>
        </ul>

        <div class="cart text-end d-none d-lg-block dropdown">
          <button class="border-0 bg-transparent d-flex flex-column gap-2 lh-1" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">
            <span class="fs-6 text-muted dropdown-toggle">장바구니</span>
            <span class="cart-total fs-5 fw-bold">1000000원</span>
          </button>
        </div>
      </div>

    </div>
  </div>
  <div class="container-fluid">
    <div class="row py-3">
      <div class="d-flex  justify-content-center justify-content-sm-between align-items-center">
        <nav class="main-menu d-flex navbar navbar-expand-lg">

          <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                  aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">

            <div class="offcanvas-header justify-content-center">
              <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>

            <div class="offcanvas-body">



              <ul class="navbar-nav justify-content-end menu-list list-unstyled d-flex gap-md-3 mb-0">

                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" role="button" id="pages" data-bs-toggle="dropdown" aria-expanded="false">고양이</a>
                  <ul class="dropdown-menu" aria-labelledby="pages">
                    <li><a href="/cat/food" class="dropdown-item">사료 </a></li>
                    <li><a href="/cat/snack" class="dropdown-item">간식 </a></li>
                    <li><a href="/cat/sand" class="dropdown-item">모래</a></li>
                    <li><a href="/cat/bathroom" class="dropdown-item">화장실 </a></li>
                    <li><a href="/cat/toy" class="dropdown-item">장난감 </a></li>
                    <li><a href="/cat/house" class="dropdown-item">하우스/방석 </a></li>
                  </ul>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" role="button" id="pages" data-bs-toggle="dropdown" aria-expanded="false">강아지</a>
                  <ul class="dropdown-menu" aria-labelledby="pages">
                    <li><a href="index.html" class="dropdown-item">사료  </a></li>
                    <li><a href="index.html" class="dropdown-item">간식 </a></li>
                    <li><a href="index.html" class="dropdown-item">목욕/미용 </a></li>
                    <li><a href="index.html" class="dropdown-item">애견줄 </a></li>
                    <li><a href="index.html" class="dropdown-item">장난감 </a></li>
                    <li><a href="index.html" class="dropdown-item">하우스/방석 </a></li>
                  </ul>
                </li>
                <li class="nav-item">
                  <a href="#New" class="nav-link">신상품</a>
                </li>
                <li class="nav-item">
                  <a href="#Best" class="nav-link">베스트상품</a>
                </li>
              </ul>

            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

          </div>
        </nav>
      </div>
    </div>
  </div>
</header>