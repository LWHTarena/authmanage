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

    <link rel="stylesheet" type="text/css" href="/css/zTreeStyle.css">
    <script type="text/javascript" src="/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="/js/jquery.ztree.excheck-3.5.js"></script>


</head>
<body>
<jsp:include page="/resources/pages/header.jsp"></jsp:include>
<div class="bs-docs-container container">
    <div class="row">
        <jsp:include page="/resources/pages/menus.jsp"></jsp:include>
        <jsp:include page="/resources/pages/modal.jsp"></jsp:include>
        <div class="col-sm-10" role="main">
            <div class="bs-callout bs-callout-warning" id="jquery-required" style="margin-top: 30px;">
                <h4>粒子管理>>添加粒子</h4>

                <div>
                    <form action="/admin/add/bean.do" method="post">
                        <div class="input-group">
                            <span class="input-group-addon">&nbsp;&nbsp;key</span>
                            <input type="text" class="form-control" placeholder="你的粒子要有一个唯一的标识" name="beanKey"
                                   required="true" message="粒子唯一标识是必须的">
                        </div>

                        <div class="input-group">
                            <span class="input-group-addon">名字</span>
                            <input type="text" class="form-control" placeholder="粒子名字" name="name" required="true"
                                   message="粒子名字是必须的">
                        </div>

                        <div class="input-group">
                            <span class="input-group-addon">&nbsp;&nbsp;&nbsp;值</span>
                            <input type="text" class="form-control" placeholder="粒子含有的因素值，用空格分割" name="beans">
                        </div>

                        <div class="input-group">
                            <span class="input-group-addon">描述</span>
                            <input type="text" class="form-control" placeholder="简单描述下这个个粒子" name="description">
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"
                                                                                                       value="1" checked
                                                                                                       name="isDel">
                        上线

                        <br><br>
                        <h4 class="bs-callout-warning">所属系统</h4>

                        <div class="input-group">
                            <c:forEach items="${requestScope.systems}" var="system">
                                <input type="radio" value="${system.id}" name="systemId" id="system_${system.id}"
                                       onclick="getRolesAndgetGroups(this)"><label
                                    for="system_${system.id}">${system.name}</label>
                            </c:forEach>
                        </div>

                        <br>
                        <h4 class="bs-callout-warning">所属角色</h4>

                        <div class="input-group" id="roleList">
                        </div>

                        <br>

                        <div class="input-group">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-default" id="mysubmit">保存</button>
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/my.js"></script>
<script src="/js/jquery.validation-1.0.1.js"></script>

<script>
    function getRolesAndgetGroups(system) {
        getRoles(system);
    }
    function getRoles(system) {
        $.getJSON("/admin/" + system.value + "/getRoles.do", function (date) {
            $("#roleList").html("");
            var roles = date.roles;
            for (var i = 0; i < roles.length; i++) {
                var id = roles[i].id;
                var name = roles[i].name;
                var newInput = $("<input>").attr("type", "checkbox").attr("id", "role_" + id).attr("name", "roleIds").attr("value", id);
                var newLable = $("<label>" + name + "</label>").attr("for", "role_" + id);
                $("#roleList").append(newInput).append(newLable);
            }
        });
    }

</script>
</body>
</html>