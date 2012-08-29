<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta name="robots" content="index, follow"/>
    <meta name="keywords" content=""/>
    <meta name="title" content=""/>
    <meta name="description" content=""/>
    <title>后台登录</title>
    <link rel="shortcut icon" href="${ctx}/static/favicon.ico" type="image/x-icon" />
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/static/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="${ctx}/static/js/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<div class="row">
    <div class="span12">
    <form:form id="loginForm" action="${ctx}/login" method="post">
        <%
            String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
            if(error != null){
                if(error.contains("DisabledAccountException")){
        %>
        <div id="message" class="alert alert_red">
            <img height="24" width="24" src="${ctx}/static/dashboard/images/icons/Locked2.png"><strong>用户已被屏蔽,请登录其他用户.</strong>
        </div>
        <%
        }else{
        %>
        <div id="message" class="alert alert_red">
            <img height="24" width="24" src="${ctx}/static/dashboard/images/icons/Locked2.png"><strong>登录失败，请重试.</strong>
        </div>
        <%
                }
            }
        %>
        <label class="fields"><strong>用户名</strong><input type="text" id="username" name="username" value="${username}" class="indent round_all required email2 email"></label>
        <label class="fields"><strong>密码</strong><input type="password" id="password" name="password" class="indent round_all required"></label>
        <button type="submit" class="button_colour round_all"><img width="24" height="24" src="${ctx}/static/dashboard/images/icons/Locked2.png"><span> 登  录</span></button>
        <div id="bar" class="round_bottom">
            <label><input type="checkbox" id="rememberMe" name="rememberMe">记住密码</label>
            <label><a href="${ctx}/">找回密码</a></label>
        </div>
    </form:form>
    </div>
</div>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(function() {
        $("#loginForm").validate();
        $(".alert").delay(1500).fadeOut("slow");
    });
</script>
</body>
</html>