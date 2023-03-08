<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta name="description" content="" />
    <title>全部商品</title>
    <!-- Favicon -->


    <!--**********************************
        all css files
    *************************************-->

    <!--***************************************************
       fontawesome,bootstrap,plugins and main style css
     ***************************************************-->

    <!-- <link rel="stylesheet" href="assets/css/fontawesome.min.css" />
    <link rel="stylesheet" href="assets/css/ionicons.min.css" />
    <link rel="stylesheet" href="assets/css/simple-line-icons.css" />
    <link rel="stylesheet" href="assets/css/plugins/jquery-ui.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/plugins/plugins.css" />
    <link rel="stylesheet" href="assets/css/style.css" /> -->

    <!-- Use the minified version files listed below for better performance and remove the files listed above -->

    <!--****************************
         Minified  css
    ****************************-->

    <!--***********************************************
       vendor min css,plugins min css,style min css
     ***********************************************-->

    <link rel="stylesheet" href="assets/css/vendor/vendor.min.css" />
    <link rel="stylesheet" href="assets/css/plugins/plugins.min.css" />
    <link rel="stylesheet" href="assets/css/style.min.css" />

</head>

<body>
<jsp:useBean class="com.mapper.componentInfo" id="comInfo" scope="page"></jsp:useBean>
<jsp:useBean id="customer" class="com.mapper.findUserid"></jsp:useBean>
<div>
    <%--解析域名--%>
    <%
        String component_id= String.valueOf(request.getQueryString());
        String imga=comInfo.get_detail_image(component_id);
        String buy_path="buyProduct.jsp?"+component_id;
    %>
</div>
<%
        String ht_pn= String.valueOf(request.getQueryString());
        if (Objects.equals(ht_pn,"null")){
            ht_pn="1";
        }
        int pagenum= Integer.parseInt(ht_pn);
        int total_page=6;
        String ID= (String) request.getSession().getAttribute("uname");
%>
<!-- offcanvas-overlay start -->
<div class="offcanvas-overlay"></div>
<!-- offcanvas-overlay end -->

<!--  购物车的侧边栏-->
<div id="offcanvas-cart" class="offcanvas offcanvas-cart theme1">
    <div class="inner">
        <div class="head d-flex flex-wrap justify-content-between">
            <span class="title">购物车</span>
            <button class="offcanvas-close">×</button>
        </div>

        <!-- 这里放购物车单品的东西 -->
        <ul class="minicart-product-list">
            <li>
                <a href="single-product.jsp?1" class="image"><img src="images/cpu1.png" alt="Cart product Image"></a>
                <div class="content">
                    <a href="single-product.jsp?1" class="title"><%=comInfo.get_detail_name("1")%></a>
                    <span class="quantity-price">1 x <span class="amount"><%=comInfo.get_detail_price("1")%></span></span>
                    <a href="#" class="remove">×</a>
                </div>
            </li>
            <li>
                <a href="single-product.html" class="image"><img src="assets/img/product/i5-12400F.jpg" alt="Cart product Image"></a>
                <div class="content">
                    <a href="single-product.html" class="title">Intel 酷睿 i5-12400F</a>
                    <span class="quantity-price">1 x <span class="amount">￥1499</span></span>
                    <a href="#" class="remove">×</a>
                </div>
            </li>
        </ul>

        <a href="cart.jsp" class="btn theme--btn1 btn--lg text-uppercase  d-block d-sm-inline-block mr-sm-2">去购物车结算</a>
    </div>
</div>
<!-- OffCanvas Cart End -->

<!-- 设置的侧边栏 -->
<div id="offcanvas-setting" class="offcanvas offcanvas-cart theme1">
    <div class="inner" style="font-size: 30px">
        <div class="head d-flex justify-content-between">
            <span class="title">设置</span>
            <button class="offcanvas-close">×</button>
        </div>
        <div class="content_setting">
            <div class="info_setting">
                <h3 class="title_setting">账号与安全</h3>
                <ul>
                    <li>
                        <a href="myaccount.jsp">我的账号</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/cwy/logout">登出</a>
                    </li>
                    <li>
                        <a href="login.jsp">登录</a>
                    </li>

                </ul>
            </div>

            <div class="info_setting">
                <div class="title_setting">当前登录的账号为 :</div>
                <ul>
                    <li><a href="#"><%=customer.get_customer_name(ID)%></a></li>
                </ul>
            </div>

        </div>
    </div>
</div>
<!--offcanvas-setting End -->

