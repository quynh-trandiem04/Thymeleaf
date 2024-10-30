<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h2>${category.isEdit ? 'Edit Category' : 'Add New Category'}</h2>

<form action="/admin/categories/save" method="post">
    <input type="hidden" value="${category.isEdit}" name="isEdit">
    <input type="hidden" value="${category.id}" name="id">
    
    <label>Category name</label> <br>
    <input type="text" name="name" value="${category.name}"> <br>
    
    <label>Images</label> <br>
    <input type="text" name="images" value="${category.images}"> <br>
    
    <label>Status</label> <br>
    <input type="text" name="status" value="${category.status}"> <br>
    
    <c:if test="${category.isEdit}">
        <input type="submit" value="Update">
    </c:if>
    <c:if test="${!category.isEdit}">
        <input type="submit" value="Insert">
    </c:if>
</form>

<c:if test="${message != null}">
    <i>${message}</i>
</c:if>

<form action="/admin/categories/searchpaginated">
    <input type="text" name="name" id="name" placeholder="Nhập từ khóa để tìm">
    <button>Search</button>
</form>

<c:if test="${!categoryPage.hasContent()}">
    No Category
</c:if>

<c:if test="${categoryPage.hasContent()}">
    <table>
        <tr>
            <th>STT</th>
            <th>Images</th>
            <th>Category name</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${categoryPage.content}" var="cate" varStatus="STT">
            <tr>
                <td>${STT.index + 1}</td>
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
</c:if>

<form action="">
    <!-- Add any content here if needed -->
</form>
