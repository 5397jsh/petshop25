<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-9">
    <h2>Product Get Admin Page</h2>
    <table id="product_table" class="table table-bordered">
        <thead>
        <tr>
            <th>Img</th>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Rate</th>
            <th>RegDate</th>
            <th>UpdateDate</th>
            <th>Category</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${plist}">
            <tr>
                <td><img src="/imgs/${p.productImg}"></td>
                <td><a href="/productitem/detail?id=${p.productId}">${p.productId}</a></td>
                <td>${p.productName}</td>
                <td><fmt:formatNumber type="number" pattern="###,###원" value="${p.productPrice}" /></td>
                <td>${p.discountRate}</td>
                <td>
                    <fmt:parseDate value="${ p.productRegdate }"
                                   pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
                </td>
                <td>
                    <fmt:parseDate value="${ p.productUpdate }"
                                   pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
                </td>
                <td>${p.cateName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>