<!-- 头部开始菜单栏 -->
<div id="sticky" class="header theme1 header-middle px-xl-4">
    <div class="container position-relative">
        <div class="row align-items-center">
            <div class="col-9 col-xl-7 position-xl-relative">
                <div class="d-flex align-items-center justify-content-lg-between">
                    <div class="logo mr-lg-5 mr-xl-0">
                        <a href="index.jsp"><span style="font-size: 25px">电脑零部件销售管理系统</span></a>
                    </div>
                    <nav class="header-bottom theme1 d-none d-lg-block">
                        <ul class="main-menu d-flex align-items-center">
                            <li class="active">
                                <a href="index.jsp" class="pl-0">首页 </a>
                                <ul class="sub-menu">
                                </ul>
                            </li>
                            <li class="position-static">
                                <a href="allProduct.jsp">全部商品 </a>
                            </li>
                            <li>
                                <a href="#">关于 <i class="ion-ios-arrow-down"></i></a>
                                <ul class="sub-menu">
                                    <li><a href="about-us.jsp">关于我们</a></li>
                                    <li><a href="cart.jsp">购物车</a></li>
                                    <li><a href="login.jsp">登录 &amp; 注册</a></li>
                                    <li><a href="myaccount.jsp">账号与安全</a></li>
                                </ul>
                            </li>
                            <li>
                                <!-- 小箭头靠这个弄出来<i class="ion-ios-arrow-down"></i> -->
                                <a href="news.jsp">公告</a>
                            </li>
                            <li><a href="contact.jsp">联系我们</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-3 col-xl-5">
                <!-- search-form end -->
                <div class="d-flex align-items-center justify-content-end">
                    <div class="cart-block-links theme1">
                        <ul class="d-flex align-items-center">
                            <li>
                                <a href="javascript:void(0)" class="search search-toggle">
                                    <i class="ion-ios-search-strong"></i>
                                </a>
                            </li>
                            <li class="position-relative d-none d-sm-block">
                                <a href="#">
                                    <i class="ion-ios-shuffle-strong"></i>
                                    <span class="badge cbdg1">3</span>
                                </a>
                            </li>
                            <li class="position-relative d-none d-sm-block">
                                <a class="offcanvas-toggle" href="#offcanvas-wishlist">
                                    <i class="ion-android-favorite-outline"></i>
                                    <span class="badge cbdg1">4</span>
                                </a>
                            </li>
                            <li class="cart-block position-relative d-none d-sm-block">
                                <a class="offcanvas-toggle" href="#offcanvas-cart">
                                    <i class="ion-bag"></i>
                                    <span class="badge cbdg1">5</span>
                                </a>
                            </li>
                            <li class="mr-0 cart-block">
                                <a class="offcanvas-toggle" href="#offcanvas-setting">
                                    <i class="ion-android-settings"></i>
                                </a>
                            </li>
                            <!-- cart block end -->
                        </ul>
                    </div>
                    <div class="mobile-menu-toggle theme1 d-lg-none">
                        <a href="#offcanvas-mobile-menu" class="offcanvas-toggle">
                            <svg viewbox="0 0 800 600">
                                <path d="M300,220 C300,220 520,220 540,220 C740,220 640,540 520,420 C440,340 300,200 300,200"
                                      id="top"></path>
                                <path d="M300,320 L540,320" id="middle"></path>
                                <path d="M300,210 C300,210 520,210 540,210 C740,210 640,530 520,410 C440,330 300,190 300,190"
                                      id="bottom" transform="translate(480, 320) scale(1, -1) translate(-480, -318)">
                                </path>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- header-middle end -->

<!-- breadcrumb-section start -->
<nav class="breadcrumb-section theme1 breadcrumb-bg1">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-title text-center my-20">
                    <h2 class="title text-dark text-capitalize"><%=comInfo.get_detail_type(component_id)%></h2>
                </div>
            </div>
            <div class="col-12">
                <ol
                        class="breadcrumb bg-transparent m-0 p-0 align-items-center justify-content-center"
                >
                    <li class="breadcrumb-item"><a href="index.jsp">首页</a></li>
                    <li class="breadcrumb-item">
                        <a href="shop-grid-4-column.html">分类</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                        <%=comInfo.get_detail_type(component_id)%>
                    </li>
                </ol>
            </div>
        </div>
    </div>
</nav>
<!-- breadcrumb-section end -->

