<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<a href="/admin/categories/add">Add Category</a>

<c:if test="${message != null}">
    ${message}
</c:if>

<table>
    <tr>
        <th>STT</th>
        <th>Images</th>
        <th>Category name</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <c:forEach items="${list}" var="cate" varStatus="stt">
        <tr>
            <td>${stt.index + 1}</td>
            <td>${cate.images}</td>
            <td>${cate.name}</td>
            <td>${cate.status}</td>
            <td>
                <a href="/admin/categories/edit/${cate.id}">Sửa</a>
                <a href="/admin/categories/delete/${cate.id}">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>

<form action="">
    <select name="size" id="size" onchange="this.form.submit()">
        <option ${categoryPage.size == 3 ? 'selected' : ''} value="3">3</option>
        <option ${categoryPage.size == 5 ? 'selected' : ''} value="5">5</option>
        <option ${categoryPage.size == 10 ? 'selected' : ''} value="10">10</option>
        <option ${categoryPage.size == 15 ? 'selected' : ''} value="15">15</option>
        <option ${categoryPage.size == 20 ? 'selected' : ''} value="20">20</option>
    </select>
</form>

<c:if test="${categoryPage.totalPages > 0}">
    <ul>
        <c:forEach items="${pageNumbers}" var="pageNumber">
            <c:if test="${categoryPage.totalPages > 1}">
                <li class="${pageNumber == categoryPage.number + 1 ? 'page-item active' : 'page-item'}">
                    <a href="<c:url value='/admin/categories/searchpaginated?name=${name}&size=${categoryPage.size}&page=${pageNumber}'/>">${pageNumber}</a>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</c:if>
