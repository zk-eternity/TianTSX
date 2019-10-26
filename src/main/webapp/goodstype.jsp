<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>

<div id="goodstype">
    <ul class="subnav fl">
        <c:forEach items="${goodsTypes}" var="g">
            <li><a href="#model0${g.id}" class="${g.gttype}">${g.gtname}</a></li>
        </c:forEach>
    </ul>
</div>