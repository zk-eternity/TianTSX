<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<title>天天生鲜-商品详情</title>
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
					<a href="${pageContext.request.contextPath}/cart/tocart?uid=${uid}">我的购物车</a>
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
			<a href="${pageContext.request.contextPath}/cart/tocart" class="cart_name fl">我的购物车</a>
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
				<li><a href="">首页</a></li>
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
		<span>></span>
		<a href="#">商品详情</a>
	</div>

	<div class="goods_detail_con clearfix">
		<div class="goods_detail_pic fl"><img src="${pageContext.request.contextPath}/images/${goods.banner}"></div>

		<div class="goods_detail_list fr">
			<h3>${goods.name}</h3>
			<p>${goods.intro}</p>
			<div class="prize_bar">
				<span class="show_pirze">¥<em>${goods.price}</em></span>
				<span class="show_unit">单  位：500g</span>
			</div>
			<div class="goods_num clearfix">
				<div class="num_name fl">数 量：</div>
				<div class="num_add fl">
					<input type="text" id="num" onblur="changeNum()" class="num_show fl" value="1"/>
					<a href="#" class="add fr" onclick="opt(1)">+</a>
					<a href="#" class="minus fr" onclick="opt(2)">-</a>
				</div> 
			</div>
			<script>
				function changeNum() {
                    var data=document.getElementById("num");
                    var total=document.getElementById("total");
                    var number=parseFloat(data.value);
                    var tnumber=parseFloat(total.value);

                    tnumber = data.value*parseFloat("${goods.price}");

                    total.innerHTML=tnumber;
                }
				
				function opt(op) {
				    var data=document.getElementById("num");
                    var total=document.getElementById("total");
				    var number=parseFloat(data.value);
				    var tnumber=parseFloat(total.value);

					if (op==1){
					    data.value=number+1;
					}
					if (op==2){
					    if (number>1){
					        data.value=number-1;
						}else {
					        data.value=1;
						}
					}

					tnumber = data.value*parseFloat("${goods.price}");
					total.innerText=tnumber.toFixed(2);

                }
			</script>
			<div class="total">总价：￥<em><span id="total">${goods.price}</span></em></div>
			<div class="operate_btn">
				<shiro:user>
					<a href="#" class="buy_btn">立即购买</a>
					<a href="#" onclick="addcart()" class="add_cart" id="add_cart">加入购物车</a>
				</shiro:user>
				<shiro:guest>
					<a href="${pageContext.request.contextPath}/user/login" class="buy_btn">立即购买</a>
					<a href="${pageContext.request.contextPath}/user/login" class="add_cart" id="add_cart">加入购物车</a>
				</shiro:guest>
			</div>
		</div>
	</div>

	<script>
		function addcart() {
            $.post("${pageContext.request.contextPath}/cart/addcart","gid=${goods.id}&uid=${user.id}&gnum="+$("#num").val()+"&money="+$("#total").html(),function(data){
                if(data!=null || data!=''){
                    alert("添加成功");
                    location.href="${pageContext.request.contextPath}/detail.jsp";
                }else {
                    alert("添加失败");
                    location.href="${pageContext.request.contextPath}/detail.jsp";
                }
            })
        }
	</script>

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
			<ul class="detail_tab clearfix">
				<li class="active">商品介绍</li>
				<li>评论</li>
			</ul>

			<div class="tab_content">
				<dl>
					<dt>商品详情：</dt>
					<dd>${goods.intro}</dd>
				</dl>
			</div>

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
	<div class="add_jump"></div>

	<script type="text/javascript">
		var $add_x = $('#add_cart').offset().top;
		var $add_y = $('#add_cart').offset().left;

		var $to_x = $('#show_count').offset().top;
		var $to_y = $('#show_count').offset().left;

		$(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'})
		$('#add_cart').click(function(){
			$(".add_jump").stop().animate({
				'left': $to_y+7,
				'top': $to_x+7},
				"fast", function() {
					$(".add_jump").fadeOut('fast',function(){
						$('#show_count').html(2);
					});

			});
		})
	</script>
	
</body>
</html>