<!-- product-single start -->
<section class="product-single theme1">
    <div class="container grid-wraper">
        <div class="row">
            <div class="col-md-9 mx-auto col-lg-6 mb-5 mb-lg-0">
                <div class="position-relative">
                    <span class="badge badge-danger top-left">New</span>
                </div>

                <div class="product-sync-init mb-30">
                    <div class="single-product">
                        <div class="product-thumb">
                            <img src=<%=imga%> alt="product-thumb">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mt-5 mt-md-0">
                <div class="single-product-info">
                    <div class="single-product-head">
                        <h2 class="title mb-20"><%=comInfo.get_detail_name(component_id)%></h2>
                        <div class="star-content mb-20">
                            <span class="star-on"><i class="ion-ios-star"></i> </span>
                            <span class="star-on"><i class="ion-ios-star"></i> </span>
                            <span class="star-on"><i class="ion-ios-star"></i> </span>
                            <span class="star-on"><i class="ion-ios-star"></i> </span>
                            <span class="star-on"><i class="ion-ios-star"></i> </span>
                            <a href="#" id="write-comment"
                            ><span class="ml-2"><i class="far fa-comment-dots"></i></span>
                                评论 <span>(1)</span></a>
                            <a href="#" data-toggle="modal" data-target="#exampleModalCenter"><span class="edite"><i class="far fa-edit"></i></span> 写一个评论</a>
                        </div>
                    </div>
                    <div class="product-body mb-40">
                        <div class="d-flex align-items-center mb-30 border-bottom pb-30">
                            <h6 class="product-price mr-20">
                                <span class="onsale"><%=comInfo.get_detail_price(component_id)%></span>
                            </h6>
                        </div>
                        <p class="font-size">
                            <%=comInfo.get_detail_intro(component_id)%>
                    </div>
                    <div class="product-footer">
                        <div class="product-count style d-flex flex-column flex-sm-row mt-30 mb-30">
                                <form action=<%=buy_path%> method="post">
                                    <div class="count d-flex">
                                        <input type="number" min="1" max="10" step="1" value="1" name="compu_num" id="compu_num" />
                                        <div class="button-group">
                                            <button class="count-btn increment">
                                                <i class="fas fa-chevron-up"></i>
                                            </button>
                                            <button class="count-btn decrement">
                                                <i class="fas fa-chevron-down"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div>
                                        <a href="buyProduct.jsp">
                                            <button class="btn theme-btn--dark3 btn--xl mt-30 mt-sm-0">
                                            <span class="mr-2"><i class="ion-bag"></i></span>
                                            立即下单
                                            </button>
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="addto-whish-list">
                            <a href="#"><i class="icon-shuffle"></i> 比较价格</a>
                        </div>
                        <div class="pro-social-links mt-30">
                        </div>
                    </div>
                    <div class="block-reassurance">
                        <ul>
                            <li>
                                <img src="assets/img/icon/10.png" alt="img"/>
                                安全保证
                            </li>
                            <li>
                                <img src="assets/img/icon/11.png" alt="img"/>
                                7天内送达
                            </li>
                            <li>
                                <img src="assets/img/icon/12.png" alt="img"/>
                                7天无理由退换货
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- product-single end -->
<!-- product tab start -->
<div class="product-tab theme1 bg-white pt-70 pb-70">
    <div class="container">
        <div class="product-tab-nav">
            <div class="row align-items-center">
                <div class="col-12">
                    <nav class="product-tab-menu single-product">
                        <ul
                                class="nav nav-pills justify-content-center"
                                id="pills-tab"
                                role="tablist"
                        >
                            <li class="nav-item">
                                <a
                                        class="nav-link active"
                                        id="pills-home-tab"
                                        data-toggle="pill"
                                        href="#pills-home"
                                        role="tab"
                                        aria-controls="pills-home"
                                        aria-selected="true"
                                >详细介绍</a>
                            </li>
                            <li class="nav-item">
                                <a
                                        class="nav-link"
                                        id="pills-profile-tab"
                                        data-toggle="pill"
                                        href="#pills-profile"
                                        role="tab"
                                        aria-controls="pills-profile"
                                        aria-selected="false"
                                >产品细节</a>
                            </li>
                            <li class="nav-item">
                                <a
                                        class="nav-link"
                                        id="pills-contact-tab"
                                        data-toggle="pill"
                                        href="#pills-contact"
                                        role="tab"
                                        aria-controls="pills-contact"
                                        aria-selected="false"
                                >评论</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- product-tab-nav end -->
        <div class="row">
            <div class="col-12">
                <div class="tab-content" id="pills-tabContent">
                    <!-- first tab-pane -->
                    <div
                            class="tab-pane fade show active"
                            id="pills-home"
                            role="tabpanel"
                            aria-labelledby="pills-home-tab"
                    >
                        <div class="single-product-desc">
                            <ul>
                                <li>
                                    <%=comInfo.get_detail_lintro(component_id)%>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- second tab-pane -->
                    <div
                            class="tab-pane fade"
                            id="pills-profile"
                            role="tabpanel"
                            aria-labelledby="pills-profile-tab"
                    >
                        <div class="single-product-desc">
                            <div class="studio-thumb">
