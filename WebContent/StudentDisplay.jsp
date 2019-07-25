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
.fir{
height:300px;
border:1px solid #D3D3D3;
width:80%;
margin-left:10%;
margin-top:20px;
background:#F5F5DC;
}
.sed{
height:500px;
border:1px solid #D3D3D3;
width:80%;
margin-left:10%;
margin-top:20px;
}
.xm{
color:black;
font-size:20px;
font-weight:800;
}
.zt{
padding-left:10px;
color:#696969;
font-size:14px;
margin-top:25px;
}
.bzt{
color:black;
margin-top:20px;
margin-left:0px;
}
.nsed{
margin-top:40px;
}
.xbtt{
margin-left:10%;
margin-top:40px;
font-weight:800;
}
.clg{
color:grey;
}
</style>
<title>个人信息展示</title>

</head>
<body>

<%@include file="mynav.jsp" %>

<h5>	<a href="index.jsp">首页</a>>>学生<s:property value="student.name" />展示</h5>
       <hr class="simple" color="#6f5499" />

 <div class="fir text-center">
    <div class="container xs">
        <div class="row">
  
           <div class="col-sm-2">
               <img src="images/<s:property value="student.img"/>" style="width:80%;margin-top:50px;">
           </div>
           
            <div class="col-sm-5 nsed">
                <span>
                    <span class="xm">  <s:property value="student.name" /> </span>
                    <span class="zt">  <s:property value="student.type" />
                    </span>
               </span>
           </div>
           
            <div class="col-sm-5">
            </div>
            
        </div>
     </div>
     
       <%  
          String Ma="";
          if(session.getAttribute("admin")!=null)
             Ma = session.getAttribute("admintype").toString(); //从session里把a拿出来，并赋值给M 
    
            if(Ma.equals("hr")){
         %>  
          <div> 联系方式：<s:property value="student.phone"/>|<s:property value="student.email"/></div>
         <% }%>
    
    
 </div>
 
 
 
          
</body>
</html>