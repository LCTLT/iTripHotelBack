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
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<style type="text/css">
        .img{opacity:0;}
        .imgs{border:1px solid #78C3F3;background: #AADFFD;color: #1E88C7;border-radius: 4px;text-align:center;cursor: pointer;
            padding:10px; width: 27.5%;}
    </style>
</head>
<body>
<div class="page-container">
	<form  <c:if test="${type eq 1}">action="insertHotel.do"</c:if><c:if test="${type eq 2}">action="updateHotel.do"</c:if>  method="post" class="form form-horizontal" id="form-article-add" enctype="multipart/form-data" name="form">
	<input type="hidden" name="type" value="${type}">
	<input type="hidden" name="id" value="${hotel.hotelId}">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${hotel.hotelName}" placeholder="" id="" name="hotelName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">酒店地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${hotel.hotelAddress}" placeholder="" id="" name="hotelAddress">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>一级分类：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="level1" id="level1" class="select">
				<option>请选择</option>
				<c:forEach items="${types1}" var="type1">
					<option value="${type1.id}" <c:if test="${type1.id eq hotel.level1}">selected</c:if>>${type1.name}</option>
				</c:forEach>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>二级分类：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="level2" id="level2" class="select">
					<c:forEach items="${types2}" var="type2">
					<option value="${type2.id}" <c:if test="${type2.id eq hotel.level2}">selected</c:if>>${type2.name}</option>
				</c:forEach>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>三级分类：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="level3" id="level3" class="select">
					<c:forEach items="${types3}" var="type3">
					<option value="${type3.id}" <c:if test="${type3.id eq hotel.level3}">selected</c:if>>${type3.name}</option>
				</c:forEach>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">酒店评分：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${hotel.hotelRatings}" placeholder="" id="" name="hotelRatings">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店星级：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
			<select name="hotelRating" class="select">
			<c:forEach var="dic" items="${dictionarydate}">
				<option value="${dic.info}" <c:if test="${dic.info eq hotel.hotelRating}">selected</c:if>>${dic.info}</option>
			</c:forEach>	
			</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">联系电话：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<input type="text" class="input-text" value="${hotel.hotelphone}" placeholder="" id="" name="hotelphone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">酒店主页显示价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="hotelPrice" id="" placeholder="" value="${hotel.hotelPrice}" class="input-text">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">酒店图片：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-thum-container">
					<div>
						<div><img src="${hotel.fileUrl}" id="img" style="width: 200px" height="130px"></div>
						<input type="hidden" name="fileUrl" value="${hotel.fileUrl}">
						<span>本地文件路径：</span><span style="margin-left:10px;" id="img_spans" class="input-text">${hotel.fileUrl}</span>
					</div>
					<div class="imgs" onclick="document.getElementById('img_1').click()">选择图片</div>
                    <input type="file" class="img" id="img_1" name="file" accept="image/jpg" onchange="l(this)"/>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">详细内容：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<textarea rows="10" cols="135" name="hotelIntro">${hotel.hotelIntro}</textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>
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
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

$(function(){
	var inputBox = document.getElementById("img_1");
	var img = document.getElementById("img");
	inputBox.addEventListener("change",function(){
	  //设置文件名 
	  var name = inputBox.value;
	  $("#img_spans").text(name);
	  
	  var reader = new FileReader();
	  reader.readAsDataURL(inputBox.files[0]);//发起异步请求
	  reader.onload = function(){
	    //读取完成后，将结果赋值给img的src
	    img.src = this.result
	  }
	});
	
	//一级分类下拉 加载二级分类
	$("#level1").change(function(){
		if($(this).val() == "请选择"){
			$("#level2").html("");
			$("#level3").html("");
			return;
		}
		//获取选中的id
		var id = $(this).val();
		$.getJSON("level2-list.do",{id:id},function(result){
			//清空二级分类
			var level2 = $("#level2");
			level2.html("");
			//拼接的字符
			var option = '<option>请选择</option>';
			//添加
			for (var i = 0; i < result.length; i++) {
				option +='<option value="'+result[i].id+'">'+result[i].name+'</option>';
			}
			level2.append(option);
		});
	});
	//二级分类下拉 加载三级分类
	$("#level2").change(function(){
		if($(this).val() == "请选择"){
			$("#level3").html("");
			return;
		}
		//获取选中的id
		var id = $(this).val();
		$.getJSON("level2-list.do",{id:id},function(result){
			//清空三级分类
			var level3 = $("#level3");
			level3.html("");
			//拼接的字符
			var option = '';
			//添加
			for (var i = 0; i < result.length; i++) {
				option +='<option value="'+result[i].id+'">'+result[i].name+'</option>';
			}
			level3.append(option);
		});
	});
	
	
	$("#form-article-add").submit(function(){
		if(form.hotelName.value==""){
			{layer.msg('酒店标题不能为空!', {
				icon : 2,
				time : 2000
			});return false;}
		}
		if(form.hotelAddress.value==""){
			{layer.msg('酒店地址不能为空!', {
				icon : 2,
				time : 2000
			});return false;}
		}
		if(form.level1.value=="" || form.level1.value== "请选择"){
			{layer.msg('请选择酒店一级分类!', {
				icon : 2,
				time : 2000
			});return false;}
		}
		if(form.level2.value=="" || form.level2.value== "请选择"){
			{layer.msg('请选择酒店二级分类!', {
				icon : 2,
				time : 2000
			});return false;}
		}
		if(form.hotelRatings.value==""){
			{layer.msg('酒店评分不能为空!', {
				icon : 2,
				time : 2000
			});return false;}
		}else if(!((/^[0-5]{1}.[0-5]{1}|[0-5]$/).test(form.hotelRatings.value))){
			{layer.msg('酒店评分为0.1-5.0分!', {
				icon : 2,
				time : 2000
			});return false;}
		}
		if(form.hotelAddress.value=="0"){
			{layer.msg('酒店星级不能为空!', {
				icon : 2,
				time : 2000
			});return false;}
		}
		if(form.hotelphone.value==""){
			{layer.msg('联系电话不能为空!', {
				icon : 2,
				time : 2000
			});return false;}
		}else if(!((/^[1][3456789][0-9]{9}$/).test(form.hotelphone.value))){
			{layer.msg('联系电话格式不正确!', {
				icon : 2,
				time : 2000
			});return false;}
		}
		if(form.hotelPrice.value==""){
			{layer.msg('请填写酒店价格!', {
				icon : 2,
				time : 2000
			});return false;}
		}else if(!((/^[0-9]{1,10}$/).test(form.hotelPrice.value))){
			{layer.msg('酒店价格格式不正确!', {
				icon : 2,
				time : 2000
			});return false;}
		}
		if(form.file.value==""){
			{layer.msg('请选择酒店图片!', {
				icon : 2,
				time : 2000
			});return false;}
		}
	});
});
</script>
</body>
</html>