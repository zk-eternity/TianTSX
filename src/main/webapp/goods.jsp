<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
<div class="list_model">
    <div class="list_title clearfix">
        <h3 class="fl" id="model01">${goodsType.gtname}</h3>
        <div class="subtitle fl">
            <span>|</span>
            <a href="#">鲜芒</a>
            <a href="#">加州提子</a>
            <a href="#">亚马逊牛油果</a>
        </div>
        <a href="${pageContext.request.contextPath}/goodstype/getGoodstypeById2?id=${goodsType.id}"
           class="goods_more fr" id="fruit_more">查看更多 ></a>
    </div>

    <div class="goods_con clearfix">
        <div class="goods_banner fl"><img src="${pageContext.request.contextPath}/images/${goodsType.gtpicture}">
        </div>
        <ul class="goods_list fl" id="goods">
            <c:forEach items="${goodsType.goods}" var="g">
                <li>
                    <h4><a href="#">${g.name}</a></h4>
                    <a href="${pageContext.request.contextPath}/goods/goodsDetail?id=${g.id}"><img
                            src="${pageContext.request.contextPath}/images/goods/${g.picture}"></a>
                    <div class="prize">¥ ${g.price}</div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
