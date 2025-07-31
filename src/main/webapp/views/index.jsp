<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>ONLYPETS - 귀여운 애기들에게 완벽한 쇼핑몰 </title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="/style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

  </head>
  <body>

    <%@ include file="/views/header.jsp" %>
    <%@ include file="/views/icons.jsp" %>


    <div class="preloader-wrapper">
      <div class="preloader">
      </div>
    </div>

    <%-- 첫번째 섹션 상단 메인 칸 3개  --%>
    <section class="py-3" style="background-image: url('images/background-pattern.jpg');background-repeat: no-repeat;background-size: cover;">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">

            <div class="banner-blocks">

              <div class="banner-ad large bg-info block-1">

                <div class="swiper main-swiper">
                  <div class="swiper-wrapper">
                    <%--  첫 번째 슬라이드 --%>
                    <div class="swiper-slide">
                      <div class="row banner-content p-5">
                        <div class="content-wrapper col-md-7">
                          <div class="categories my-3">100% natural</div>
                          <h3 class="display-4">고양이들을 위한 맛있는 사료 & 건강한 사료</h3>
                          <p>ROYAL CANIN 고양이 사료는 반려묘의 나이, 품종, 건강 상태 등을 고려하여 맞춤형 영양을 제공하는 사료입니다.
                          다양한 품종별, 연령별, 상황별 맞춤 사료를 제공합니다.</p>
                          <a href="/cat/food" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1 px-4 py-3 mt-3">보러 가기 🍽️</a>
                        </div>
                        <div class="img-wrapper col-md-5">
                          <img src="images/cat-food-01.png" class="img-fluid">
                        </div>
                      </div>
                    </div>
                    <%--  두 번째 슬라이드 --%>
                    <div class="swiper-slide">
                      <div class="row banner-content p-5">
                        <div class="content-wrapper col-md-7">
                          <div class="categories mb-3">100% natural</div>
                          <h3 class="banner-title">강아지들을 위한 맛있고 건강한 사료</h3>
                          <p>ROYAL CANIN 강아지 사료는 견종, 연령, 크기, 활동량 등 강아지의 특성에 맞춰 영양을 맞춤 설계한 사료입니다.
                          건식과 습식 제품으로 나뉘며, 건강 상태와 기호에 따라 다양한 종류가 있습니다</p>
                          <a href="/dog/food" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1 px-4 py-3 mt-3">보러 가기</a>
                        </div>
                        <div class="img-wrapper col-md-5">
                          <img src="images/dog-food-2.png" class="img-fluid" style="height: 600px; object-fit: contain;">
                        </div>
                      </div>
                    </div>
                    <%--  세 번째 슬라이드 --%>
                    <div class="swiper-slide">
                      <div class="row banner-content p-5">
                        <div class="content-wrapper col-md-7">
                          <div class="categories mb-3">100% natural</div>
                          <h3 class="banner-title">귀여운 고양이에게 황홀한 놀이의 신세계를</h3>
                          <p>야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹야옹</p>
                          <a href="/cat/snack" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1 px-4 py-3 mt-3">보러 가기</a>
                        </div>
                        <div class="img-wrapper col-md-5">
                          <img src="images/cat-toy-main.png" class="img-fluid" style="height: 700px; object-fit: contain;">
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="swiper-pagination"></div>

                </div>
              </div>

              <div class="banner-ad bg-success-subtle block-2" style="background:url('images/ad-image-1.png') no-repeat;background-position: right bottom">
                <div class="row banner-content p-5">

                  <div class="content-wrapper col-md-7">
                    <div class="categories sale mb-3 pb-3">귀여운 친구들</div>
                    <h3 class="banner-title">고양이 & 강아지</h3>
                    <a href="/product" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1 px-4 py-3 mt-3">보러 가기 👀</a>
                  </div>

                </div>
              </div>

              <div class="banner-ad bg-danger block-3" style="background: url('/images/cat-house-main.png') no-repeat;background-position: right bottom;background-size: 260px auto;">  <!-- 이미지 크기 조절 -->

                <div class="row banner-content p-5">

                  <div class="content-wrapper col-md-7">
                    <div class="categories sale mb-3 pb-3">고양이들의 쉼터</div>
                    <h3 class="item-title"> 고양이 하우스 & 방석 </h3>
                    <a href="/cat/house" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1 px-4 py-3 mt-3">보러 가기 🛏️</a>
                  </div>

                </div>
              </div>

            </div>
            <!-- / Banner Blocks -->

          </div>
        </div>
      </div>
    </section>

    <%-- 두번째 섹션 신상품 & 베스트 상품  --%>
    <section class="py-5">
      <div class="container-fluid">
        <div class="row">

          <div class="col-md-6">
            <div class="banner-ad bg-danger mb-3" style="background: url('images/ad-image-3.png') no-repeat right center;
            background-size: contain;
            background-color: #fdf4f2;
            height: 285px;">
              <div class="banner-content p-5">

                <div class="categories text-primary fs-3 fw-bold">신상품</div>
                <h3 class="banner-title">고양이 & 강아지</h3>
                <p>부드러운 츄르 & 담백한 강아지용 닭가슴살.</p>
                <a href="/product/new" class="btn btn-dark text-uppercase">보러가자멍🐶</a>

              </div>

            </div>
          </div>
          <div class="col-md-6">
            <div class="banner-ad bg-info" style="background: url('images/ad-image-4.png') no-repeat right center;
            background-size: contain;
            background-color: #fdf4f2;
            height: 285px;">
            <div class="banner-content p-5">

                <div class="categories text-primary fs-3 fw-bold">베스트 상품</div>
                <h3 class="banner-title">목재 캣타워</h3>
                <p>튼튼한 목재 기둥과 고양이들이 좋아하는 특제 목재</p>
                <a href="/product/best" class="btn btn-dark text-uppercase">보러가자냥🐱</a>

              </div>

            </div>
          </div>

        </div>
      </div>
    </section>

    <%-- 세번째 섹션 추천 인기 상품 칸 --%>
    <section class="py-5">
      <div class="container-fluid">

        <div class="row">
          <div class="col-md-12">

            <div class="bootstrap-tabs product-tabs">
              <div class="tabs-header d-flex justify-content-between border-bottom my-5">
                <h1>추천 상품</h1>
              </div>

              <div class="row">
                <c:forEach var="p" items="${recommendedProducts}">
                  <div class="col-md-3 mb-4">
                    <div class="card">
                      <img src="/images/${p.productImg}" class="card-img-top" alt="${p.productName}" style="height: 200px; object-fit: cover;">
                      <div class="card-body">
                        <h5 class="card-title">${p.productName}</h5>
                        <p class="card-text d-flex justify-content-between align-items-center">
                          <c:choose>
                          <c:when test="${p.discountRate > 0}">
                            <p class="card-text d-flex justify-content-between align-items-center">
                              <span>
                                <span class="text-decoration-line-through text-muted">
                                  <fmt:formatNumber value="${p.productPrice}" pattern="###,###" />원
                                </span>
                                <span class="card-text fw-bold">
                                  <fmt:formatNumber value="${p.productPrice * (1 - p.discountRate / 100)}" pattern="###,###" />원
                                </span>
                              </span>

                              <span class="text-muted" style="font-size: 0.9em;">
                                할인율:
                                <fmt:formatNumber value="${p.discountRate}" pattern="###" />%
                              </span>
                            </p>

                          </c:when>
                          <c:otherwise>
                            <p class="card-text fw-bold">
                              <fmt:formatNumber value="${p.productPrice}" pattern="###,###"/>원
                            </p>
                          </c:otherwise>
                        </c:choose>
                        <a href="/product/detail?id=${p.productId}" class="btn btn-primary btn-sm">상세보기</a>
                        <c:if test="${sessionScope.logincust.custId == 'admin'}">
                          <a href="/product/update?id=${p.productId}" class="btn btn-warning btn-sm">수정</a>
                          <a href="/product/delete?id=${p.productId}" class="btn btn-danger btn-sm">삭제</a>
                        </c:if>
                      </div>
                    </div>
                  </div>
                </c:forEach>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section>



    <%-- 핵심 서비스 안내 섹션 --%>