<%--                                <a href="#"><img class="mb-30"--%>
<%--                                        src="assets/img/stodio.jpg"--%>
<%--                                        alt="studio-thumb"/></a>--%>
                                <h6 class="mb-2">参考参数 <small></small></h6>
                                <h6>库存<small>30</small></h6>
                                <h3>数据列表</h3>
                            </div>
                            <div class="product-features">
                                <ul>
                                    <li><span>核心/线程</span></li>
                                    <li><span>核心类型</span></li>
                                    <li><span>生产工艺</span></li>
                                    <li><span>接口类型</span></li>
                                    <li><span>频率</span></li>
                                    <li><span>三级缓存</span></li>
                                    <li><span>兼容主板</span></li>
                                    <li><span>上市时间</span></li>
                                    <li><span>HT总线</span></li>
<%--                                    <li><span>40x60cm</span></li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- third tab-pane -->
                    <div
                            class="tab-pane fade"
                            id="pills-contact"
                            role="tabpanel"
                            aria-labelledby="pills-contact-tab"
                    >
                        <div class="single-product-desc">
                            <div class="grade-content">
                                <span class="grade">星级 </span>
                                <span class="star-on"><i class="ion-ios-star"></i> </span>
                                <span class="star-on"><i class="ion-ios-star"></i> </span>
                                <span class="star-on"><i class="ion-ios-star"></i> </span>
                                <span class="star-on"><i class="ion-ios-star"></i> </span>
                                <span class="star-on"><i class="ion-ios-star"></i> </span>
                                <h6 class="sub-title">评论时间</h6>
                                <p>2022/4/12</p>
                                <h4 class="title">匿名用户</h4>
                                <p>性价比极高！</p>
                                <a
                                        href="#"
                                        class="btn theme-btn--dark3 theme-btn--dark3-sm btn--sm rounded-5 mt-15"
                                        data-toggle="modal"
                                        data-target="#exampleModalCenter"
                                >去写评论</a
                                >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- product tab end -->
