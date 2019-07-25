<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
<script src="./js/jquery/2.0.0/jquery.min.js"></script>
<link href="./css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="./js/bootstrap/3.3.6/bootstrap.min.js"></script>
<s:head theme="xhtml"/>
<sx:head parseContent="true" extraLocales="UTF-8"/> 


<style>
#web_bg{
  position:fixed;
  top: 0;
  left: 0;
  width:100%;
  height:100%;
  min-width: 1000px;
  z-index:-10;
  zoom: 1;
  background-color: #fff;
  background-repeat: no-repeat;
  background-size: cover;
  -webkit-background-size: cover;
  -o-background-size: cover;
  background-position: center 0;
}
.mask{
    position:fixed;
    top     : 0;
    left    : 0;
    bottom  : 0;
    right   : 0;
    z-index:-9;
   background:rgba(0,0,0,0.3);
}
.ff{
}
.zi {
background-color:white;
width:100%;
margin-top:100px;
height:200px;
}
.fa{
width:80%;
margin-left:10%;
margin-top:-10px;
}
.x{
margin-bottom:-80px;
width:80%;
margin-left:10%;
margin-top:-10px;
color:red;}
</style>

</head>
<body>



<div class="wrapper">
    <!--背景图片-->
    <div id="web_bg" style="background-image: url(./img/login.jpg);"></div>
    <!--其他代码 ... -->
</div>
<div class="mask"></div>



<%
String str=null;
if(session.getAttribute("logina")==null)
{
str=request.getParameter("a"); }
else{
	str=session.getAttribute("logina").toString();
}
int  id=Integer.parseInt(str);  
  if(id==1){%>
  <div class="container">
  <div class="row">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-6 ff">
  <s:form action="Alogin" method="post" enctype="multipart/form-data" class="zi"> 
        <h4 style="color:grey;padding-left:12px;padding-top:12px;">欢迎登陆！</h4>
    <hr class="simple" color="#6f5499" />
     <div class="x"><s:property value="#session.Aloginfail" /></div>
 
   <s:textfield name="administrator.username"  placeholder="username" id="administrator.username" class="form-control fa"/>

    <s:textfield name="administrator.password" placeholder="password" id="administrator.password" class="form-control fa"/></span>
   <s:submit value="登陆" class="btn btn-default center-block"/>
</s:form>
</div>
 <div class="col-sm-3">
    </div>
    </div>
    </div>


<% }else if(id==2){ %>
 <div class="container">
  <div class="row">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-6 ff">
  <s:form action="Jlogin" method="post" enctype="multipart/form-data" class="zi"> 
        <h4 style="color:grey;padding-left:12px;padding-top:12px;">欢迎登陆！</h4>
    <hr class="simple" color="#6f5499" />
     <div class="x"><s:property value="#session.Jloginfail" /></div>
 
   <s:textfield name="jobseeker.username" placeholder="username" id="jobseeker.username" class="form-control fa"/>

    <s:textfield name="jobseeker.password" placeholder="password" id="jobseeker.password" class="form-control fa"/></span>
   <s:submit value="登陆" class="btn btn-default center-block"/>
</s:form>
</div>
 <div class="col-sm-3">
    </div>
    </div>
    </div>
<%}else if(id==3){ %>
 <div class="container">
  <div class="row">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-6 ff">
  <s:form action="Hlogin" method="post" enctype="multipart/form-data" class="zi"> 
        <h4 style="color:grey;padding-left:12px;padding-top:12px;">欢迎登陆！</h4>
    <hr class="simple" color="#6f5499" />
     <div class="x"><s:property value="#session.Hloginfail" /></div>
 
   <s:textfield name="hr.username"  placeholder="username" id="hr.username" class="form-control fa"/>

    <s:textfield name="hr.password" placeholder="password" id="hr.password" class="form-control fa"/></span>
   <s:submit value="登陆" class="btn btn-default center-block"/>
</s:form>
</div>
 <div class="col-sm-3">
    </div>
    </div>
    </div>
<%}else if(id==4){ %>
 <div class="container">
  <div class="row">
    <div class="col-sm-3">
    </div>
    <div class="col-sm-6 ff">
  <s:form action="Stlogin" method="post" enctype="multipart/form-data" class="zi"> 
        <h4 style="color:grey;padding-left:12px;padding-top:12px;">欢迎登陆！</h4>
    <hr class="simple" color="#6f5499" />
     <div class="x"><s:property value="#session.Sloginfail" /></div>
 
   <s:textfield name="student.username"  placeholder="username" id="student.username" class="form-control fa"/>

    <s:textfield name="student.password" placeholder="password" id="student.password" class="form-control fa"/></span>
   <s:submit value="登陆" class="btn btn-default center-block"/>
</s:form>
</div>
 <div class="col-sm-3">
    </div>
    </div>
    </div>
<%} %>


</body>
</html>