<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>添加用户 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form action="menber-updateUser.do" method="post" class="form form-horizontal" id="form-member-add">
	<input type="hidden" value="${user.id}" id="id">
	<div style="color:red;margin-left:26%;" id="massage"></div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.name}" placeholder="" id="name" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.phone}" placeholder="" id="phone" name="phone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.pwd}" placeholder="" id="pwd" name="pwd">
			</div>
		</div>
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<label class="">
					<input type="radio" value="0" name="sex" <c:if test="${user.status eq 0}">checked="checked"</c:if> id="sex">
					男</label>
					
				</div>
				<div class="radio-box">
					<label class="">
					<input type="radio" value="1" name="sex" <c:if test="${user.status eq 1}">checked="checked"</c:if> id="sex">
					女</label>
				</div>				
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.idcard}" placeholder="" id="idcard" name="idcard">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.email}" placeholder="@" name="email" id="email">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所在城市：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${user.address}" placeholder="" name="address" id="address">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<c:if test="${type eq 1}">
				<botton type="button" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i>提交</botton>
			</c:if>
			<c:if test="${type eq 2}">
				<botton type="button" class="btn btn-success radius" id="admin-role-save2" name="admin-role-save2"><i class="icon-ok"></i>提交</botton>
			</c:if>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	

	
	$("#admin-role-save").click(function(){
		var name = $("#name").val(); //获得name参数
		var phone= $("#phone").val();
		var pwd= $("#pwd").val();
		var sex= $("input[name=sex]:checked").val();
		var idcard= $("#idcard").val();
		var email= $("#email").val();
		var address= $("#address").val();
		//提示
		var massage = $("#massage");
		if(name == ""){
			$("#massage").text("请填写用户名");
		}else if(!(/(^[1][3456789][0-9]{9}$)/.test(phone))){
			$("#massage").text("手机格式不正确");
		}else if(pwd =="" || pwd.length < 6){
			$("#massage").text("密码格式不正确");
		}else if(sex == undefined){
			$("#massage").text("请选择性别");
		}else{
			
			$.post("addUser.do",{
				name:name,
				phone:phone,
				pwd:pwd,
				sex:sex,
				idcard:idcard,
				email:email,
				address:address
			},function(data){
				
				if(data == "1"){
					layer.msg('添加成功!', {
						icon : 1,
						time : 1000
					});
					setTimeout(function(){
						location = "member-list.do";
					}, 2000);
				}else{
					layer.msg('添加失败!', {
						icon : 1,
						time : 1000
					});
				}
			});
		}
	});
	$("#admin-role-save2").click(function(){
		var name = $("#name").val(); //获得name参数
		var phone= $("#phone").val();
		var pwd= $("#pwd").val();
		var sex= $("input[name=sex]:checked").val();
		var idcard= $("#idcard").val();
		var email= $("#email").val();
		var address= $("#address").val();
		var id= $("#id").val();
		//提示
		var massage = $("#massage");
		
		if(!(/(^[1][3456789][0-9]{9}$)/.test(phone))){
			$("#massage").text("手机格式不正确1");
		}else if(pwd =="" || pwd.length < 6){
			$("#massage").text("密码格式不正确1");
		}else if(sex == undefined){
			$("#massage").text("请选择性别类型1");
		}else{
			$.ajax({
				url:"menber_updateUser.do",
				data:{id:id,
					name:name,
					phone:phone,
					pwd:pwd,
					sex:sex,
					idcard:idcard,
					email:email,
					address:address},
				type:"post",
				success:function(data){
					if(data == "1"){
						layer.msg('修改成功!', {
							icon : 1,
							time : 1000
						});
						setTimeout(function(){
							location = "member-list.do";
						}, 2000);
					}else{
						layer.msg('修改失败!', {
							icon : 1,
							time : 1000
						});
					}				
				}
			});
		}
	});
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>