<!-- new arrival section start -->
<%--<section class="theme1 bg-white pb-70">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-12">--%>
<%--                <div class="section-title text-center mb-30">--%>
<%--                    <h2 class="title text-dark text-capitalize">You might also like</h2>--%>
<%--                    <p class="text mt-10">Add Related products to weekly line up</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-12">--%>
<%--                <div class="product-slider-init slick-nav">--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-danger top-left">new</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/5.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-android-star-half"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">New--%>
<%--                                                Balance Fresh Foam Kaymin</a></h3>--%>
<%--                                            <h6 class="product-price">--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-success top-left">-20%</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/1.jpg" alt="thumbnail">--%>
<%--                                            <img class="second-img" src="assets/img/product/1.1.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">Juicy--%>
<%--                                                Couture--%>
<%--                                                Juicy Quilted Terry Track Jacket</a></h3>--%>
<%--                                            <h6 class="product-price"><del class="del">$23.90</del>--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-danger top-left">new</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/6.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-android-star-half de-selected"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">Trans-Weight--%>
<%--                                                Hooded Wind and--%>
<%--                                                Water Resistant Shell</a></h3>--%>
<%--                                            <h6 class="product-price">--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-success top-left">-20%</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/2.jpg" alt="thumbnail">--%>
<%--                                            <img class="second-img" src="assets/img/product/2.1.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">Originals--%>
<%--                                                Kaval Windbreaker Winter Jacket</a></h3>--%>
<%--                                            <h6 class="product-price"><del class="del">$23.90</del>--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-danger top-left">new</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/4.jpg" alt="thumbnail">--%>
<%--                                            <img class="second-img" src="assets/img/product/4.1.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-android-star-half"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">New--%>
<%--                                                Balance Fresh Foam Kaymin</a></h3>--%>
<%--                                            <h6 class="product-price">--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-danger top-left">new</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/6.jpg" alt="thumbnail">--%>
<%--                                            <img class="second-img" src="assets/img/product/8.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-android-star-half"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">New--%>
<%--                                                Balance Fresh Foam Kaymin</a></h3>--%>
<%--                                            <h6 class="product-price">--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- new arrival section end -->
<!-- new arrival section start -->
<%--<section class="theme1 bg-white pb-70">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-12">--%>
<%--                <div class="section-title text-center mb-30">--%>
<%--                    <h2 class="title text-dark text-capitalize">12 other products in the same category</h2>--%>
<%--                    <p class="text mt-10">other products in the same category:</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-12">--%>
<%--                <div class="product-slider-init slick-nav">--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-danger top-left">new</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/6.jpg" alt="thumbnail">--%>
<%--                                            <img class="second-img" src="assets/img/product/8.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                            <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                  title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                            <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                  title="Add to compare"--%>
<%--                                                  class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                            <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                  title="add to wishlist"--%>
<%--                                                  class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-android-star-half"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">New--%>
<%--                                                Balance Fresh Foam Kaymin</a></h3>--%>
<%--                                            <h6 class="product-price">--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-danger top-left">new</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/5.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-android-star-half"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">New--%>
<%--                                                Balance Fresh Foam Kaymin</a></h3>--%>
<%--                                            <h6 class="product-price">--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-danger top-left">new</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/5.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-android-star-half"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">New--%>
<%--                                                Balance Fresh Foam Kaymin</a></h3>--%>
<%--                                            <h6 class="product-price">--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-success top-left">-20%</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/1.jpg" alt="thumbnail">--%>
<%--                                            <img class="second-img" src="assets/img/product/1.1.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">Juicy--%>
<%--                                                Couture--%>
<%--                                                Juicy Quilted Terry Track Jacket</a></h3>--%>
<%--                                            <h6 class="product-price"><del class="del">$23.90</del>--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-danger top-left">new</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/6.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-android-star-half de-selected"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">Trans-Weight--%>
<%--                                                Hooded Wind and--%>
<%--                                                Water Resistant Shell</a></h3>--%>
<%--                                            <h6 class="product-price">--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-success top-left">-20%</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/2.jpg" alt="thumbnail">--%>
<%--                                            <img class="second-img" src="assets/img/product/2.1.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">Originals--%>
<%--                                                Kaval Windbreaker Winter Jacket</a></h3>--%>
<%--                                            <h6 class="product-price"><del class="del">$23.90</del>--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                    <div class="slider-item">--%>
<%--                        <div class="card product-card">--%>
<%--                            <div class="card-body p-0">--%>
<%--                                <div class="media flex-column">--%>
<%--                                    <div class="product-thumbnail w-100 position-relative">--%>
<%--                                        <span class="badge badge-danger top-left">new</span>--%>
<%--                                        <a class="d-block" href="single-product.html">--%>
<%--                                            <img class="first-img" src="assets/img/product/4.jpg" alt="thumbnail">--%>
<%--                                            <img class="second-img" src="assets/img/product/4.1.jpg" alt="thumbnail">--%>
<%--                                        </a>--%>
<%--                                        <!-- product links -->--%>

<%--                                        <div class="product-links d-flex d-flex justify-content-between">--%>
<%--                                            <button class="pro-btn" data-toggle="modal" data-target="#add-to-cart">Add--%>
<%--                                                to cart</button>--%>
<%--                                            <ul class="d-flex justify-content-center">--%>
<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#quick-view">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Quick view" class="ion-ios-search-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>

<%--                                                <li>--%>
<%--                                                    <a href="#" data-toggle="modal" data-target="#compare">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="Add to compare"--%>
<%--                                                    class="ion-ios-shuffle-strong"></span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                                <li>--%>
<%--                                                    <a href="wishlist.html">--%>
<%--                                              <span data-toggle="tooltip" data-placement="bottom"--%>
<%--                                                    title="add to wishlist"--%>
<%--                                                    class="ion-android-favorite-outline"> </span>--%>
<%--                                                    </a>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                            <!-- product links end-->--%>
<%--                                        </div>--%>

<%--                                    </div>--%>
<%--                                    <div class="media-body">--%>
<%--                                        <div class="product-desc">--%>
<%--                                            <div class="star-rating">--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-ios-star"></span>--%>
<%--                                                <span class="ion-android-star-half"></span>--%>
<%--                                            </div>--%>
<%--                                            <h3 class="title my-10"><a href="shop-grid-4-column.html">New--%>
<%--                                                Balance Fresh Foam Kaymin</a></h3>--%>
<%--                                            <h6 class="product-price">--%>
<%--                                                <span class="onsale">$21.51</span></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- slider-item end -->--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- new arrival section end -->

