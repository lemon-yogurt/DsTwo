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

<link type="text/css" rel="Stylesheet" href="css/imageflow.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/imageflow.js"></script>
<script type="text/javascript" src="js/numbleroll.js"></script>
<script>
$(function () {
    $(".dropdown").mouseover(function () {
        $(this).addClass("open");
    });

    $(".dropdown").mouseleave(function(){
        $(this).removeClass("open");
    })

})
 $(window).scroll(function () {
            if ($(".navbar").offset().top > 50) {$(".navbar-fixed-top").addClass("top-nav");
            }else {$(".navbar-fixed-top").removeClass("top-nav");}
        })
 
        
        
        
</script>
<style>
html, body {width:100%;height:100%;} /*非常重要的样式让背景图片100%适应整个屏幕*/
        .bg {display: table;width: 100%;height: 100%;text-align: center;color: #fff;background-size: cover;}
        .my-navbar {padding:20px0 ;transition: background 0.5s ease-in-out, padding 0.5s ease-in-out;}
        .my-navbar a{background:transparent !important;color:#fff !important}
        .my-navbar a:hover {color:#45bcf9 !important;background:transparent;outline:0}
        .my-navbar a {transition: color 0.5s ease-in-out;}/*-webkit-transition ;-moz-transition*/
        .top-nav {padding:0;background:#000;}
       
        button.navbar-toggle > span.icon-bar {background-color:#dedede}
.my-menu{
margin-top:0px;
background:rgba(84,255,159,0.1);
color:#fff !important;
}

 div.item img{
    width:100%;
   }
  div#carousel-example-generic{
    width:100%;
    margin:0 auto;
  }
.dlleft{
padding-left:500px;
}
.img1{
width:15px;
float:left;
}
.xx{
padding-right:20px;}
.xbt{
margin-top:100px;
}
.img2{
width:95%;
}
.fir{
margin-top:15px;
font-size:25px;
margin-bottom:15px;
}
.bl{
color:black;
}
.hh{
transition:transform 0.1s;
}
.hh:hover{
cursor:pointer;
transform:translate(0,-10px);
text-decoration: none;
background-color:grey;

}
a:focus {
  text-decoration: none;
}
.twoimg{
background-repeat: no-repeat; /*背景图像不平铺*/
				background-position:center;/*图片居中显示*/
				background-size: cover; /*隐藏不需要显示的图片*/
				height:170px;
				width: 100%;	
}
.dlm{
color:white;
margin-top:20px;
}

.sjsp{
  font-size:45px;
  font-weight:1200;
  }
  .sjspt{
  color:#BEBEBE;font-size:20px;padding-left:5px;}
  .sjx{
  color:grey;font-size:50p;}

.footbj{
background:#F5F5F5;
margin-top:60px;}
.dzt{
font-weight:1000;
font-size:30px;
}
.xzt{
font-size:12px;padding-left:15px;color:grey}
.bq{
color:grey;
font-size:12px;
padding-bottom:20px;
padding-left:40px;
} 
.nr{
padding-top:20px;
}


</style>   
<title>成荫绿建有限公司</title>
</head>
<body>
<form action="findthree" method="post" id="index"></form>
<form action="Gfindthree" method="post" id="ndex"></form>

<s:if test="#session.greenbuilds==null">
            <script>
                window.onload = function () {
        
                    document.getElementById("ndex").submit();
                }
            </script>
</s:if>
<s:if test="contests==null">
            <script>
                window.onload = function () {
                    document.getElementById("index").submit();
                }
            </script>
</s:if>



<nav class="navbar navbar-fixed-top my-navbar" role="navigation">
<div class="container-fluid">
            <div class="navbar-header xx">
                <a class="navbar-brand " href="index.jsp"><img src="./img/logo.png" class="img1"></img>成荫</a>
            </div>
            <div class="collapse navbar-collapse " id="example-navbar-collapse">
                <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                <li class="dropdown">
		                <a class="dropdown-toggle" data-toggle="dropdown" href="#">人才智库 <span class="caret"></span>
		                </a>
		                     <ul class="dropdown-menu my-menu">
			                      <li><a href="findallC">赛事信息</a></li>
			                       <li><a href="SfindallC">校招信息</a></li>
			                          <li><a href="QfindallC">论坛讨论</a></li>
			                          <li><a href="JfindallC">人才展示</a></li>
			                           <li><a href="EfindallC">招聘展示</a></li>
			                            <%  
          
          if(session.getAttribute("hrid")!=null) {  %>  
             <li><a href="EmploymentSave.jsp">增加招聘</a></li><%} %>
<%  
        
          if(session.getAttribute("admin")!=null){
         %>  
        <li> <a href="QuestionSave.jsp">提问</a></li>
         <% }%>
		                   </ul>
	              </li>
	               <li class="dropdown">
		                <a class="dropdown-toggle" data-toggle="dropdown" href="#">绿色建筑 <span class="caret"></span>
		                </a>
		                     <ul class="dropdown-menu my-menu">
			                      <li><a href="GfindallC">绿建信息</a></li>
			                          <li><a href="PfindallC">政策信息</a></li>

		                   </ul>
	              </li>
                 <li role="presentation"><a href="#">绿筑商城</a></li>
                  <%  
          String Ma="";
          if(session.getAttribute("admin")!=null)
             Ma = session.getAttribute("admintype").toString(); //从session里把a拿出来，并赋值给M 
    
            if(Ma.equals("管理员")){
         %>  
        <li role="presentation"><a href="AdministratorSave.jsp">添加管理员</a></li>
         <li class="dropdown">
		                <a class="dropdown-toggle" data-toggle="dropdown" href="#">添加 <span class="caret"></span>
		                </a>
		                     <ul class="dropdown-menu my-menu">
			                      <li><a href="ContestSave.jsp">添加赛事信息</a></li>
			                          <li><a href="PolicySave.jsp">添加政策信息</a></li>
			                            <li><a href="SchoolreSave.jsp">添加校招信息</a></li>
			                              <li><a href="GreenbuildSave.jsp">添加绿建信息</a></li>

		                   </ul>
	              </li>
	                <li role="presentation"><a href="Aupdatefind">修改个人人信息</a></li>
         <% }else if(Ma.equals("hr")){%>
                    <li role="presentation"><a href="Hupdatefind">修改个人人信息</a></li>
                        <% }else if(Ma.equals("人才")){%>
                    <li role="presentation"><a href="Jupdatefind">修改个人人信息</a></li>
                        <% }else if(Ma.equals("学生")){%>
                    <li role="presentation"><a href="Stupdatefind">修改个人人信息</a></li><%} %>
               
                <%  
          String M="";
          if(session.getAttribute("admin")!=null)
          {  M = session.getAttribute("adminname").toString(); //从session里把a拿出来，并赋值给M %>  
          <li role="presentation" class="dlleft"><div class="dlm"><s:property value="#session.adminname"/>，欢迎你.</li>
           <li role="presentation" style="padding-left:20px;"><div class="dlm"><a href="tc">退出登陆</a></li><%} else {%>
                 <li role="presentation" class="dlleft"><a href="LoginChoose.jsp">登陆</a></li>
                 <li role="presentation" class=""><a href="RegisterChoose.jsp">注册</a></li><%} %>
                </ul>
            </div>
        </div>
</nav>





<div >
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
  </ol>
 
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <a href="https://mp.weixin.qq.com/s/j3FfGTJz1DbPFouPYFZ6RA"><img src="./img/zy1.jpg" ></a> 
    </div>
    <div class="item">
           <a href="https://mp.weixin.qq.com/s/ucpWCZ-GO23AXJTWXqttew"><img src="./img/zy2.jpg" ></a> 
    </div>
    <div class="item">
          <a href="https://mp.weixin.qq.com/s/VTzbsDf06vUSClCfBjPS8w">  <img src="./img/zy3.jpg" ></a>
    </div>
 
    <div class="item">
           <a href="https://mp.weixin.qq.com/s/EYkCB8ztCoVVb30XhSKdAg" ><img src="./img/zy4.jpg" ></a>
    </div>
 
  </div>
 
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
 
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
 
  </a>
</div> 



<h5 class="text-center text-muted xbt"><strong class="text-warning">绿色建筑</strong>的优势</h5> 
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />
<div class="container">
  <div class="row">
    <div class="col-sm-4">
    <img src="./img/dantu.jpg" class="img2"></img>
    </div>
      <div class="col-sm-1">
      </div>
     <div class="col-sm-7">
        <div class="row">
      <h4 style="font-weight:800;color:#FFD700">The advantages of green building?</h4>
    <h4 style="font-weight:800;">发展绿色建筑的优势是什么？</h4>
   
        <div class="col-sm-5">
    <span class="glyphicon glyphicon-tree-conifer text-success fir" style="color:#FFD700"></span>
    <h4><strong>生态方面</strong></h4>
    <p style="color:grey">绿色建筑推荐使用节能环保产品，符合可持续发展攻略,这是一个演示引导主体副本用法的实例。这是一个演示引导主体副本用法的实例</p>
    <span class="glyphicon glyphicon-eur text-success fir" style="color:#FFD700"></span>
     <h4><strong>社会方面</strong></h4>
    <p style="color:grey">绿色建筑的发展顺应时代趋势，社会需求大，具有广阔前景这是一个演示引导主体副本用法的实例。这是一个演示引导主体副本用法的实例</p>
    </div>
    <div class="col-sm-2">
    </div>
    <div class="col-sm-5">
    
    <span class="glyphicon glyphicon-eye-open text-success fir" style="color:#FFD700"></span>
     <h4><strong>经济方面</strong></h4>
    <p style="color:grey">为人们提供舒适的生活环境，节能环保，产生良好的社会效益这是一个演示引导主体副本用法的实例。这是一个演示引导主体副本用法的实例。</p>
    </div>
    </div>
  </div>
</div>

<h5 class="text-center text-muted xbt"><strong class="text-warning">赛事</strong>相关</h5> 
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />
<div class="container">
  <div class="row">
    <div class="col-sm-6">


     <s:iterator value="contests" >
         <a href="findbyid?a=<s:property value="id"/>" class="hh">
          <h4 class="text-muted"><s:property value="fbdate"/></h4>
          <h4 class="bl"><strong><s:property value="title" /></strong></h4>
          <hr align=left width=10% />
          <p class="text-muted"><s:property value="essay" />……</p>
        </a>
         <hr class="simple" color="#6f5499" />
    </s:iterator>

    </div>
    <div  class="col-sm-6">
     <a href="findbyid?a=<s:property value="contest.id"/>" class="hh">
          <h4 class="text-muted"><s:property value="contest.fbdate"/></h4>
          <img src="images/<s:property value="contest.contestimg"/>" class="twoimg">
          <h4 class="bl"><strong><s:property value="contest.title" /></strong></h4>
          <hr align=left width=10% />
          <p class="text-muted"><s:property value="contest.essay" />……</p>
        </a>
        <div class=""><a href="findallC" class="btn btn-default" style="width:30%;color:#9BCD9B;border:1px solid #E8E8E8">查看更多</a></div>
         <hr class="simple" color="#6f5499" />
    </div>
  </div>
</div> 
 
 
 <h5 class="text-center text-muted xbt"><strong class="text-warning">绿色</strong>建筑</h5> 
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />
  
  
  
  
  
  
  
  
   <!--效果html开始-->
  <div id="LoopDiv" style="">
    <input id="S_Num" type="hidden" value="8" />
    <div id="starsIF" class="imageflow"> 
      <s:iterator value="#session.greenbuilds" >
     
	<img src="images/<s:property value="img"/>" longdesc="Gfindbyid?a=<s:property value="id"/>" width="280" height="300" alt="Picture" class="hh"/> 
		   </s:iterator>
		 
  
    
    <%
    if(session.getAttribute("tpnumble")!=null){
    String sx=session.getAttribute("tpnumble").toString();
    int x=Integer.parseInt(sx);
    if(x<12&&x!=0) {
     for(int i=0;i<12-x;i++){%>
     <img src="./img/bban.jpg" longdesc="#" width="280" height="300" alt="Picture" class="hh"/> 
		<%}} }%>
		</div>
  </div>
  <!--效果html结束-->
  <div class="clear"></div>
  

  
  
  <h5 class="text-center text-muted xbt" style="margin-top:-200px;"><strong class="text-warning">累计</strong>数据</h5> 
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />
<div class="container">
  <div class="row">
  <div class="col-sm-1">
    </div>
    <div class="col-sm-2">
     <span class="sjsp timer count-title" id="count-number" data-to="400" data-speed="2500"></span><span  class="glyphicon glyphicon-fire sjspt"></span>
     <p class="sjx">合作赛事</p>
    </div>
    <div class="col-sm-2">
   <span class="sjsp timer count-title" id="count-number" data-to="900" data-speed="2500"></span><span class="glyphicon glyphicon-check sjspt" ></span>
     <p class="sjx">合作项目</p>
    </div>
    <div class="col-sm-2">
   <span class="sjsp timer count-title" id="count-number" data-to="1900" data-speed="2500"></span><span class="glyphicon glyphicon-flash sjspt" ></span>
     <p class="sjx">节约用电度数</p>
    </div>
    <div class="col-sm-2">
   <span class="sjsp timer count-title" id="count-number" data-to="2000" data-speed="2500">></span><span class=" glyphicon glyphicon-usd sjspt" ></span>
     <p class="sjx">节约用电费用</p>
    </div>
    <div class="col-sm-3">
   <span class="sjsp">更多咨询</span>
     <p class="sjx">敬请期待</p>
    </div>
   
  </div>
</div> 
 
 <h5 class="text-center text-muted xbt"><strong class="text-warning">主营</strong>业务</h5> 
<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />
  
<div class="container">
  <div class="row">
    <div class="col-sm-4">
    <div class="text-center" style="backgrond-color:black">
    <img src="./img/gn1.jpg" class="" style="width:80%;"></img>
    <p class="sjx" style="backgrond-color:black">人才智库</p>
    </div>
    </div>
    <div class="col-sm-4">
    <div class="text-center">
     <img src="./img/gn2.jpg" class="" style="width:80%;"></img>
      <p class="sjx">绿色建筑</p>
      </div>
    </div>
    <div class="col-sm-4">
    <div class="text-center">
     <img src="./img/gn3.jpg" class="" style="width:80%;"></img>
      <p class="sjx">绿色商城</p>
      </div>
    </div>
  </div>
</div>
 
<div class="footbj">
 
<div class="container nr">
  <div class="row">
    <div class="col-sm-4 dzt">
    <span class="glyphicon glyphicon-leaf" style="padding-left:10%;"></span><span>成荫小筑</span>
    </div>
    <div class="col-sm-5 xzt">
    <span class="glyphicon glyphicon-earphone"></span><span style="padding-right:10px;">010-456789</span>|<span class="glyphicon glyphicon-envelope" style="padding-left:10px;"></span><span>chengyin@163.com</span>
    <p style="padding-top:10px;"><span class="glyphicon glyphicon-map-marker"></span><span>留和路288号</span></p>
    </div>
  </div>
</div> 

<hr  width="95%" style="color:black" size="1" />
<h5 class="bq">版权所有©成荫小筑</h5>  
 
</div>  
 
 
 
<div class="digital">
<div class="main">
	<div class="mumping_mun">
	
	  <div class="mun_top">

	  </div>  
	
	</div>
</div>
</div>

   <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript">
	//窗口显示才加载
	var wrapTop = $(".digital").offset().top;
	var istrue = true;
	$(window).on("scroll",
	function() {
	    var s = $(window).scrollTop();
	    if (s > wrapTop - 500 && istrue) {
	        $(".timer").each(count);
	        function count(a) {
	            var b = $(this);
	            a = $.extend({},
	            a || {},
	            b.data("countToOptions") || {});
	            b.countTo(a)
	        };
	        istrue = false;
	    };
	})
	//设置计数
	$.fn.countTo = function (options) {
		options = options || {};
		return $(this).each(function () {
			//当前元素的选项
			var settings = $.extend({}, $.fn.countTo.defaults, {
				from:            $(this).data('from'),
				to:              $(this).data('to'),
				speed:           $(this).data('speed'),
				refreshInterval: $(this).data('refresh-interval'),
				decimals:        $(this).data('decimals')
			}, options);
			//更新值
			var loops = Math.ceil(settings.speed / settings.refreshInterval),
			    increment = (settings.to - settings.from) / loops;
			//更改应用和变量
			var self = this,
			$self = $(this),
			loopCount = 0,
			value = settings.from,
			data = $self.data('countTo') || {};
			$self.data('countTo', data);
			//如果有间断，找到并清除
			if (data.interval) {
				clearInterval(data.interval);
			};
			data.interval = setInterval(updateTimer, settings.refreshInterval);
			//初始化起始值
			render(value);
			function updateTimer() {
				value += increment;
				loopCount++;
				render(value);
				if (typeof(settings.onUpdate) == 'function') {
					settings.onUpdate.call(self, value);
				}
				if (loopCount >= loops) {
					//移出间隔
					$self.removeData('countTo');
					clearInterval(data.interval);
					value = settings.to;
					if (typeof(settings.onComplete) == 'function') {
						settings.onComplete.call(self, value);
					}
				}
			}
			function render(value) {
				var formattedValue = settings.formatter.call(self, value, settings);
				$self.html(formattedValue);
			}
			});
        };
        $.fn.countTo.defaults={
        	from:0,               //数字开始的值
        	to:0,                 //数字结束的值
        	speed:1000,           //设置步长的时间
        	refreshInterval:100,  //隔间值
        	decimals:0,           //显示小位数
        	formatter: formatter, //渲染之前格式化
        	onUpdate:null,        //每次更新前的回调方法
        	onComplete:null       //完成更新的回调方法
        };
        function formatter(value, settings){
        	return value.toFixed(settings.decimals);
        }
        //自定义格式
        $('#count-number').data('countToOptions',{
        	formmatter:function(value, options){
        		return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
        	}
        });
        //定时器
        $('.timer').each(count);
        function count(options){
        	var $this=$(this);
        	options=$.extend({}, options||{}, $this.data('countToOptions')||{});
        	$this.countTo(options);
        }

	</script>


</body>
</html>