<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  let product_detail = {
    init:function(){
      $('#update_btn').click(()=>{
        let c = confirm('수정 하시겠습니까 ?');
        if(c == true){
          $('#product_update_form').attr('method', 'post');
          $('#product_update_form').attr('action','/product/updateimpl');
          $('#product_update_form').attr('enctype','multipart/form-data');
          $('#product_update_form').submit();
        }
      });
      $('#delete_btn').click(()=>{
        let c = confirm('삭제 하시겠습니까 ?');
        if(c == true){
          location.href='/product/delete?id=${product.productId}';
        }
      });
    }
  }
  $().ready(()=>{
    product_detail.init();
  });
</script>

<div class="col-sm-9">
  <h2>Product Detail Page</h2>
  <form id="product_update_form">
    <img src="/upload/img/${product.productImg}" width="300px" alt="상품 이미지">

    <div class="form-group">
      <label for="id">Id:</label>
      <p id="id">${product.productId}</p>
      <input type="hidden" name="productId" value="${product.productId}">
    </div>

    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" value="${product.productName}" id="name" name="productName">
    </div>

    <div class="form-group">
      <label for="price">Price:</label>
      <input type="number" class="form-control" value="${product.productPrice}" id="price" name="productPrice">
    </div>

    <div class="form-group">
      <label for="rate">Discount Rate:</label>
      <input type="text" class="form-control" value="${product.discountRate}" id="rate" name="discountRate">
    </div>

    <input type="hidden" value="${product.productImg}" name="productImg">

    <div class="form-group">
      <label for="newpimg">New Product Image:</label>
      <input type="file" class="form-control" id="newpimg" name="productImgFile">
    </div>

    <div class="form-group">
      <label for="cate">Cate Id:</label>
      <input type="number" class="form-control" value="${product.cateId}" id="cate" name="cateId">
    </div>

    <div class="form-group">
      <label for="rdate">Register Date:</label>
      <p id="rdate">
        <fmt:parseDate value="${product.productRegdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedReg" type="both"/>
        <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" value="${parsedReg}" />
      </p>
    </div>

    <div class="form-group">
      <label for="udate">Update Date:</label>
      <p id="udate">
        <fmt:parseDate value="${product.productUpdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedUpd" type="both"/>
        <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" value="${parsedUpd}" />
      </p>
    </div>

    <button type="button" class="btn btn-primary" id="update_btn">Update</button>
    <button type="button" class="btn btn-danger" id="delete_btn">Delete</button>
  </form>
</div>