<!-- 最下面的骚扰人邮箱地址，不准备实现news-letter start -->
<section class="news-letter-section theme1 bg-white">
    <div class="container">
        <div class="news-letter-wrapper pt-65 pb-65">
            <div class="row">
                <div class="col-12">
                    <div class="form-title mb-30 text-center">
                        <p class="text mb-10">不想错过最新消息？</p>
                        <h4 class="title text text-capitalize">
                            订阅我们的频道吧！
                        </h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <form class="news-letter-form position-relative"
                          action="
                              http://devitems.us11.list-manage.com/subscribe/post?u=6bbb9b6f5827bd842d9640c82&amp;id=05d85f18ef" target="_blank" method="post">
                        <input class="form-control" type="text" placeholder="Your email address" />
                        <button class="btn news-letter-btn text-uppercase" type="submit">
                            订阅
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- news-letter end -->

<!-- 底部栏修改 -->
<footer class="bg-lighten2 theme1 position-relative">
    <!-- footer bottom start -->
    <div class="footer-bottom pt-70 pb-30">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-6 col-lg-6 mb-30">
                    <div class="footer-widget">
                        <div class="footer-logo mb-30">
                            <a href="index.html">
                                <img src="assets/img/logo/logo-dark.jpg" alt="footer logo">
                            </a>
                        </div>
                        <p class="text mb-35">专注销售高质量零部件，装机猿的不二之选</p>
                        <div class="social-network">
                            <h2 class="title text mb-20 text-capitalize">在社交媒体上关注我们：</h2>
                            <ul class="d-flex">
                                <li><a href="https://www.facebook.com/" target="_blank"><span class="ion-social-facebook"></span></a>
                                </li>
                                <li><a href="https://twitter.com/" target="_blank"><span class="ion-social-twitter"></span></a></li>
                                <li><a href="https://www.youtube.com/" target="_blank"><span
                                        class="ion-social-youtube-outline"></span></a></li>
                                <li><a href="https://www.youtube.com/" target="_blank"><span class="ion-social-googleplus"></span></a>
                                </li>
                                <li class="mr-0"><a href="https://www.instagram.com/" target="_blank"><span
                                        class="ion-social-instagram-outline"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-2 mb-30">
                    <div class="footer-widget">
                        <div class="section-title mb-20">
                            <h2 class="title text-dark text-capitalize">工作时间</h2>
                        </div>
                        <address class="mb-0">
                            <span>周一到周日</span>
                            <span>时间: 9AM-6PM</span>
                            <span>节假日在线</span>
                            <span></span>
                        </address>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-2 mb-30">
                    <div class="footer-widget">
                        <div class="section-title mb-20">
                            <h2 class="title text-dark text-capitalize">更多信息</h2>
                        </div>
                        <!-- footer-menu start -->
                        <ul class="footer-menu">
                            <!-- <li><a href="#">Delivery</a></li> -->
                            <li><a href="about-us.html">关于我们</a></li>
                            <!-- <li><a href="#">Secure payment</a></li> -->
                            <li><a href="contact.html">联系我们</a></li>
                            <li><a href="#">门店地址</a></li>
                            <!-- <li><a href="#">Stores</a></li> -->
                        </ul>
                        <!-- footer-menu end -->
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-2 mb-30">
                    <div class="footer-widget">
                        <div class="section-title mb-20">
                            <h2 class="title text-dark text-capitalize">新闻</h2>
                        </div>
                        <!-- footer-menu start -->
                        <ul class="footer-menu">
                            <!-- <li><a href="#">Legal Notice</a></li> -->
                            <li><a href="#">优惠信息</a></li>

                            <li><a href="#">新产品上线</a></li>

                            <!-- <li><a href="#">Best sales</a></li> -->

                            <!-- <li><a href="login.html">Login</a></li>

                                      <li><a href="myaccount.html">My account</a></li> -->
                        </ul>
                        <!-- footer-menu end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- footer bottom end -->
    <!-- coppy-right start -->
    <div class="coppy-right">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="border-top py-20">
                        <div class="row">
                            <div class="col-12 col-md-5 col-lg-4 col-xl-3 order-last order-md-first">
                                <div class="text-center text-lg-left">
                                    <p class="mb-3 mb-md-0">Copyright &copy; . All
                                        Rights Reserved</p>
                                </div>
                            </div>
                            <div class="col-12 col-md-7 col-lg-8 col-xl-9">
                                <ul class="footer-menu copyright-menu d-flex flex-wrap justify-content-center justify-content-md-end">
                                    <!-- <li><a href="#">Legal Notice</a></li>
                                                  <li><a href="#">Prices drop</a></li>

                                                  <li><a href="#">New products</a></li>

                                                  <li><a href="#">Best sales</a></li>

                                                  <li><a href="login.html">Login</a></li>

                                                  <li><a href="myaccount.html">My account</a></li> -->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- coppy-right end -->
