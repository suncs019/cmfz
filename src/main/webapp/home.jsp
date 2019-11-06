<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="app" value="${pageContext.request.contextPath}"></c:set>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--当前页面更好支持移动端-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <%--引入bootstrap的样式--%>
    <link rel="stylesheet" href="statics/boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="statics/jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
    <script src="statics/boot/js/jquery-3.3.1.min.js"></script>
    <script src="statics/boot/js/bootstrap.min.js"></script>

    <%--引入jqgrid--%>
    <script src="statics/jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
    <script src="statics/jqgrid/js/trirand/jquery.jqGrid.min.js"></script>


    <%----%>
    <script src="statics/jqgrid/js/ajaxfileupload.js"></script>

    <script charset="utf-8" src="kindeditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
</head>
<body>
<!--导航条-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!--导航标题-->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">持明法洲后台管理系统 <small>v2.0</small></a>
        </div>

        <!--导航条内容-->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">欢迎:<font color="red">${sessionScope.loginAdmin.nickname}</font></a></li>
                <li><a href="${pageContext.request.contextPath}/admin/out">退出登录 <span class="glyphicon glyphicon-log-out"></span> </a></li>
            </ul>
        </div>
    </div>
</nav>
<!--页面主体内容-->
<div class="container-fluid">
    <!--row-->
    <div class="row">

        <!--菜单-->
        <div class="col-sm-2">

            <!--手风琴控件-->
            <div class="panel-group" id="accordion" >

                <!--面板-->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="bannerPanel">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#bannerLists" aria-expanded="true" aria-controls="collapseOne">
                                轮播图管理
                            </a>
                        </h4>
                    </div>
                    <div id="bannerLists" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <ul class="list-group">
                                <li class="list-group-item"><a href="javascript:$('#centerLayout').load('${app}/banner/banner.jsp');" id="btn">所有轮播图</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!--类别面板-->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="albumPanel">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#albumLists" aria-expanded="true" aria-controls="collapseOne">
                                专辑管理
                            </a>
                        </h4>
                    </div>
                    <div id="albumLists" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <ul class="list-group">
                                <li class="list-group-item"><a href="javascript:$('#centerLayout').load('${app}/album/album.jsp');">专辑列表</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!--面板-->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="articlePanel">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#articleLists" aria-expanded="true" aria-controls="collapseOne">
                                文章管理
                            </a>
                        </h4>
                    </div>
                    <div id="articleLists" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <ul class="list-group">
                                <li class="list-group-item"><a href="javascript:$('#centerLayout').load('${app}/article/article.jsp');">所有文章</a></li>
                            </ul>
                        </div>
                    </div>
                </div>


                <!--面板-->
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="userPanel">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#userLists" aria-expanded="true" aria-controls="collapseOne">
                                用户管理
                            </a>
                        </h4>
                    </div>
                    <div id="userLists" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <ul class="list-group">
                                <li class="list-group-item"><a href="javascript:$('#centerLayout').load('${app}/user/user.jsp');">所有用户</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!--面板-->
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="starPanel">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#startLists" aria-expanded="true" aria-controls="collapseOne">
                            明星管理
                        </a>
                    </h4>
                </div>
                <div id="startLists" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="javascript:$('#centerLayout').load('${app}/star/star.jsp');">明星列表</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        </div>
        <!--中心布局-->
        <div class="col-sm-10" id="centerLayout">

            <!--巨幕-->
            <div class="jumbotron">
                <h1>Hello,歪果仁，我们已国际化!</h1>
                <p>欢迎来到持明法洲后台管理系统</p>
            </div>

            <!--轮播图-->
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active"  align="center">
                        <img src="${pageContext.request.contextPath}/image/2.png" alt="...">
                        <div class="carousel-caption">
                            ...
                        </div>
                    </div>
                    <div class="item" align="center">
                        <img src="${pageContext.request.contextPath}/image/4.png" alt="...">
                        <div class="carousel-caption">
                            ...
                        </div>
                    </div>
                    ...
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

                </div>

            </div>

    <div class="panel panel-default">
        <div class="panel-body">
          <center>持明法洲后台管理系统然后就这样吧@bilibili</center>
        </div>
    </div>


        </div>
    </div>
</div>
</body>
</html>