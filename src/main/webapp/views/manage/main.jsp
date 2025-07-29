<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>고양이 사료</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">


    <%@ include file="/views/icons.jsp" %>

</head>
<body>

<%@ include file="../header.jsp" %>

<main class="container">
    <h1>회원 관리창</h1>
    <p>여기에 사료 상품들을 나열하면 됩니다.</p>
    <div>
        <a href="/productitem/detail?id=${custId}" class="btn btn-primary btn-sm">상세보기</a>
        <a href="/product/edit?id=${custId}" class="btn btn-warning btn-sm">수정</a>
        <a href="/product/delete?id=${custId}" class="btn btn-danger btn-sm">삭제</a>
    </div>
</main>
<script>
    let custDetail = {
        init:function(){
            $('#cust_update_form > #update_btn').click(()=>{
                let c = confirm("수정 하시겠습니까 ?");
                if(c == true){
                    $('#cust_update_form').attr("method", "post");
                    $('#cust_update_form').attr("action", "/cust/updateimpl");
                    $('#cust_update_form').submit();
                }
            });
            $('#cust_update_form > #delete_btn').click(()=>{
                let c = confirm("삭제 하시겠습니까 ?");
                if(c == true){
                    let id = $('#id').val();
                    location.href='/cust/delete?id='+id;
                }
            });
        }
    }
    $().ready(()=>{
        custDetail.init();
    });
</script>

<div class="col-sm-9">
    <h2>Cust Detail Page</h2>
    <form id="cust_update_form">
        <div class="form-group">
            <label for="id">Id:</label>
            <input type="text" readonly value="${cust.custId}" class="form-control" placeholder="Enter id" id="id" name="custId">
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" value="${cust.custPwd}" class="form-control" placeholder="Enter password" id="pwd" name="custPwd">
        </div>
        <div class="form-group">
            <label for="pwd">Name:</label>
            <input type="text" class="form-control" value="${cust.custName}"placeholder="Enter name" id="name" name="custName">
        </div>
        <button type="button" class="btn btn-primary" id="update_btn">Update</button>
        <button type="button" class="btn btn-primary" id="delete_btn">Delete</button>
    </form>
</div>

<%@ include file="../footer.jsp" %>

<%-- 상단 메뉴바 작동하게 하는 스크립트 --%>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>

</body>
</html>
