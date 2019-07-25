<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
<s:head theme="xhtml"/>
<sx:head parseContent="true" extraLocales="UTF-8"/> 
<script src="./js/jquery/2.0.0/jquery.min.js"></script>
<link href="./css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="./js/bootstrap/3.3.6/bootstrap.min.js"></script>

<link rel="stylesheet" href="./css/mynav.css" type="text/css">

<script src="./js/mynav.js"></script>

<style>
.forms{
  width:100%;
}
.sp{
font-size:15px;
}
.sp2{
 
 margin-left:333px;
  padding-left:0px;
}
.tt{
 width:100%;
}
.ss{
 width:100%;
}
.cw{
font-weight:800;color:red;
}
</style>

</head>
<body>

<%@include file="mynav.jsp" %>
  <h5>	<a href="index.jsp">首页</a>>>添加管理员</h5>
       <hr class="simple" color="#6f5499" />
<div class="container">
  <div class="row">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-6">
    <div class="cw">  <s:property value="#session.registerfail"/></div> 
<s:form action="Asave"  method="post" enctype="multipart/form-data" role="form" class="forms"> 
 
  <table class="ss">
       <tr class="tt"><td class="sp">用户名：</td><td class="sp2">    <s:textfield name="administrator.username" class="form-control" id="student.username" placeholder="请输入用户名"/>
       </td></tr>
      
         <tr><td class="sp">密码：</td><td class="sp2">
           <s:textfield name="administrator.password" class="form-control" id="administrator.password"  placeholder="请输入密码"/></td></tr>
           
                             <tr><td>请导入头像：  </td><td><input type="file" name="pic" required="required" style=" -webkit-box-shadow: 0 0 0px 1000px white  inset !important; margin-top:20px;"></td></tr>
  
  <s:submit value="添加"  class="btn btn-default" style="width:100%;margin-top:20px;"/>
   </table> 
</s:form>
</div>
<div class="col-sm-3">
</div>
</div>
</div>
</body>
</html>