</footer>
<!-- footer end -->

<!-- search-box and overlay start -->
<div class="overlay">
    <div class="scale"></div>
    <form class="search-box" action="#">
        <input type="text" name="search" placeholder="Search products..." />
        <button id="close" type="submit">
            <i class="ion-ios-search-strong"></i>
        </button>
    </form>
    <button class="close"><i class="ion-android-close"></i></button>
</div>
<!-- search-box and overlay end -->

<!-- modals start -->

<!-- first modal -->
<div
        class="modal fade theme1 style1"
        id="quick-view"
        tabindex="-1"
        role="dialog"
>
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6 col-lg-6 mb-5 mb-lg-0">
                        <div class="product-sync-init mb-20">
                            <div class="single-product">
                                <div class="product-thumb">
                                    <img
                                            src="assets/img/slider/thumb/1.jpg"
                                            alt="product-thumb"
                                    />
                                </div>
                            </div>
                            <!-- single-product end -->
                            <div class="single-product">
                                <div class="product-thumb">
                                    <img
                                            src="assets/img/slider/thumb/2.jpg"
                                            alt="product-thumb"
                                    />
                                </div>
                            </div>
                            <!-- single-product end -->
                            <div class="single-product">
                                <div class="product-thumb">
                                    <img
                                            src="assets/img/slider/thumb/3.jpg"
                                            alt="product-thumb"
                                    />
                                </div>
                            </div>
                            <!-- single-product end -->
                            <div class="single-product">
                                <div class="product-thumb">
                                    <img
                                            src="assets/img/slider/thumb/4.jpg"
                                            alt="product-thumb"
                                    />
                                </div>
                            </div>
                            <!-- single-product end -->
                        </div>

                        <div class="product-sync-nav slick-nav-sync">
                            <div class="single-product">
                                <div class="product-thumb">
                                    <a href="javascript:void(0)">
                                        <img
                                                src="assets/img/slider/thumb/1.1.jpg"
                                                alt="product-thumb"
                                        /></a>
                                </div>
                            </div>
                            <!-- single-product end -->
                            <div class="single-product">
                                <div class="product-thumb">
                                    <a href="javascript:void(0)">
                                        <img
                                                src="assets/img/slider/thumb/2.1.jpg"
                                                alt="product-thumb"
                                        /></a>
                                </div>
                            </div>
                            <!-- single-product end -->
                            <div class="single-product">
                                <div class="product-thumb">
                                    <a href="javascript:void(0)"
                                    ><img
                                            src="assets/img/slider/thumb/3.1.jpg"
                                            alt="product-thumb"
                                    /></a>
                                </div>
                            </div>
                            <!-- single-product end -->
                            <div class="single-product">
                                <div class="product-thumb">
                                    <a href="javascript:void(0)"
                                    ><img
                                            src="assets/img/slider/thumb/4.1.jpg"
                                            alt="product-thumb"
                                    /></a>
                                </div>
                            </div>
                            <!-- single-product end -->
                            <div class="single-product">
                                <div class="product-thumb">
                                    <a href="javascript:void(0)"
                                    ><img
                                            src="assets/img/slider/thumb/2.1.jpg"
                                            alt="product-thumb"
                                    /></a>
                                </div>
                            </div>
                            <!-- single-product end -->
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6 mt-5 mt-md-0">
                        <div class="modal-product-info">
                            <div class="product-head">
                                <h2 class="title">Brixton Patrol All Terrain Anorak Jacket</h2>
                                <h4 class="sub-title">Reference: demo_5</h4>
                                <div class="star-content mb-20">
                                    <span class="star-on"><i class="ion-ios-star"></i> </span>
                                    <span class="star-on"><i class="ion-ios-star"></i> </span>
                                    <span class="star-on"><i class="ion-ios-star"></i> </span>
                                    <span class="star-on"><i class="ion-ios-star"></i> </span>
                                    <span class="star-on de-selected"
                                    ><i class="ion-ios-star"></i>
                  </span>
                                </div>
                            </div>
                            <div class="product-body">
                <span class="product-price text-center">
                  <span class="new-price">$29.00</span>
                </span>
                                <p class="border-top pt-30">
                                    Whether you're exploring the woods or the city, the Brixton™
                                    Patrol All
                                </p>
                                <ul>
                                    <li>Terrain Anorak Jacket has got you covered.</li>
                                    <li>
                                        Camo jacket crafted from 4.5 oz nylon ripstop with two-way
                                        stretch, and a water-repellent coating.
                                    </li>
                                    <li>Drawstring hood.</li>
                                </ul>
                            </div>
                            <div class="product-size d-flex align-items-center mt-30">
                                <h3 class="title">Dimension</h3>
                                <select>
                                    <option value="0">S</option>
                                    <option value="1">M</option>
                                    <option value="2">L</option>
                                    <option value="3">XL</option>
                                </select>
                            </div>
                            <div class="product-footer">
                                <div
                                        class="product-count style d-flex flex-column flex-sm-row my-4"
                                >
                                    <div class="count d-flex">
                                        <input type="number" min="1" max="10" step="1" value="1" />
                                        <div class="button-group">
                                            <button class="count-btn increment">
                                                <i class="fas fa-chevron-up"></i>
                                            </button>
                                            <button class="count-btn decrement">
                                                <i class="fas fa-chevron-down"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div>
                                        <button class="btn theme-btn--dark3 btn--xl mt-30 mt-sm-0">
                                            <span class="mr-2"><i class="ion-bag"></i></span>
                                            Add to cart
                                        </button>
                                    </div>
                                </div>
                                <div class="addto-whish-list">
                                    <a href="#"><i class="icon-heart"></i> Add to wishlist</a>
                                    <a href="#"><i class="icon-shuffle"></i> Add to compare</a>
                                </div>
                                <div class="pro-social-links mt-10">
                                    <ul class="d-flex align-items-center">
                                        <li class="share">Share</li>
                                        <li>
                                            <a href="#"><i class="ion-social-facebook"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="ion-social-twitter"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="ion-social-google"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="ion-social-pinterest"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- second modal -->
