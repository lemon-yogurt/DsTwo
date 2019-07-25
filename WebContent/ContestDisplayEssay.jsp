<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./js/jquery/2.0.0/jquery.min.js"></script>
<link href="./css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="./js/bootstrap/3.3.6/bootstrap.min.js"></script>

<link rel="stylesheet" href="./css/mynav.css" type="text/css">
<script src="./js/mynav.js"></script>


<style>
.img3{
width:30%;
}
pre{
background:transparent;
border:0px;
padding:40px;
}
.bl{
margin-top:60px;
margin-bottom:20px;
}
</style>
<title>比赛信息展示</title>
</head>
<body>
<%@include file="mynav.jsp" %>

<h5>	<a href="index.jsp">首页</a>>><a href="findallC">比赛信息展示</a>>><s:property value="contest.contesttitle" /></h5>
       <hr class="simple" color="#6f5499" />





           <h4 class="bl text-center"><strong><s:property value="contest.title" /></strong></h4>
            <hr class="simple" color="#6f5499" />
            <h5 class="text-muted text-center">主办方：<s:property value="contest.sponsor"/> 日期：<s:property value="contest.fbdate"/></h5>
          <p class="text-muted"><pre style="background:transparent;border:0px;padding:40px;font-size:15px;font-weight:400;font-family:Georgia;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="contest.essay" /></pre></p>
          <div class="text-center"><img src="images/<s:property value="contest.contestimg"/>" class="img3"></div>
          
</body>
</html>