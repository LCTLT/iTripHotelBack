<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
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
<title>新增图片</title>
<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
<input type="hidden" name="type" value="${type}">
	<form class="form form-horizontal" id="form-article-add">
	<c:if test="${type eq 2}">
		<input type="hidden" name="houseId" value="${House.houseId}">
	</c:if>
	<input type="hidden" name="createBy" value="${userSession.name}">
	<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店范围：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
	        <select name="level1" id="level1" class="select">
				<option value="0">请选择</option>
				<c:forEach items="${types1}" var="type1">
					<option value="${type1.id}" <c:if test="${type1.id eq hotel.level1}">selected</c:if>>${type1.name}</option>
				</c:forEach>
				</select>
	   </span> </div>
	     </div>
	     <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店省份：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="level2" id="level2" class="select">
				<option value="0">请选择</option>
					<c:forEach items="${types2}" var="type2">
					<option value="${type2.id}" <c:if test="${type2.id eq hotel.level2}">selected</c:if>>${type2.name}</option>
				</c:forEach>
				</select>
	    </span> </div>
	    </div>
	    <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店城市：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="level3" id="level3" class="select">
				<option value="0">请选择</option>
					<c:forEach items="${types3}" var="type3">
					<option value="${type3.id}"<c:if test="${type3.id eq hotel.level3}">selected</c:if>>${type3.name}</option>
				</c:forEach>
				</select>
		</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店名称：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="hotelId" id="level4" class="select">
				<option value="0">请选择</option>
				<c:if test="${type eq 2}">
					<option value="${hotel.hotelId}" selected>${hotel.hotelName}</option>
				</c:if>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房间类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${House.houseType}" placeholder="" id="" name="houseType">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">房间设施：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${House.contentOne}" placeholder="" id="" name="contentOne">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">媒体科技：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${House.contentTow}" placeholder="" id="" name="contentTow">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">食品饮品：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${House.contentThree}" placeholder="" id="" name="contentThree">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">浴室：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${House.contentFour}" placeholder="" id="" name="contentFour">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">室外景观：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${House.contentFive}" placeholder="" id="" name="contentFive">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${House.housePrice}" placeholder="" id="" name="housePrice">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">饮食：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="isHavingBreakfast" id="isHavingBreakfast" class="select">
					<option value="1" <c:if test="${House.isHavingBreakfast eq 1}">selected</c:if>>包含早餐</option>
					<option value="0" <c:if test="${House.isHavingBreakfast eq 0}">selected</c:if>>不包含早餐</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-default radius" type="button" id="btn">&nbsp;&nbsp;添加&nbsp;&nbsp;</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>


<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		var type = $("input[name=type]").val();
		if($("#level4").val() == 0 || $("#level4").val().trim() == ""){
			layer.msg('请选择酒店名称!', {
				icon : 2,
				time : 1000
			});
		}else if($("input[name=houseType]").val().trim() == ""){
			layer.msg('请输入房间类型!', {
				icon : 2,
				time : 1000
			});
		}else if(!((/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/).test($("input[name=housePrice]").val()))){
			layer.msg('房间价格格式不正确!', {
				icon : 2,
				time : 1000
			});
		}else{
		if(type == 1){ //添加
			$.post("product-brand-add1.do",$("#form-article-add").serialize(),function(result){
				if(result >= 1){
					layer.msg('添加成功!', {
						icon : 1,
						time : 1000
					});
					setTimeout(function(){
						location = "product-brand.do";
					}, 1500);
				}else{
					layer.msg('添加失败!', {
						icon : 2,
						time : 1000
					});
				}
			});;
		}else{  //修改
			$.post("updateHouse.do",$("#form-article-add").serialize(),function(result){
				if(result >= 1){
					layer.msg('修改成功!', {
						icon : 1,
						time : 1000
					});
					setTimeout(function(){
						location = "product-brand.do";
					}, 1500);
				}else{
					layer.msg('修改失败!', {
						icon : 2,
						time : 1000
					});
				}
			});
		}
		}
		
	});
});



function article_save(){
	alert("刷新父级的时候会自动关闭弹层。")
	window.parent.location.reload();
}


//一级分类下拉 加载二级分类
$("#level1").change(function(){
	if($(this).val() == "0"){
		$("#level2").html("");
		$("#level3").html("");
		//刷新一次酒店
		queryLevel();
		return;
	}else{
		//获取选中的id
		var id = $(this).val();
		$.ajaxSettings.async = false;
		$.getJSON("level2-list1.do",{id:id},function(result){
			//清空二级分类
			var level2 = $("#level2");
			level2.html("");
			//拼接的字符
			var option = '<option value="0">请选择</option>';
			//添加
			for (var i = 0; i < result.length; i++) {
				option +='<option value="'+result[i].id+'">'+result[i].name+'</option>';
			}
			level2.append(option);
		});
	}
	queryLevel();
});
//二级分类下拉 加载三级分类
$("#level2").change(function(){
	if($(this).val() == "0"){
		$("#level3").html("");
		//刷新一次酒店
		queryLevel();
		return;
	}
	//获取选中的id
	var id = $(this).val();
	$.ajaxSettings.async = false;
	$.getJSON("level2-list1.do",{id:id},function(result){
		//清空三级分类
		var level3 = $("#level3");
		level3.html("");
		//拼接的字符
		var option = '<option value="0">请选择</option>';
		//添加
		for (var i = 0; i < result.length; i++) {
			option +='<option value="'+result[i].id+'">'+result[i].name+'</option>';
		}
		level3.append(option);
	});
	queryLevel();
});

//三级分类下拉 加载四级分类
$("#level3").change(function(){
	queryLevel();
});
function queryLevel(){
	//获取选中的id
	var level1 = $("#level1").val();
	var level2 = $("#level2").val();
	var level3 = $("#level3").val();
	if(level2 == "" || level2 == null){
		level2 = 0;
	}
	if(level3 == "" || level3 == null){
		level3 = 0;
	}
	$.ajaxSettings.async = false;
	$.getJSON("level2-list2.do",{level1:level1,level2:level2,level3:level3},function(result){
		//清空四级分类
		var level4 = $("#level4");
		level4.html("");
		//拼接的字符
		var option = '';
		//添加
		for (var i = 0; i < result.length; i++) {
			option +='<option value="'+result[i].hotelId+'">'+result[i].hotelName+'</option>';
		}
		level4.html(option);
	});
}
</script>
</body>
</html>