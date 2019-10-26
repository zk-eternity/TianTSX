<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<head>
	<title>天天生鲜-购物车</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
</head>
<body>

	<script>
		$(function () {
			$.post("${pageContext.request.contextPath}/cart/getNum","uid=${uid}",function(data){
				$("#show_count").html(data);
			})
		})
	</script>
	<script>

        function pNum(pid,p,num) {
            var number=parseInt(num);//数据库中取出的当前商品数量
            var price=parseFloat(p);
            $.post("${pageContext.request.contextPath}/cart/addcart","gid="+pid+"&uid=${uid}&gnum=1&money="+price,function(data){
                location.href="${pageContext.request.contextPath}/cart/tocart?uid=${uid}";
            })
        }

        function mNum(pid,p,num,count) {
            var newnum=document.getElementById("num"+count);//输入框的值
            var number=parseInt(num);//数据库中取出的当前商品数量
            var price=parseFloat(p);
            if (parseInt(newnum.value)>1){
                $.post("${pageContext.request.contextPath}/cart/addcart","gid="+pid+"&uid=${uid}&gnum=-1&money="+price,function(data){
                    location.href="${pageContext.request.contextPath}/cart/tocart?uid=${uid}";
                })
			}else {
                if (confirm("确认要删除掉这款商品吗?")){
                    $.post("${pageContext.request.contextPath}/cart/delcart","gid="+pid+"&uid=${uid}",function(data){
                        location.href="${pageContext.request.contextPath}/cart/tocart?uid=${uid}";
                    })
				}else {
                    return;
				}
			}
        }
	</script>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
				<div class="login_info fl">
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
				<div class="user_link fl">
					<span>|</span>
					<a href="${pageContext.request.contextPath}/user_center_info.jsp">用户中心</a>
					<span>|</span>
					<a href="${pageContext.request.contextPath}/cart.jsp">我的购物车</a>
					<span>|</span>
					<a href="${pageContext.request.contextPath}/user_center_order.jsp">我的订单</a>
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>		
	</div>

	<script>
        $(function () {
            $.post("${pageContext.request.contextPath}/cart/getcart","uid=${uid}",function(data){

            })
        })
	</script>

	<div class="total_count">全部商品<em>${allCart}</em>件</div>
	<ul class="cart_list_th clearfix">
		<li class="col01">商品名称</li>
		<li class="col02">商品单位</li>
		<li class="col03">商品价格</li>
		<li class="col04">数量</li>
		<li class="col05">小计</li>
		<li class="col06">操作</li>
	</ul>

	<c:forEach items="${carts}" var="ct" varStatus="i">
		<ul class="cart_list_td clearfix">
			<li class="col01"><input type="checkbox" name="check" checked></li>
			<li class="col02"><img src="${pageContext.request.contextPath}/images/${ct.goods.picture}"></li>
			<li class="col03">${ct.goods.name}<br><em>${ct.goods.price}元/500g</em></li>
			<li class="col04">500g</li>
			<li class="col05">${ct.goods.price}元</li>
			<li class="col06">
				<div class="num_add">
					<a href="javascript:;" class="add fl" onclick="pNum(${ct.goods.id},${ct.goods.price},${ct.gnum})">+</a>
					<input type="text" class="num_show fl" onblur="changeNum()" readonly="readonly" id="num${i.count}" value="${ct.gnum}">
					<a href="javascript:;" class="minus fl" onclick="mNum(${ct.goods.id},${ct.goods.price},${ct.gnum},${i.count})">-</a>
				</div>
			</li>
			<li class="col07">${ct.money}元</li>
			<li class="col08"><a href="javascript:;">删除</a></li>
		</ul>
	</c:forEach>

	<ul class="settlements">
		<li class="col01"><input type="checkbox" name="" checked=""></li>
		<li class="col02">全选</li>
		<li class="col03">合计(不含运费)：<span>¥</span><em id="total">${cartfee}</em><br>共计<b id="show_count"></b>件商品</li>
		<li class="col04"><a href="place_order.jsp">去结算</a></li>
	</ul>

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