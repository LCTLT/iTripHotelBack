<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<title>后台登录 - 乐游旅游</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="phone" name="" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="pwd" name="" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" id="numbs" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img src="code.do" id="kanbuq"> <a id="" href="javascript:;" onClick="change();">看不清，换一张</a> </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" id="sub" type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 你的公司名称 乐游 v3.1</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<c:if test="${not empty status}">
	<script type="text/javascript">
	$(function(){
		layer.msg('请先登录!',{icon:2,time:1500});
	});
	</script>
</c:if>
<script type="text/javascript">
//图片验证码
function change(){
	var img=document.getElementById("kanbuq");
	//因为浏览器有缓存，需要发送不同参数
	img.src="code.do?a="+new Date().getTime();
}
$(function(){
    $("#sub").click(function(){//给按钮加点击事件
        //取用户名和密码
        var userName = $.trim($("#phone").val());//取输入的用户名
        var pwd = $.trim($("#pwd").val());//取输入的密码
        var numbs = $.trim($("#numbs").val()); //获取输入图片验证码
        if(userName == ""){
        	layer.msg('请输入账户!',{icon:2,time:1500});
        }else if(pwd == ""){
        	layer.msg('请输入密码!',{icon:2,time:1500});
        }else if(pwd.length < 6){
        	layer.msg('密码格式至少为6位字符!',{icon:2,time:1500});
        }else if(numbs == "验证码:" || numbs == ""){
        	layer.msg('请输入验证码!',{icon:2,time:1500});
        }else{
        	$.post("loginlist.do",{phone:userName,pwd:pwd,numbs:numbs},function(data){
        		if(data == "2"){
        			window.location = "index.do";
        		}else if(data == "1"){
        			layer.msg('用户名或密码不正确!',{icon:2,time:1500});
        			change();
        		}else{
        			layer.msg('验证码输入错误!',{icon:2,time:1500});
        			change();
        		}
        	});
        }
    });
});
</script>
</body>
</html>