<section class="py-5">
  <div class="container-fluid">
    <div class="row row-cols-1 row-cols-sm-3 row-cols-lg-5 text-dark">

      <div class="col">
        <div class="card mb-3 border-0">
          <div class="row">
            <div class="col-md-2">
              <svg width="32" height="32"><use xlink:href="#check" /></svg>
            </div>
            <div class="col-md-10">
              <div class="card-body p-0">
                <h5>정품만 판매</h5>
                <p class="card-text">공식 인증된 반려동물 상품만을 취급합니다.</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card mb-3 border-0">
          <div class="row">
            <div class="col-md-2">
              <svg width="32" height="32"><use xlink:href="#user" /></svg>
            </div>
            <div class="col-md-10">
              <div class="card-body p-0">
                <h5>맞춤 상품 추천</h5>
                <p class="card-text">우리 아이에게 딱 맞는 상품을 골라드립니다.</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card mb-3 border-0">
          <div class="row">
            <div class="col-md-2">
              <svg width="32" height="32"><use xlink:href="#truck" /></svg>
            </div>
            <div class="col-md-10">
              <div class="card-body p-0">
                <h5>빠른 배송</h5>
                <p class="card-text">오늘 주문하면 내일 도착! 당일 출고 상품 다수</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card mb-3 border-0">
          <div class="row">
            <div class="col-md-2">
              <svg width="32" height="32"><use xlink:href="#link" /></svg>
            </div>
            <div class="col-md-10">
              <div class="card-body p-0">
                <h5>실시간 상담</h5>
                <p class="card-text">24시간 고객 지원 가능</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card mb-3 border-0">
          <div class="row">
            <div class="col-md-2">
              <svg width="32" height="32"><use xlink:href="#category" /></svg>
            </div>
            <div class="col-md-10">
              <div class="card-body p-0">
                <h5>다양한 카테고리</h5>
                <p class="card-text">사료부터 장난감까지 모든 반려용품 완비</p>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>



    <%@ include file="/views/footer.jsp" %>

    <c:if test="${not empty script}">
        <script>${script}</script>
    </c:if>

    <script src="/js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="/js/plugins.js"></script>
    <script src="/js/script.js"></script>
    <script>
      document.addEventListener('DOMContentLoaded', function () {
        const swiper = new Swiper('.main-swiper', {
          loop: true,
          autoplay: {
            delay: 4000,
            disableOnInteraction: false
          },
          pagination: {
            el: '.swiper-pagination',
            clickable: true
          }
        });
      });
    </script>



  </body>
</html>