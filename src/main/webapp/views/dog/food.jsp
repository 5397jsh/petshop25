<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../inc/header.jsp" />

<div class="container mt-5">
    <h2 class="mb-4">강아지 사료</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-100">
                <img src="/img/dogfood1.jpg" class="card-img-top" alt="사료1">
                <div class="card-body">
                    <h5 class="card-title">오리맛 사료</h5>
                    <p class="card-text">기호성 좋은 오리맛 사료입니다.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="/img/dogfood2.jpg" class="card-img-top" alt="사료2">
                <div class="card-body">
                    <h5 class="card-title">연어맛 사료</h5>
                    <p class="card-text">피모 건강에 좋은 연어맛 사료입니다.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="/img/dogfood3.jpg" class="card-img-top" alt="사료3">
                <div class="card-body">
                    <h5 class="card-title">소고기맛 사료</h5>
                    <p class="card-text">고단백 프리미엄 소고기 사료입니다.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../inc/footer.jsp" />
