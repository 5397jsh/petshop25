<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<footer class="py-5">
    <div class="container-fluid">
        <div class="row">

            <!-- 로고 -->
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer-menu">
                    <a href="/">
                        <img src="/images/logo.png" alt="Petshop Logo" width="200" height="150" class="img-fluid">
                    </a>

                </div>
            </div>

            <!-- 소개 메뉴 -->
            <div class="col-md-2 col-sm-6">
                <div class="footer-menu">
                    <h5 class="widget-title">About onlyPETS</h5>
                    <ul class="menu-list list-unstyled">
                        <li class="nav-link">반려동물 전문 쇼핑몰</li>
                        <li class="nav-link">믿을 수 있는 상품만 엄선</li>
                        <li class="nav-link">누구나 쉽게 쇼핑</li>
                    </ul>
                </div>
            </div>

            <!-- 이용안내 -->
            <div class="col-md-2 col-sm-6">
              <div class="footer-menu">
                <h5 class="widget-title">이용안내</h5>
                <ul class="menu-list list-unstyled">
                  <li><a href="/register" class="nav-link">회원가입</a></li>
                  <li>
                    <c:choose>
                      <c:when test="${not empty sessionScope.logincust}">
                        <a href="/mypage" class="nav-link">내 정보</a>
                      </c:when>
                      <c:otherwise>
                        <a href="/login" class="nav-link">로그인</a>
                      </c:otherwise>
                    </c:choose>
                  </li>
                  <li><a href="/cart" class="nav-link">장바구니</a></li>
                </ul>
              </div>
            </div>


            <!-- 브랜드 설명 -->
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer-menu">
                    <h5 class="widget-title">What is ONLYPETS</h5>
                    <p>ONLYPETS는 반려동물과 사람의 행복한 삶을 위한 온라인 플랫폼입니다.</p>
                </div>
            </div>

        </div>
    </div>
</footer>


<!-- 하단 저작권 -->
<div id="footer-bottom">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 copyright">
                <p>2025 onlyPETS. All rights reserved.</p>
            </div>
        </div>
    </div>
</div>
