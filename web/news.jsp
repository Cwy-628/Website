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
    <title>公告</title>
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
<jsp:useBean class="com.mapper.componentInfo" id="component" scope="page"></jsp:useBean>
<jsp:useBean id="customer" class="com.mapper.findUserid"></jsp:useBean>
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
                    <a href="single-product.jsp?1" class="title"><%=component.get_detail_name("1")%></a>
                    <span class="quantity-price">1 x <span class="amount"><%=component.get_detail_price("1")%></span></span>
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
                                <a href="news.jsp">公告 </a>
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

<!-- breadcrumb-section start 中间小字条小跳转链接-->
<nav class="breadcrumb-section theme1 breadcrumb-bg1">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-title text-center my-20">
                    <h2 class="title text-dark text-capitalize">公告</h2>
                </div>
            </div>
            <div class="col-12">
                <ol class="breadcrumb bg-transparent m-0 p-0 align-items-center justify-content-center">
                    <li class="breadcrumb-item"><a href="index.html">主页</a></li>
                    <li class="breadcrumb-item active" aria-current="page">
                        公告
                    </li>
                </ol>
            </div>
        </div>
    </div>
</nav>
<!-- breadcrumb-section end -->



<div id="app">
<!-- product tab start -->
<section class="whish-list-section theme1 pb-70">
    <div class="container grid-wraper">
        <div class="row">
            <div class="col-12">
                <h3 class="title pb-25 text-center text-md-left text-capitalize">近期发布</h3>
                <div class="table-responsive">
                    <table class="table mb-0">
                        <thead class="thead-light">
                        <tr>
                            <!-- 价格什么的乱七八糟的小导航栏 -->
                            <th class="text-center" scope="col"></th>
                            <th class="text-center" scope="col"></th>
                            <th class="text-center" scope="col"></th>
                            <th class="text-center" scope="col"></th>
                            <th class="text-center" scope="col"></th>
                            <th class="text-center" scope="col"></th>
                            <th class="text-center" scope="col"></th>
                        </tr>
                        </thead>
                        <template>
                            <el-table
                                    :data="tableData"
                                    stripe
                                    style="width: 100%">
                                <el-table-column
                                        prop="news_id"
                                        label="公告编号"
                                        width="200"
                                        align="center">
                                </el-table-column>
                                <el-table-column
                                        prop="news_content"
                                        label="内容"
                                        width="600"
                                        align="center">
                                </el-table-column>
                                <el-table-column
                                        prop="news_ptime"
                                        label="发布时间"
                                        width="200"
                                        align="center">
                                </el-table-column>
                                <el-table-column
                                        prop="controller_id"
                                        label="发布者"
                                        width="200"
                                        align="center">
                                </el-table-column>
                            </el-table>
                        </template>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- product tab end -->
</div>
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
<script src="assets/js/vue.js"></script>
<script src="element-ui/lib/index.js"></script>
<link rel="stylesheet" href="element-ui/lib/theme-chalk/index.css">
<script src="assets/js/axios-0.18.0.js"></script>


</body>
<script>
    new Vue({
        el: "#app",

        mounted(){
            //当页面加载完成后，发送异步请求,获取数据
            this.selectAll();
        },
        methods: {
            selectAll(){
                var _this = this;
                axios({
                    method:"get",
                    url:"http://localhost:8080/cwy/news/selectAll"
                }).then(function (resp){
                    _this.tableData = resp.data;
                })
            }
        },
        data() {
            return {
                //总页数
                totalCount: 100,
                //每页显示5条
                pageSize: 5,
                // 当前页码
                currentPage: 1,

                // 商品模型数据
                news: {
                    news_id: '',
                    news_content: '',
                    news_ptime: '',
                    controller_id:''
                },

                //被选中的id数组
                selectedIds:[],
                // 复选框选中数据集合
                multipleSelection: [],
                // 表格数据
                tableData: [{
                    news_id: '华为',
                    news_content: '华为科技有限公司',
                    news_ptime: '100',
                    controller_id: "1",
                }, {
                    news_id: '华为',
                    news_content: '华为科技有限公司',
                    news_ptime: '100',
                    controller_id: "1",
                }]

            }
        }
    })

</script>
</html>


