<%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="refresh" content="3;url=http://localhost:8080/cwy/allProduct.jsp" />
    <title>下单</title>
</head>
<body>
<jsp:useBean class="com.mapper.componentInfo" id="comInfo" scope="page"></jsp:useBean>

<div>
    <%
        String component_id= String.valueOf(request.getQueryString());
        String ID= (String) request.getSession().getAttribute("uname");
        System.out.println(ID);
        String number=request.getParameter("compu_num");
        if (comInfo.create_order(ID,component_id,number)==1){
            out.println("下单"+number+"个成功!");
            out.println("<a href=\"allProduct.jsp\">3s后自动跳转回商品页，若无反应请点击链接跳转........</a>");
        }
        else
            out.println("您还没有登录，请登录后再下单");
            out.println("<a href=\"login.jsp\">3s后自动跳转到登录界面，若无反应请点击链接跳转........</a>");
    %>
</div>

</body>
</html>
