<%--
  Created by IntelliJ IDEA.
  User: WYeefine
  Date: 2021/6/29
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <title>Title</title>

    <base href="<%=basePath%>">

</head>
<body>
    $.ajax({

        url : "",
        data : {

        },
        type : "",
        dataType : "",
        success : function (data) {

        }

    })

    String createTime = DateTimeUtil.getSysTime();
    String createBy = ((User)request.getSession().getAttribute("user")).getName();


    $(".time").datetimepicker({
        minView: "month",
        language:  'zh-CN',
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left"
    });

    <%--数据字典--%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</body>
</html>
