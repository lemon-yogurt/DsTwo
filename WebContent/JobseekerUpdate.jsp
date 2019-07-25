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
height:50px;
}
.ss{
 width:100%;

 margin-top:20px;
 padding:10px;

}
.hh4{
font-weight:900;
color:grey;
}
.hx{
height:1px;
width:100%;
border:1px solid grey;
 -webkit-box-shadow:2px 2px 10px grey;
  -moz-box-shadow:2px 2px 10px grey;
  box-shadow:2px 2px 10px grey;}
  .cw{
font-weight:800;color:red;
}
</style>

</head>
<body>

<%@include file="mynav.jsp" %>
  <h5>	<a href="index.jsp">首页</a>>>注册</h5>
       <hr class="simple" color="#6f5499" />
<div class="container">
  <div class="row">
    <div class="col-sm-3">
    </div>
   
    <div class="col-sm-6">
    <div class="cw">  <s:property value="#session.registerfail"/></div> 
<s:form action="Jupdate"  method="post" enctype="multipart/form-data" role="form" class="forms"> 

  <table class="ss">
     <tr class="tt">  <td><h4 class="hh4">个人信息</h4></td> </tr>
     <tr><td><div class="hx"></div></td><td><div class="hx"></div></td><td><div class="hx"></div></td></tr>
      <tr class="tt"><td class="sp">编号：</td><td class="sp2">    <s:textfield name="jobseeker.id" readonly="true" class="form-control" id="jobseeker.id"/>
       </td></tr>
    <tr class="tt">  
    
                         <td class="sp">用户名：</td>
                         <td class="sp2">    <s:textfield name="jobseeker.username" class="form-control" id="jobseeker.username" placeholder="请输入用户名"/>
                         </td></tr>
      
         <tr class="tt"><td class="sp">密码：</td><td class="sp2">
           <s:textfield name="jobseeker.password" class="form-control" id="jobseeker.password"  placeholder="请输入密码"/></td></tr>
           
         <tr class="tt"><td class="sp">姓名：</td><td class="sp2">   
            <s:textfield name="jobseeker.name" class="form-control" id="jobseeker.name" placeholder="请输入姓名"/></td></tr>
         
          <tr class="tt"><td class="sp">出生年月：</td><td class="sp2">   
          <sx:datetimepicker name="jobseeker.birthday"  displayFormat="yyyy-MM-dd" /> </td></tr>
          
          <tr class="tt"><td class="sp">年龄：</td><td class="sp2">   
            <s:textfield name="jobseeker.age" class="form-control" id="jobseeker.age" placeholder="请输入年龄"/></td></tr>
          
          <tr class="tt"><td class="sp">性别：</td><td class="sp2">  
             <s:radio name="jobseeker.sex" list="#{1 : '男', 0 : '女'}"/></td></tr>
           
           <tr class="tt"><td class="sp">电话号码：</td><td class="sp2">   
           <s:textfield name="jobseeker.phone" class="form-control" id="jobseeker.phone" placeholder="请输入电话号码"/></td></tr>
           
            <tr class="tt"><td class="sp">身份证：</td><td class="sp2">   
           <s:textfield name="jobseeker.idcard" class="form-control" id="jobseeker.idcard" placeholder="请输入身份证"/></td></tr>
           
            <tr><td>请导入头像：  </td><td><input type="file" name="pic" required="required" style=" -webkit-box-shadow: 0 0 0px 1000px white  inset !important; margin-top:20px;"></td><td></td></tr>
 <tr><td> <hr class="simple" color="#6f5499" style="width:100%"/></td><td> <hr class="simple" color="#6f5499" style="width:100%"/></td></tr>  
  </table>
  
  <table class="ss">
  
  
       <tr class="tt">  <td><h4 class="hh4">工作经历</h4></td> </tr>
     <tr><td><div class="hx"></div></td><td><div class="hx"></div></td><td><div class="hx"></div></td></tr>             
       <tr class="tt"><td class="sp">毕业学校：</td><td class="sp2">    
            <s:textfield name="jobseeker.school" class="form-control" id="jobseeker.school" placeholder="请输入毕业院校"/></td></tr>
        <tr class="tt"><td class="sp">教育水平：</td><td class="sp2">    
            <s:textfield name="jobseeker.education" class="form-control" id="jobseeker.education" placeholder="请输入教育水平"/></td></tr>
                 
            <tr class="tt"><td class="sp">工作经验时间：</td><td class="sp2">   
           <s:textfield name="jobseeker.worktime" class="form-control" id="jobseeker.worktime" placeholder="请输入工作经验时间"/></td></tr>
           
           <tr class="tt"><td class="sp">居住地：</td><td class="sp2">   
           <s:textfield name="jobseeker.liveplace" class="form-control" id="jobseeker.liveplace" placeholder="请输入工作地点"/></td></tr>
           
           <tr class="tt"><td class="sp">工作状态：</td><td class="sp2">   
           <s:textfield name="jobseeker.workstate" class="form-control" id="jobseeker.workstate" placeholder="请输入电话号码"/></td></tr>
           
           <tr class="tt"><td class="sp">工作经历描述：</td><td class="sp2">   
  
          <s:textfield name="jobseeker.workexperience" class="form-control" id="jobseeker.workexperience" placeholder="请输入工作经历描述"/></td></tr>
  <tr><td> <hr class="simple" color="#6f5499" style="width:100%"/></td><td> <hr class="simple" color="#6f5499" style="width:100%"/></td></tr>  
  </table>
  
  
  <table  class="ss">
  
    
          <tr class="tt">  <td><h4 class="hh4">工作要求</h4></td> </tr>
     <tr><td><div class="hx"></div></td><td><div class="hx"></div></td><td><div class="hx"></div></td></tr>              
       <tr class="tt"><td class="sp">工作类型：</td><td class="sp2">    
            <s:textfield name="jobseeker.worktype" class="form-control" id="jobseeker.worktype" placeholder="请输入工作类型"/></td></tr>
        <tr class="tt"><td class="sp">工作地点要求：</td><td class="sp2">    
            <s:textfield name="jobseeker.workplace" class="form-control" id="jobseeker.workplace" placeholder="请输入地点要求"/></td></tr>
                 
            <tr class="tt"><td class="sp">工作薪资：</td><td class="sp2">   
           <s:textfield name="jobseeker.paymin" class="form-control" id="jobseeker.paymin" placeholder="请输入最少工资"/> <s:textfield name="jobseeker.paymax" class="form-control" id="jobseeker.paymax" placeholder="请输入最多工资"/></td></tr>
           
           <tr class="tt"><td class="sp">入职时间：</td><td class="sp2">   
           <s:textfield name="jobseeker.workdate" class="form-control" id="jobseeker.workdate" placeholder="请输入入职时间"/></td></tr>
           
           <tr class="tt"><td class="sp">工作要求描述：</td><td class="sp2">   
           <s:textfield name="jobseeker.workdescribe" class="form-control" id="jobseeker.workdescribe" placeholder="请输入工作要求描述" rows="3"/></td></tr>
           
        <tr><td> <hr class="simple" color="#6f5499" style="width:100%"/></td><td> <hr class="simple" color="#6f5499" style="width:100%"/></td></tr>                                          
  <s:submit value="修改"  class="btn btn-default" style="width:100%;margin-top:20px;"/>
   </table> 
</s:form>
</div>
<div class="col-sm-3">
</div>
</div>
</div>
</body>
</html>