<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<head>
	<title>天天生鲜-注册</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<%--<script src="https://cdn.bootcss.com/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>--%>
</head>
<body>
<script type="text/javascript">
	var name=0;
	var pwd=0;
	var repwd=0;
	var mail=0;

	//验证用户名是否存在
    $(function(){
        //验证用户名是否存在
        $("#username").blur(function(){
            //使用ajax 做username 的异步验证
            if (this.value==null||this.value.trim().length==0) {
                $("#error_tip1").html("用户名不能为空").css("color","red");
                return;
            }
            if (this.value<5 ||this.value>20) {
                $("#error_tip1").html("用户名长度5-20").css("color","red");
                return;
            }
            $.post("${pageContext.request.contextPath}/user/checkUserName","username="+this.value,function(data){
                if(data=="1"){
                    $("#error_tip1").html("用户名已经存在").css("color","red");
                }else{
                    $("#error_tip1").html("用户名可用").css("color","green");
                    name=1;
                }
            })
        });

        //验证邮箱格式
        $("#email").blur(function(){
            var reg="^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$";
            if (this.value==null || this.value.trim().length==0) {
                $("#error_tip4").html("邮箱不能为空").css("color","red");
                return;
            }
            if (this.value.match(reg)) {
                //使用ajax 做username 的异步验证
                $.post("${pageContext.request.contextPath}/user/checkEmail","email="+this.value,function(data){
                    // alert(data);
                    if(data=="1"){
                        $("#error_tip4").html("邮箱已经存在").css("color","red");
                    }else{
                        $("#error_tip4").html("邮箱可用").css("color","green");
                        mail=1;
                    }
                })
            }else {
                $("#error_tip4").html("邮箱格式不正确").css("color","red");
                return;
			}

        });

        //表单提交
        $("#sub").click(function () {
			$.post("${pageContext.request.contextPath}/user/regist",$("#form_reg").serialize(),function(data){
				if(data=="1"){
					alert("注册成功");
					location.href="${pageContext.request.contextPath}/user/login";
				}
			})
        }

        //验证密码格式
        $("#password").blur(function(){
            if (this.value==null || this.value.trim().length==0) {
                $("#error_tip2").html("密码不能为空").css("color","red");
                return;
            }
            if (this.value.length<8 || this.value.length>20){
                $("#error_tip2").html("密码长度为8-20").css("color","red");
            }else {
                $("#error_tip2").html("密码可用").css("color","green");
                pwd=1;
            }

        });
    })

    //验证重读密码
	function repwdchange(obj) {
        var pwd=document.getElementById("password");
        if (pwd.value!=obj.value || pwd.value==null || pwd.value.trim().length==0){
            $("#error_tip3").html("两次密码不一致").css("color","red");
            return;
        }else {
            $("#error_tip3").html("ok").css("color","green");
            repwd=1;
        }
    }

</script>

	<div class="register_con">
		<div class="l_con fl">
			<a class="reg_logo"><img src="images/logo02.png"></a>
			<div class="reg_slogan">足不出户  ·  新鲜每一天</div>
			<div class="reg_banner"></div>
		</div>

		<div class="r_con fr">
			<div class="reg_title clearfix">
				<h1>用户注册</h1>
				<a href="login.jsp">登录</a>
			</div>
			<div class="reg_form clearfix">
				<form id="form_reg">
				<ul>
					<li>
						<label>用户名:</label>
						<input type="text" name="username" id="username"/>
						<span id="error_tip1"></span>
					</li>					
					<li>
						<label>密码:</label>
						<input type="password" name="password" id="password"/>
						<span id="error_tip2"></span>
					</li>
					<li>
						<label>确认密码:</label>
						<input type="password" name="repassword" id="repassword" onblur="repwdchange(this)"/>
						<span id="error_tip3"></span>
					</li>
					<li>
						<label>邮箱:</label>
						<input type="text" name="email" id="email"/>
						<span id="error_tip4"></span>
					</li>
					<li class="agreement">
						<input type="checkbox" name="allow" id="allow" checked="checked"/>
						<label>同意”天天生鲜用户使用协议“</label>
						<span id="error_tip5"></span>
					</li>
					<li >
						<input type="button" id="sub" value="注 册"/>
					</li>
				</ul>				
				</form>
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