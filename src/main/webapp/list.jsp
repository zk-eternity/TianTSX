<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<title>天天生鲜-商品列表</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
</head>
<body>
	<div>
		欢迎您：
		<em>
			<shiro:user>
				<shiro:principal/>
				<a href="${pageContext.request.contextPath}/user/logout">
					<span style="float: right;">注销</span>
				</a>
			</shiro:user>
			<shiro:guest>
				<a href="${pageContext.request.contextPath}/login.jsp">请登录</a>
			</shiro:guest>
		</em>
	</div>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
				<div class="user_link fl">
					<span>|</span>
					<a href="user_center_info.jsp">用户中心</a>
					<span>|</span>
					<a href="cart.jsp">我的购物车</a>
					<span>|</span>
					<a href="user_center_order.jsp">我的订单</a>
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="index.jsp" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>
		<div class="guest_cart fr">
			<a href="#" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl" id="show_count"></div>
		</div>
	</div>

	<script>
        $(function () {
            $.post("${pageContext.request.contextPath}/cart/getNum","uid=${userid}",function(data){
                $("#show_count").html(data);
            })
        })
	</script>

	<div class="navbar_con">
		<div class="navbar clearfix">
			<div class="subnav_con fl">
				<h1>全部商品分类</h1>	
				<span></span>			
				<ul class="subnav">
					<li><a href="#" class="fruit">新鲜水果</a></li>
					<li><a href="#" class="seafood">海鲜水产</a></li>
					<li><a href="#" class="meet">猪牛羊肉</a></li>
					<li><a href="#" class="egg">禽类蛋品</a></li>
					<li><a href="#" class="vegetables">新鲜蔬菜</a></li>
					<li><a href="#" class="ice">速冻食品</a></li>
				</ul>
			</div>
			<ul class="navlist fl">
				<li><a href="index.jsp">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="breadcrumb">
		<a href="#">全部分类</a>
		<span>></span>
		<a href="#">新鲜水果</a>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<c:forEach items="${goodsTypes3.goods}" var="g" begin="0" end="1">
						<li>
							<a href="${pageContext.request.contextPath}/goods/goodsDetail?id=${g.id}"><img src="${pageContext.request.contextPath}/images/goods/${g.picture}"></a>
							<h4><a href="${pageContext.request.contextPath}/goods/goodsDetail?id=${g.id}">${g.name}</a></h4>
							<div class="prize">￥${g.price}</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
				<a href="${pageContext.request.contextPath}/goodstype/getGoodstypeById2?id=${goodsTypes3.id}" class="active">默认</a>
				<a href="${pageContext.request.contextPath}/goodstype/getGoodstypeById2?id=${goodsTypes3.id}&open=go">价格</a>
				<a href="#">人气</a>
			</div>

			<ul class="goods_type_list clearfix">
				<c:forEach items="${goodsPageInfo.list}" var="g">
					<li>
						<a href="${pageContext.request.contextPath}/goods/goodsDetail?id=${g.id}"><img src="${pageContext.request.contextPath}/images/goods/${g.picture}"></a>
						<h4><a href="${pageContext.request.contextPath}/goods/goodsDetail?id=${g.id}">${g.name}</a></h4>
						<div class="operate">
							<span class="prize">￥${g.price}</span>
							<span class="unit">${g.price}/500g</span>
							<a href="#" class="add_goods" title="加入购物车"></a>
						</div>
					</li>
				</c:forEach>
			</ul>

			<div class="pagenation">
				<%--首页，直接将pageNum设置为1然传入Servlet(userlist)中用来更新分页查询信息--%>
				<a href="${pageContext.request.contextPath}/goodstype/getGoodstypeById2?id=${goodsTypes3.id}&pageNum=1&pageSize=10&open=${open}">首页</a>
				<a href="${pageContext.request.contextPath}/goodstype/getGoodstypeById2?id=${goodsTypes3.id}&pageNum=${goodsPageInfo.prePage}&pageSize=10&open=${open}">上一页</a>
				<a href="${pageContext.request.contextPath}/goodstype/getGoodstypeById2?id=${goodsTypes3.id}&pageNum=${goodsPageInfo.nextPage}&pageSize=10&open=${open}">下一页</a>
				<a href="${pageContext.request.contextPath}/goodstype/getGoodstypeById2?id=${goodsTypes3.id}&pageNum=${goodsPageInfo.pages}&pageSize=10&open=${open}">尾页</a>
			</div>
			<div><h3 align="center">你当前在第${goodsPageInfo.pageNum}页,共${goodsPageInfo.total}条数据,共${goodsPageInfo.pages}页</h3></div>
		</div>
	</div>

	<div class="footer">
		<div class="foot_link">
			<a href="#">关于我们</a>
			<span>|</span>
			<a href="#">联系我们</a>
			<span>|</span>
			<a href="#">招聘人才</a>
			<span>|</span>
			<a href="#">友情链接</a>		
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>
	
</body>
</html>