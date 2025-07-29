<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 추가</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">


    <%@ include file="/views/icons.jsp" %>


</head>
<body>

<%@ include file="../header.jsp" %>
<%-- Center Page --%>

    <div class="container mt-5">
    <h2>상품 추가</h2>
    <form action="/product/addimpl" method="post" enctype="multipart/form-data"style="max-width:600px;">
        <div class="form-group">
            <label for="name">상품명:</label>
            <input type="text" class="form-control" placeholder="Enter name" id="name" name="productName">
        </div>
        <div class="form-group">
            <label for="price">상품 가격:</label>
            <input type="number" class="form-control" placeholder="Enter price" id="price" name="productPrice">
        </div>
        <div class="form-group">
            <label for="rate">할인율:</label>
            <input type="number" min="0" step="0.1" class="form-control" placeholder="Enter discount rate" id="rate" name="discountRate">
        </div>
        <div class="form-group">
            <label for="pimg">상품 이미지:</label>
            <input type="file" class="form-control" placeholder="Enter image name" id="pimg" name="productImgFile">
        </div>
        <div class="form-group">
            <label for="cateId">카테고리 선택:</label>
            <select name="cateId" id="cateId" class="form-control" required>
                <option value="">카테고리를 선택하세요</option>
                <c:forEach var="c" items="${cates}">
                    <option value="${c.cateId}">
                        ${c.cateUp} > ${c.cateDown}
                    </option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>

</div>

</body>
</html>
<%@ include file="../footer.jsp" %>
<%-- 상단 메뉴바를 눌렀을때 작동하게 되는 script --%>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
</body>
</html>
