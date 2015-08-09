<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="WangJun">

    <title>
        权限管理
    </title>
    <link rel="shortcut icon" type="image/vnd.microsoft.icon" href='/image/icon.png'>

    <link href="/css/bootstrap3.css" rel="stylesheet">
    <link href="/css/docs.css" rel="stylesheet">
    <link href="/css/common.css" rel="stylesheet">

    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="/resources/pages/header.jsp"></jsp:include>
<div class="bs-docs-container container">
    <div class="row">
        <jsp:include page="/resources/pages/menus.jsp"></jsp:include>
        <div class="col-sm-10" role="main">
            <div class="bs-callout bs-callout-warning" id="jquery-required" style="margin-top: 30px;">
                <h4>系统管理>>查询系统</h4>

                <div>

                    <c:choose>
                        <c:when test="${!empty requestScope.systems}">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <td>标识</td>
                                    <td>系统名</td>
                                    <td>系统首页地址</td>
                                    <td>操作员</td>
                                </tr>
                                </thead>

                                <c:forEach items="${requestScope.systems}" var="system">
                                    <c:choose>
                                        <c:when test="${system.isDel == 1}">
                                            <tr>
                                                <td>${system.id}</td>
                                                <td class="text-primary"><a href="/admin/${system.id}/updateSystem.do">${system.name}</a></td>
                                                <td><a href="${system.webIndex}" target="_blank">${system.webIndex}</a></td>
                                                <td>${system.operator}</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="alert-danger">
                                                <td>${system.id}</td>
                                                <td class="text-primary"><a href="/admin/${system.id}/updateSystem.do">${system.name}</a></td>
                                                <td><a href="${system.webIndex}" target="_blank" class="text-danger">${system.webIndex}</a></td>
                                                <td>${system.operator}</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </table>
                        </c:when>
                        <c:otherwise>
                            当前还没有系统
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>