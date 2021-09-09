<%@ Page Title="" Language="C#" MasterPageFile="~/Client/SiteClient.Master" AutoEventWireup="true" CodeBehind="ChiTietTour.aspx.cs" Inherits="ThiWebNC.Client.ChiTietTour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn:hover {
            background-color: black;
            color: red;
        }
        /*.btn .btn-block .tn-orange:hover{*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="innerpage-wrapper">

        <div id="tour-details" class="innerpage-section-padding">
            <div class="container">
                <div class="row">

                    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 content-side">
                        <asp:Repeater runat="server" ID="rpChitiet">
                            <ItemTemplate>
                                <div class="detail-slider">

                                    <div class="feature-slider">
                                        <img src='<%# "/Images/AnhTour/" + (Eval("Images").ToString()) %>' class="img-responsive" alt="Product Name">
                                    </div>
                                    <!-- end feature-slider -->

                                    <%--<div class="feature-slider-nav">
                                  <img src='<%# "Template/images1/" + (Eval("Images").ToString()) %>' class="img-responsive" alt="Product Name">         

                                </div><!-- end feature-slider-nav -->--%>


                                    <ul class="list-unstyled features tour-features">
                                        <%--<li><div class="f-icon"><i class="fa fa-wheelchair"></i></div><div class="f-text"><p class="f-heading">Seats</p><p class="f-data">25</p></div></li>--%>
                                        <li>
                                            <div class="f-icon"><i class="fa fa-calendar"></i></div>
                                            <div class="f-text">
                                                <p class="f-heading"></p>
                                                <p class="f-data"><%# Eval("Thoiluong").ToString() %></p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="f-icon"><i class="fa fa-money"></i></div>
                                            <div class="f-text">
                                                <p class="f-heading">Giá:</p>
                                                <p class="f-data"><%# string.Format("{0:#,0}" , Eval("Banggia").ToString()) %></p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="f-icon"><i class="fa fa-map"></i></div>
                                            <div class="f-text">
                                                <p class="f-heading">Điểm đến:</p>
                                                <p class="f-data"><%# Eval("Tendiadiem").ToString() %></p>
                                            </div>
                                        </li>
                                        <%--<li><div class="f-icon"><i class="fa fa-clock-o"></i></div><div class="f-text"><p class="f-heading">Discount</p><p class="f-data">10% OFF</p></div></li>--%>
                                    </ul>
                                </div>
                                <!-- end detail-slider -->

                                <div class="detail-tabs">
                                    <ul class="nav nav-tabs nav-justified">
                                        <li class="active"><a href="#tour-information" data-toggle="tab">MÔ TẢ</a></li>
                                        <li><a href="#flight" data-toggle="tab">LỊCH TRÌNH</a></li>
                                        <li><a href="#map-overview" data-toggle="tab">THÔNG TIN LIÊN QUAN</a></li>
                                    </ul>

                                    <div class="tab-content">

                                        <div id="tour-information" class="tab-pane in active">
                                            <div class="row">
                                                <%--<div class="col-sm-4 col-md-4 tab-img">
                                        		<img src="Template/images/hotel-detail-tab-1.jpg" class="img-responsive" alt="flight-detail-img" />
                                            </div><!-- end columns -->--%>

                                                <div <%--class="col-sm-8 col-md-8 tab-text"--%>>
                                                    <h3></h3>
                                                    <p><%# Eval("Mota").ToString() %></p>
                                                </div>
                                                <!-- end columns -->
                                            </div>
                                            <!-- end row -->
                                        </div>
                                        <!-- end hotel-overview -->

                                        <div id="flight" class="tab-pane">
                                            <div class="row">
                                                <div <%--class="col-sm-8 col-md-8 tab-text"--%>>
                                                    <h3></h3>
                                                    <p><%# Eval("Lichtrinh").ToString() %></p>
                                                </div>
                                                <!-- end columns -->
                                            </div>
                                            <!-- end row -->
                                        </div>
                                        <!-- end restaurant -->

                                        <div id="map-overview" class="tab-pane">
                                            <div class="row">
                                                <%--<div class="col-sm-4 col-md-4 tab-img">
                                        		<img src="Template/images/hotel-detail-tab-3.jpg" class="img-responsive" alt="flight-detail-img" />
                                            </div><!-- end columns -->--%>

                                                <div<%-- class="col-sm-8 col-md-8 tab-text"--%>>
                                        		<h3></h3>
                                                <p> <%# Eval("Thongtinlienquan").ToString() %></p>
                                            </div>
                                            <!-- end columns -->
                                        </div>
                                        <!-- end row -->
                                    </div>
                                    <!-- end pick-up -->
                                    <%--<div class="col-xs-12 col-sm-12 col-md-3 side-bar right-side-bar"> 
                            <div class="side-bar-block booking-form-block">      
                            	<h2 class="selected-price"><%# Eval("Banggia").ToString() %> <span><%# Eval("Diemden").ToString() %></span></h2> </div></div>   --%>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <!-- end tab-content -->
                </div>
                <!-- end detail-tabs -->

                <div class="available-blocks" id="available-tours">
                    <h2>TOUR LIÊN QUAN</h2>
                    <asp:Repeater runat="server" ID="rpLienhe">
                        <ItemTemplate>
                            <div class="list-block main-block t-list-block">
                                <div class="list-content">
                                    <div class="main-img list-img t-list-img">
                                        <a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>">
                                            <img src='<%# "/Images/AnhTour/" + (Eval("Images").ToString()) %>' class="img-responsive" alt="Product Name">
                                            <%-- <img src="Template/images/tour-list-1.jpg" class="img-responsive" alt="tour-img" />--%>
                                        </a>
                                        &nbsp;&nbsp;&nbsp;<div class="main-mask">
                                            <ul class="list-unstyled list-inline offer-price-1">
                                                <li class="price"><%# Eval("Banggia").ToString() %><span class="divider">|</span><span class="pkg"><%# Eval("Thoiluong").ToString() %></span></li>

                                            </ul>
                                        </div>
                                        <!-- end main-mask -->
                                    </div>
                                    <!-- end t-list-img -->

                                    <div class="list-info t-list-info">
                                        <h3 class="block-title"><a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>"><%# Eval("Tendiadiem").ToString() %></a></h3>
                                        <%--<p class="block-minor">2 Adults, 02 Kids</p>
                                            <p>Lorem ipsum dolor sit amet, ad duo fugit aeque fabulas, in lucilius prodesset pri. Veniam delectus ei vis. Est atqui timeam mnesarchum at, pro an eros perpetua ullamcorper.</p>--%>
                                        <a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>" class="btn btn-orange btn-lg">XEM CHI TIẾT</a>
                                    </div>
                                    <!-- end t-list-info -->
                                </div>
                                <!-- end list-content -->
                            </div>
                            <!-- end t-list-block -->
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <!-- end available-tours -->
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 side-bar right-side-bar">

                <div class="side-bar-block booking-form-block">
                    <asp:Label runat="server" ID="lable" />
                    <asp:Panel runat="server" ID="panel">
                         <div class="booking-form">
                        <h3>Đặt Tour</h3>
                        <p>Find your dream tour today</p>
                        <div class="form-group">
                            <label for="fortenkh">Tên khách hàng :</label>
                            <asp:TextBox ID="txt_tenkh" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="forsdt">Số điện thoại :</label>
                            <asp:TextBox ID="txt_dienthoai" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="foremail">Email :</label>
                            <asp:TextBox ID="txt_email" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="fordiachi">Địa chỉ :</label>
                            <asp:TextBox ID="txt_diachi" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="fornguoilon">Số người lớn :</label>
                            <asp:TextBox ID="txt_songuoilon" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="forsotreem">Số trẻ em :</label>
                            <asp:TextBox ID="txt_sotreem" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="forpttt">Phương thức thanh toán:</label>
                            <asp:DropDownList ID="cbphuongthuctt" runat="server" class="form-control"></asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label for="foryeucau">Yêu cầu :</label>
                            <asp:TextBox ID="txt_yeucau" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <%--<div class="form-group">
                            <asp:Label runat="server" ID="lbError" CssClass="text-danger"></asp:Label>
                            
                        </div>--%>
                        <asp:Label runat="server" ID="lb_thongbao"></asp:Label>
                        <asp:Button Text="Đặt tour" runat="server" class="btn btn-block btn-orange" style="background-color: orange;" OnCommand="btn_DatTour" />

                    </div>
                    </asp:Panel>
                    <!-- end booking-form -->
                </div>
                <!-- end side-bar-block -->


                <%--<div class="side-bar-block booking-form-block">
                    <div class="booking-form">
                        <h3>Đặt Tour</h3>
                        <p>Find your dream tour today</p>
                        <form>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="First Name" required />
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Last Name" required />
                            </div>

                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Email" required />
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Phone" required />
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control dpd3" placeholder="Booking Date" required />
                            </div>

                            <div class="row">
                                <div class="col-sm-6 col-md-12 col-lg-6 no-sp-r">
                                    <div class="form-group right-icon">
                                        <select class="form-control">
                                            <option selected>Adults</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                        </select>
                                        <i class="fa fa-angle-down"></i>
                                    </div>
                                </div>

                                <div class="col-sm-6 col-md-12 col-lg-6 no-sp-l">
                                    <div class="form-group right-icon">
                                        <select class="form-control">
                                            <option selected>Children</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                        </select>
                                        <i class="fa fa-angle-down"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group right-icon">
                                <select class="form-control">
                                    <option selected>Payment Method</option>
                                    <option>Credit Card</option>
                                    <option>Paypal</option>
                                </select>
                                <i class="fa fa-angle-down"></i>
                            </div>
                            <button class="btn btn-block btn-orange">Confirm Booking</button>
                        </form>

                    </div>
                    <!-- end booking-form -->
                </div>
                <!-- end side-bar-block -->--%>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-12">
                        <div class="side-bar-block main-block ad-block">
                            <div class="main-img ad-img">
                                <a href="#">
                                    <img src="Template/images/car-ad.jpg" class="img-responsive" alt="car-ad" />
                                    <div class="ad-mask">
                                        <div class="ad-text">
                                            <span>Luxury</span>
                                            <h2>Car</h2>
                                            <span>Offer</span>
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
                </div>
                <!-- end row -->
            </div>
            <!-- end columns -->

        </div>
        <!-- end row -->
    </section>
    <!-- end innerpage-wrapper -->
</asp:Content>