<div class="modal fade style2" id="compare" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h5 class="title">
                    <i class="fa fa-check"></i> Product added to compare.
                </h5>
            </div>
        </div>
    </div>
</div>
<!-- second modal -->
<div class="modal fade style3" id="add-to-cart" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header justify-content-center bg-dark">
                <h5 class="modal-title" id="add-to-cartCenterTitle">
                    <span class="ion-checkmark-round"></span> Product successfully added
                    to your shopping cart
                </h5>
                <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-5 divide-right">
                        <div class="row">
                            <div class="col-md-6">
                                <img src="assets/img/modal/1.jpg" alt="img" />
                            </div>
                            <div class="col-md-6 mb-2 mb-md-0">
                                <h4 class="product-name">
                                    New Balance Running Arishi trainers in triple
                                </h4>
                                <h5 class="price">$$29.00</h5>
                                <h6 class="color">
                                    <strong>Dimension: </strong>: <span class="dmc">40x60cm</span>
                                </h6>
                                <h6 class="quantity"><strong>Quantity:</strong>&nbsp;1</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="modal-cart-content">
                            <p class="cart-products-count">There is 1 item in your cart.</p>
                            <p><strong>Total products:</strong>&nbsp;$123.72</p>
                            <p><strong>Total shipping:</strong>&nbsp;$7.00</p>
                            <p><strong>Taxes</strong>&nbsp;$0.00</p>
                            <p><strong>Total:</strong>&nbsp;$130.72 (tax excl.)</p>
                            <div class="cart-content-btn">
                                <button
                                        type="button"
                                        class="btn theme-btn--dark1 btn--md mt-4"
                                        data-dismiss="modal"
                                >
                                    Continue shopping
                                </button>
                                <button class="btn theme-btn--dark1 btn--md mt-4">
                                    <i class="ion-checkmark-round"></i>Proceed to checkout
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- modals end -->



<!--***********************
    all js files
 ***********************-->

<!--******************************************************
    jquery,modernizr ,poppe,bootstrap,plugins and main js
 ******************************************************-->

<!-- <script src="assets/js/vendor/jquery-3.5.1.min.js"></script>
<script src="assets/js/vendor/modernizr-3.7.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/plugins/jquery-ui.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/plugins/plugins.js"></script>
<script src="assets/js/main.js"></script> -->

<!-- Use the minified version files listed below for better performance and remove the files listed above -->

<!--***************************
      Minified  js
 ***************************-->

<!--***********************************
     vendor,plugins and main js
  ***********************************-->

<script src="assets/js/vendor/vendor.min.js"></script>
<script src="assets/js/plugins/plugins.min.js"></script>
<script src="assets/js/main.js"></script>


</body>

</html>

