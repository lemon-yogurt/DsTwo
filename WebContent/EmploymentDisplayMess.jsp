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
height:200px;
border:1px solid #D3D3D3;
width:80%;
margin-left:10%;
margin-top:20px;
background:#F5F5DC;
}
.nb{
margin-top:30px;
margin-left:40px;
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
margin-bottom:30px;
margin-left:8%;
}
.zt{
margin-left:8%;
color:#696969;
font-size:16px;
padding-top:35px;
}
.bzt{
color:black;
margin-top:20px;
margin-left:10%;
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
.ztt{
margin-left:10%;
color:#696969;
font-size:16px;
padding-top:35px;
}
</style>
<title>比赛信息展示</title>

</head>
<body>

<%@include file="mynav.jsp" %>

<h5>	<a href="index.jsp">首页</a>>><a href="EfindallC">招聘展示</a>>><s:property value="jobseeker.name" /></h5>
       <hr class="simple" color="#6f5499" />

 <div class="fir ">

           
           <div class="nb">
               
                    <div class="xm">  <s:property value="employment.workname" /> </div>
                    <span class="zt">  <s:property value="employment.paymin"/>~<s:property value="employment.paymax"/>岁 | 
                                       <s:property value="employment.position"/>|
                                        <s:property value="employment.worktime"/>| 
                                        <s:property value="employment.education"/>
                    </span>
               
               <div class="bzt">更新时间：<s:property value="employment.updatetime"/></div>
             
        </div>     
          
     </div>
     
       <%  
          String Ma="";
          if(session.getAttribute("admin")!=null)
             Ma = session.getAttribute("admintype").toString(); //从session里把a拿出来，并赋值给M 
    
            if(Ma.equals("人才")){
         %>  
          <div>  <a href="Hfindbyid?a=<s:property value="employment.hrid"/>"></a></div>
         <% }%>
    
    
 </div>
 
 
  <div class="sed">
   <h4 class="xbtt"><span class="glyphicon glyphicon-lock"></span>职位描述</h4>
         <hr class="simple" color="#6f5499" width="80%"/>
                    <span class="ztt">  <s:property value="employment.agemin"/>~<s:property value="employment.agemax"/>
                    </span>
    
               <div class="bzt"><span class="clg">工作责任：</span><s:property value="employment.workduty"/></div>
               <div class="bzt"><span class="clg">工作具体要求：</span><s:property value="employment.workrequire"/></div>
            
               <div class="bzt"><span class="clg">工作优势：</span><s:property value="employment.workad"/></div>
               
          
    
    
     <h4 class="xbtt"><span class="glyphicon glyphicon-lock"></span>公司描述</h4>
         <hr class="simple" color="#6f5499" width="80%"/>
    
    
               <div class="bzt"><span class="clg">公司名称：</span><s:property value="employment.companyname"/></div>
               <div class="bzt "><span class="clg">公司地址：</span><s:property value="employment.workpalce"/></div>
               <div class="bzt"><span class="clg">公司描述：</span><s:property value="employment.companydescription"/>~<s:property value="jobseeker.paymax"/></div>
      
 </div>     
          
</body>
</html>