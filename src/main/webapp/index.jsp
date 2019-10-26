<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<title>天天生鲜-首页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/slide.js"></script>
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
					<a href="${pageContext.request.contextPath}/user_center_info.jsp">用户中心</a>
					<span>|</span>
					<a href="${pageContext.request.contextPath}/cart/getcart?uid=${uid}">我的购物车</a>
					<span>|</span>
					<a href="${pageContext.request.contextPath}/user_center_order.jsp">我的订单</a>
				</div>
			</div>
		</div>
	</div>

	<div class="search_bar clearfix">
		<a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>
		<div class="guest_cart fr">
			<a href="${pageContext.request.contextPath}/cart/tocart?uid=${userid}" class="cart_name fl">我的购物车</a>
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
		<div class="navbar">
			<h1 class="fl">全部商品分类</h1>
			<ul class="navlist fl">
				<li><a href="">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="center_con clearfix">

		<div id="goodstype"></div>

		<script>
			$("#goodstype").load("${pageContext.request.contextPath}/goodstype/getGoodstype");
		</script>

		<div class="slide fl">
			<ul class="slide_pics">
				<li><img src="${pageContext.request.contextPath}/images/slide.jpg" alt="幻灯片"></li>
				<li><img src="${pageContext.request.contextPath}/images/slide02.jpg" alt="幻灯片"></li>
				<li><img src="${pageContext.request.contextPath}/images/slide03.jpg" alt="幻灯片"></li>
				<li><img src="${pageContext.request.contextPath}/images/slide04.jpg" alt="幻灯片"></li>
			</ul>
			<div class="prev"></div>
			<div class="next"></div>
			<ul class="points"></ul>
		</div>
		<div class="adv fl">
			<a href="#"><img src="${pageContext.request.contextPath}/images/adv01.jpg"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/images/adv02.jpg"></a>
		</div>
	</div>


	<div class="list_model" id="fruit"></div>
	<script>
        $("#fruit").load("${pageContext.request.contextPath}/goodstype/getGoodstypeById?id=1");
	</script>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model02">海鲜水产</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">河虾</a>
				<a href="#">扇贝</a>
			</div>
			<a href="${pageContext.request.contextPath}/list.jsp" class="goods_more fr">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="goods_banner fl"><img src="${pageContext.request.contextPath}/images/banner02.jpg"></div>
			<ul class="goods_list fl">
				<li>
					<h4><a href="#">青岛野生海捕大青虾</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods/goods018.jpg"></a>
					<div class="prize">¥ 48.00</div>
				</li>
				<li>
					<h4><a href="#">扇贝</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods/goods019.jpg"></a>
					<div class="prize">¥ 46.00</div>
				</li>
				<li>
					<h4><a href="#">冷冻秋刀鱼</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods/goods020.jpg"></a>
					<div class="prize">¥ 19.00</div>
				</li>
				<li>
					<h4><a href="#">基围虾</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods/goods021.jpg"></a>
					<div class="prize">¥ 25.00</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model03">猪牛羊肉</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">鲜芒</a>
				<a href="#">加州提子</a>
				<a href="#">亚马逊牛油果</a>
			</div>
			<a href="${pageContext.request.contextPath}/list.jsp" class="goods_more fr">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="${pageContext.request.contextPath}/goods_banner fl"><img
					src="${pageContext.request.contextPath}/images/banner03.jpg"></div>
			<ul class="goods_list fl">
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model04">禽类蛋品</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">鲜芒</a>
				<a href="#">加州提子</a>
				<a href="#">亚马逊牛油果</a>
			</div>
			<a href="${pageContext.request.contextPath}/list.jsp" class="goods_more fr">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="goods_banner fl"><img src="${pageContext.request.contextPath}/images/banner04.jpg"></div>
			<ul class="goods_list fl">
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model05">新鲜蔬菜</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">鲜芒</a>
				<a href="#">加州提子</a>
				<a href="#">亚马逊牛油果</a>
			</div>
			<a href="${pageContext.request.contextPath}/list.jsp" class="goods_more fr">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="goods_banner fl"><img src="${pageContext.request.contextPath}/images/banner05.jpg"></div>
			<ul class="goods_list fl">
				<li>
					<h4><a href="#">维多利亚</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model06">速冻食品</h3>
			<div class="subtitle fl">
				<span>|</span>
				<a href="#">鲜芒</a>
				<a href="#">加州提子</a>
				<a href="#">亚马逊牛油果</a>
			</div>
			<a href="${pageContext.request.contextPath}/list.jsp" class="goods_more fr">查看更多 ></a>
		</div>

		<div class="goods_con clearfix">
			<div class="goods_banner fl"><img src="${pageContext.request.contextPath}/images/banner06.jpg"></div>
			<ul class="goods_list fl">
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
				<li>
					<h4><a href="#">维多利亚葡萄</a></h4>
					<a href="${pageContext.request.contextPath}/detail.jsp"><img
							src="${pageContext.request.contextPath}/images/goods.jpg"></a>
					<div class="prize">¥ 38.00</div>
				</li>
			</ul>
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
	<script type="text/javascript">

		//BCSlideshow('focuspic');
		var oFruit = document.getElementById('fruit_more');
		var oShownum = document.getElementById('show_count');

		var hasorder = localStorage.getItem('order_finish');

		if(hasorder)
		{
			oShownum.innerHTML = '2';
		}

		oFruit.onclick = function(){
			window.location.href = 'list.jsp';
		}
	</script>
</body>
</html>