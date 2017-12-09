<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Book Page</title>
    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
        .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
        .tg .tg-4eph{background-color:#f9f9f9}
    </style>
</head>
<body>
<h1>
    Add a Book
</h1>

<c:url var="addAction" value="/book/add" ></c:url>

<form:form action="${addAction}" modelAttribute="book">
    <table>
        <c:if test="${!empty book.nameOfBook}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8"  disabled="true" />
                    <form:hidden path="id" />
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="nameOfBook">
                    <spring:message text="Name of Book"/>
                </form:label>
            </td>
            <td>
                <form:input path="nameOfBook" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="nameOfAuthor">
                    <spring:message text="Name of Author"/>
                </form:label>
            </td>
            <td>
                <form:input path="nameOfAuthor" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="price">
                    <spring:message text="Price"/>
                </form:label>
            </td>
            <td>
                <form:input path="price" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty book.nameOfBook}">
                    <input type="submit"
                           value="<spring:message text="Edit book"/>" />
                </c:if>
                <c:if test="${empty book.nameOfBook}">
                    <input type="submit"
                           value="<spring:message text="Add book"/>" />
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
<br>
<h3>book List</h3>
<c:if test="${!empty listBooks}">
    <table class="tg">
        <tr>
            <th width="80">Book ID</th>
            <th width="120">Book Name</th>
            <th width="120">Author Name</th>
            <th width="120">Price</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td>${book.nameOfBook}</td>
                <td>${book.nameOfAuthor}</td>
                <td>${book.price}</td>
                <td><a href="<c:url value="/edit/${book.id}" />" >Edit</a></td>
                <td><a href="<c:url value="/remove/${book.id}" />" >Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
