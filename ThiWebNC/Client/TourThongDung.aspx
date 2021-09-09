<%@ Page Title="" Language="C#" MasterPageFile="~/Client/SiteClient.Master" AutoEventWireup="true" CodeBehind="TourThongDung.aspx.cs" Inherits="ThiWebNC.Client.TourThongDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="page-cover" id="cover-tour-grid-list">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-title">Việt Nam - vẻ đẹp bất tận</h1>
                    <ul class="breadcrumb">
                    </ul>
                </div>
                <!-- end columns -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end page-cover -->


    <!--===== INNERPAGE-WRAPPER ====-->
    <section class="innerpage-wrapper">
        <div id="tour-listing" class="innerpage-section-padding">
            <div class="container">
                <div class="row">

                    <div class="col-xs-12 col-sm-12 col-md-3 side-bar left-side-bar">

                        <div class="side-bar-block filter-block">
                            <h3 style="padding-left: 50px;">BỘ LỌC</h3>
                            <%-- <p>Find your dream flights today</p>--%>

                            <div class="panels-group">

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a href="#panel-1" data-toggle="collapse">Địa điểm <span><i class="fa fa-angle-down"></i></span></a>
                                    </div>
                                    <!-- end panel-heading -->

                                    <div id="panel-1" class="panel-collapse collapse">
                                        <div class="panel-body text-left">
                                            <ul class="list-unstyled">
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check01" name="checkbox" />
                                                    <label for="check01"><span><i class="fa fa-check"></i></span>All</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check02" name="checkbox" />
                                                    <label for="check02"><span><i class="fa fa-check"></i></span>Australia</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check03" name="checkbox" />
                                                    <label for="check03"><span><i class="fa fa-check"></i></span>Bangkok</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check04" name="checkbox" />
                                                    <label for="check04"><span><i class="fa fa-check"></i></span>China</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check05" name="checkbox" />
                                                    <label for="check05"><span><i class="fa fa-check"></i></span>India</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check06" name="checkbox" />
                                                    <label for="check06"><span><i class="fa fa-check"></i></span>Italy</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check07" name="checkbox" />
                                                    <label for="check07"><span><i class="fa fa-check"></i></span>London</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check08" name="checkbox" />
                                                    <label for="check08"><span><i class="fa fa-check"></i></span>Newzeland</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check09" name="checkbox" />
                                                    <label for="check09"><span><i class="fa fa-check"></i></span>Shanghai</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check10" name="checkbox" />
                                                    <label for="check10"><span><i class="fa fa-check"></i></span>Sydney</label></li>
                                            </ul>
                                        </div>
                                        <!-- end panel-body -->
                                    </div>
                                    <!-- end panel-collapse -->
                                </div>
                                <!-- end panel-default -->

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a href="#panel-2" data-toggle="collapse">Thời lượng <span><i class="fa fa-angle-down"></i></span></a>
                                    </div>
                                    <!-- end panel-heading -->

                                    <div id="panel-2" class="panel-collapse collapse">
                                        <div class="panel-body text-left">
                                            <ul class="list-unstyled">
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check11" name="checkbox" />
                                                    <label for="check11"><span><i class="fa fa-check"></i></span>All</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check12" name="checkbox" />
                                                    <label for="check12"><span><i class="fa fa-check"></i></span>2 Days</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check13" name="checkbox" />
                                                    <label for="check13"><span><i class="fa fa-check"></i></span>3 Days</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check14" name="checkbox" />
                                                    <label for="check14"><span><i class="fa fa-check"></i></span>5 Days</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check15" name="checkbox" />
                                                    <label for="check15"><span><i class="fa fa-check"></i></span>7 Days</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check16" name="checkbox" />
                                                    <label for="check16"><span><i class="fa fa-check"></i></span>10 Days</label></li>
                                            </ul>
                                        </div>
                                        <!-- end panel-body -->
                                    </div>
                                    <!-- end panel-collapse -->
                                </div>
                                <!-- end panel-default -->

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a href="#panel-3" data-toggle="collapse">Dịch vụ <span><i class="fa fa-angle-down"></i></span></a>
                                    </div>
                                    <!-- end panel-heading -->

                                    <div id="panel-3" class="panel-collapse collapse">
                                        <div class="panel-body text-left">
                                            <ul class="list-unstyled">
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check17" name="checkbox" />
                                                    <label for="check17"><span><i class="fa fa-check"></i></span>1 Star</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check18" name="checkbox" />
                                                    <label for="check18"><span><i class="fa fa-check"></i></span>2 Star</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check19" name="checkbox" />
                                                    <label for="check19"><span><i class="fa fa-check"></i></span>3 Star</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check20" name="checkbox" />
                                                    <label for="check20"><span><i class="fa fa-check"></i></span>4 Star</label></li>
                                                <li class="custom-check">
                                                    <input type="checkbox" id="check21" name="checkbox" />
                                                    <label for="check21"><span><i class="fa fa-check"></i></span>5 Star</label></li>
                                            </ul>
                                        </div>
                                        <!-- end panel-body -->
                                    </div>
                                    <!-- end panel-collapse -->
                                </div>
                                <!-- end panel-default -->

                            </div>
                            <!-- end panel-group -->

                            <div class="price-slider">
                                <p>
                                    <input type="text" id="amount" readonly>
                                </p>
                                <div id="slider-range"></div>
                            </div>
                            <!-- end price-slider -->
                        </div>
                        <!-- end side-bar-block -->

                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-12">
                                <div class="side-bar-block main-block ad-block">
                                    <div class="main-img ad-img">
                                        <a href="#">
                                            <img src="Template/images/car-ad.jpg" class="img-responsive" alt="car-ad" />
                                            <div class="ad-mask">
                                                <div class="ad-text">
                                                    <span>HOT</span>
                                                    <h2>TOUR</h2>
                                                    <!-- <span>Offer</span> -->
                                                </div>
                                                <!-- end ad-text -->
                                            </div>
                                            <!-- end columns -->
                                        </a>
                                    </div>
                                    <!-- end ad-img -->
                                </div>
                                <!-- end side-bar-block -->
                            </div>
                            <!-- end columns -->
                            </ItemTemplate>
                            </asp:Repeater>  
                               
                                
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- end columns -->

                    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 content-side">
                        <asp:Repeater runat="server" ID="rpXemtour">
                            <ItemTemplate>
                                <div class="list-block main-block t-list-block">
                                    <div class="list-content">
                                        <div class="main-img list-img t-list-img">
                                            <a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>">
                                                <img src='<%# "/Images/AnhTour/" + (Eval("Images").ToString()) %>' class="img-responsive" alt="Product Name">
                                            </a>
                                            <div class="main-mask">
                                                <div class="productname">
                                                    <ul class="list-unstyled list-inline offer-price-1">
                                                        <li class="price">
                                                            <%# Eval("Banggia").ToString() %><span class="divider">|</span><span class="pkg"> <%# Eval("Thoiluong").ToString() %></span></li>

                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- end main-mask -->
                                        </div>
                                        <!-- end t-list-img -->

                                        <div class="list-info t-list-info">
                                            <h3 class="block-title"><a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>">
                                                <div class="productname"><%# Eval("Tentour").ToString() %></div>
                                            </a></h3>
                                            <h3 class="block-title"><a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>">
                                                <div class="productname"><%# Eval("Tendiadiem").ToString() %></div>
                                            </a></h3>

                                            <%--<p><div class="productname"><%# Eval("Tentour").ToString() %></div></p>--%>
                                            <a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>" class="btn btn-orange btn-lg">Xem Thêm</a>
                                        </div>
                                        <!-- end t-list-info -->
                                    </div>
                                    <!-- end list-content -->
                                </div>
                                <!-- end t-list-block -->
                            </ItemTemplate>
                        </asp:Repeater>


                    </div>
                    <!-- end columns -->

                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
        <!-- end tour-listing -->
    </section>
    <!-- end innerpage-wrapper -->

    <!--======================= BEST FEATURES =====================-->

    <!--========================= NEWSLETTER-1 ==========================-->
</asp:Content>
