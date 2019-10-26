<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<head>
	<title>天天生鲜-登录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
</head>
<body>
<script type="text/javascript">
	var name=0;
	var password=0;
	var code=0;

    $(function(){
        // 输入的验证码 是否正确
        $("#code").blur(function(){
            if (this.value==null||this.value.trim().length==0) {
                $("#checkMsg").html("验证码不能为空").css("color","red");
                return;
            }
            $.post("${pageContext.request.contextPath}/user/checkCode","code="+this.value,function(data){
                if(data=="0"){
                    $("#checkMsg").html("<font color='green'>OK</font>");
                    code=1;
                }else if (data!="0") {
                    $("#checkMsg").html("<font color='red'>ERROR</font>");
                    $("#sercode").attr("src","${pageContext.request.contextPath}/user/getCode?num="+Math.random());
                }
            })
        });

        //验证用户名是否为空
        $("#username").blur(function(){
            //使用ajax 做username 的异步验证
            if (this.value==null||this.value.trim().length==0) {
                $("#user_error").html("用户名不能为空").css("color","red");
                return;
            }else {
                $("#user_error").html("");
                name=1;
			}
        });

        //验证密码是否为空
        $("#password").blur(function(){
            //使用ajax 做username 的异步验证
            if (this.value==null||this.value.trim().length==0) {
                $("#pwd_error").html("密码不能为空").css("color","red");
                return;
            }else {
                $("#pwd_error").html("");
                password=1;
            }
        });

        //表单提交
        $("#sub").click(function () {
            if (name && password && code){
                $.post("${pageContext.request.contextPath}/user/login",$("#form_log").serialize(),function(data){
                    if(data=="1"){
                        alert("登录成功");
                        location.href="${pageContext.request.contextPath}/index.jsp";
                    }else {
                        <%--$("#msg").html("${msg}");--%>
						alert("用户名或密码错误");
                        location.href="${pageContext.request.contextPath}/login.jsp";
					}
                })
			}else {
                alert("请验证表单内容是否填写完整!");
			}
        })
    })

    function changecode(obj) {
        obj.src="${pageContext.request.contextPath}/user/getCode?num="+Math.random();
    }
</script>

	<div class="login_top clearfix">
		<a href="index.jsp" class="login_logo"><img src="${pageContext.request.contextPath}/images/logo02.png"></a>
	</div>

	<div class="login_form_bg">
		<div class="login_form_wrap clearfix">
			<div class="login_banner fl"></div>
			<div class="slogan fl">日夜兼程 · 急速送达</div>
			<div class="login_form fr">
				<div class="login_title clearfix">
					<h1>用户登录</h1>
					<a href="register.jsp">立即注册</a>
				</div>
				<div class="form_input">
					<form id="form_log" style="height: 100px;">
						<input type="text" id="username" name="username" placeholder="请输入用户名/邮箱" style="height: 29px;padding-top: 0px;width: 312px;">
						<div id="user_error" style="height: 25px;"></div>
						<input type="password" name="password" id="password" placeholder="请输入密码" style="height: 29px;width: 312px;">
						<div id="pwd_error" style="height: 25px;"></div>

						<div style="position: absolute;left: 0;top: 120px;">
							<img src="${pageContext.request.contextPath}/user/getCode" id="sercode" onclick="changecode(this)">
							<input id="code" type="text" name="code" style="background: #fdfdfd;height: 25px;width: 100px;vertical-align: middle;">
							<span id="checkMsg"></span>
						</div>

						<div class="more_input clearfix">
							<input type="checkbox" name="remember">
							<label>记住用户名</label>
							<a href="#">忘记密码</a>
						</div>
						<input type="button" id="sub" value="登录" class="input_submit">
						<div style="color: red" id="msg"></div>
					</form>
					<%--<form id="form_log">--%>
						<%--<input type="text" id="username" name="username" placeholder="请输入用户名/邮箱">--%>
						<%--<div id="user_error"></div>--%>
						<%--<input type="password" name="password" id="password" placeholder="请输入密码">--%>
						<%--<div id="pwd_error"></div>--%>

						<%--<div style="position: absolute;left: 0;top: 120px;">--%>
							<%--<img src="${pageContext.request.contextPath}/user/getCode" id="sercode" onclick="changecode(this)"/>--%>
							<%--<input id="code" type="text" name="code" style="background: #fdfdfd;height: 25px;width: 100px;vertical-align: middle;"/>--%>
							<%--<span id="checkMsg"></span>--%>
						<%--</div>--%>

						<%--<div class="more_input clearfix">--%>
							<%--<input type="checkbox" name="remember">--%>
							<%--<label>记住用户名</label>--%>
							<%--<a href="#">忘记密码</a>--%>
						<%--</div>--%>
						<%--<input type="button" id="sub" value="登录" class="input_submit"/>--%>
						<%--<div style="color: red">${logmsg}</div>--%>
					<%--</form>--%>
				</div>
			</div>
		</div>
	</div>

	<div class="footer no-mp">
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