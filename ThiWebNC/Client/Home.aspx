<%@ Page Title="" Language="C#" MasterPageFile="~/Client/SiteClient.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ThiWebNC.Client.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="flexslider-container" id="flexslider-container-1">
        
            <div class="flexslider slider" id="slider-1">
                <ul class="slides" />
                    <asp:Repeater runat="server" ID="RpSlide">
                      <ItemTemplate>
                                <li class="item-1" ><%--<img src="Template/images/hoan-thanh-thang-long.jpg" />--%>
                                  <img src='<%# "/Images/Slide/" + (Eval("Anh").ToString()) %>' class="img-responsive" alt="Product Name">

                                 <%--<div class=" meta">         
                                        <div class="container">
                                            <h2>KHÁM PHÁ</h2>
                                            <h1>VIỆT NAM</h1>
                                         <!-- <a href="#" class="btn btn-default">View More</a> -->
                                        </div><!-- end container -->  
                                    </div><!-- end meta -->--%>
                                </li><!-- end item-1 -->
                       </ItemTemplate>
                    </asp:Repeater> 
                </ul>
            </div>
        </section>
        
      
        <section id="best-features" class="banner-padding black-features">
        	<div class="container">
        		<div class="row">
        			<div class="col-sm-6 col-md-3">
                    	<div class="b-feature-block">
                    		<span><i class="fa fa-dollar"></i></span>
                        	<h3>Đảm bảo giá tốt nhất</h3>
                            <p></p>
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                   
                   <div class="col-sm-6 col-md-3">
                    	<div class="b-feature-block">
                    		<span><i class="fa fa-lock"></i></span>
                        	<h3>An toàn và Bảo mật</h3>
                            <p></p>
                        </div>
                   </div><!-- end columns -->
                   
                   <div class="col-sm-6 col-md-3">
                    	<div class="b-feature-block">
                    		<span><i class="fa fa-thumbs-up"></i></span>
                        	<h3>Đại lý du lịch tốt nhất</h3>
                            <p></p>
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                   
                   <div class="col-sm-6 col-md-3">
                    	<div class="b-feature-block">
                    		<span><i class="fa fa-bars"></i></span>
                        	<h3>Hướng dẫn Du lịch</h3>
                            <p></p>
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                </div><!-- end row -->
        	</div><!-- end container -->
        </section><!-- end best-features -->
                
        
        <!--=============== TOUR OFFERS ===============-->
        <%-- Tour HOT --%>
        <section id="tour-offers" class="section-padding">
        	<div class="container">
        		<div class="row">
        			<div class="col-sm-12">
                    	<div class="page-heading">
                        	<h2>TOUR HOT</h2>
                            <hr class="heading-line" />
                        </div><!-- end page-heading -->
                        
                         <div class="owl-carousel owl-theme owl-custom-arrow" id="owl-tour-offers">
                            <asp:Repeater runat="server" ID="rpSpHot">
                                <ItemTemplate>
                            <div class="item">
                                
                                <div class="main-block tour-block">
                                
                                    <div class="main-img">
                                    	<a href="<%# "ChiTietTour.aspx?ID="+ Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>">
                                            <img style="width:500px;height:200px"  src='<%# "/Images/AnhTour/" + (Eval("Images").ToString()) %>' class="img-responsive" alt="Product Name">
                                    	</a>
                                    &nbsp;&nbsp;&nbsp;</div><!-- end offer-img -->
                                    
                                    <div class="offer-price-2">
                                        <ul class="list-unstyled">
                                            <li class="price">
                                                 <div class="productname"><%# Eval("Banggia").ToString() %></div>
                                                <a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>" ><span class="arrow"><i class="fa fa-angle-right"></i></span></a></li>
                                        </ul>
                                    </div><!-- end offer-price-2 -->
                                        
                                    <div class="main-info tour-info">
                                    	<div class="main-title tour-title">
                                            <div class="productname"><%# Eval("Tentour").ToString() %></div>
                                            <%--<a href="#">China Temple Tour</a>--%>
                                            <p><div class="productname"><%# Eval("Tendiadiem").ToString() %></div></p>                                          
                                        </div><!-- end tour-title -->
                                    </div><!-- end tour-info -->
                                </div><!-- end tour-block -->    
                                      
                            </div><!-- end item -->
                              </ItemTemplate>
                            </asp:Repeater>    
                        <%--<div class="view-all text-center">
                        	<a href="#" class="btn btn-orange">View All</a>
                        </div><!-- end view-all -->--%>
                    </div><!-- end columns -->
                </div><!-- end row -->
        	</div><!-- end container -->
             </div>
        </section><!-- end tour-offers -->
                     
        
        
        <!--=============== CRUISE OFFERS ===============-->
    <%-- Tour Mới --%>
        <section id="cruise-offers" class="section-padding" style="padding-top: 24px;padding-bottom: 0px;">
        	<div class="container">
        		<div class="row">
        			<div class="col-sm-12">
                    	<div class="page-heading">
                        	<h2>TOUR MỚI</h2>
                            <hr class="heading-line" />
                        </div><!-- end page-heading -->
                           
                        <div class="row">
                          <asp:Repeater runat="server" ID="rdtournew">
                                <ItemTemplate>
                        	<div class="col-sm-6 col-md-6">
                        		<div class="main-block cruise-block">
                                	<div class="row">
                               
                                    	<div class="col-sm-12 col-md-6 col-md-push-6 no-pd-l">
                                        	<div class="main-img cruise-img">
                                            	<a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>">
                                                   <img style="width:500px;height:150px" src='<%# "/Images/AnhTour/" + (Eval("Images").ToString()) %>' class="img-responsive" alt="">
                                                    <div class="cruise-mask">
                                                        <p><%# Eval("Thoiluong").ToString() %></p>
                                                    </div><!-- end cruise-mask -->
                                                </a>
                                            &nbsp;&nbsp;&nbsp;</div><!-- end cruise-img -->
                                        </div><!-- end columns -->
                                        
                                		<div class="col-sm-12 col-md-6 col-md-pull-6 no-pd-r">
                                        	<div class=" main-info cruise-info">
                                                <div class="main-title cruise-title">
                                                    <a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>"><%# Eval("Tentour").ToString() %></a>
                                                    <p><%# Eval("Tendiadiem").ToString() %></p>
                                                   
                                                    
                                                	<span class="cruise-price"><%# Eval("Banggia").ToString() %></span>
                                                </div><!-- end cruise-title -->
                                            </div><!-- end cruise-info -->
                                        </div><!-- end columns -->
                                        
                                    </div><!-- end row -->	
                                </div><!-- end cruise-block -->
                        	</div><!-- end columns -->
                            </ItemTemplate>
                            </asp:Repeater>
                        </div>
                             
                             <div class="view-all text-center" ">
                        	<a href="TourMoi.aspx" class="btn btn-orange" >XEM THÊM</a>
                    </div><!-- end columns -->
                </div><!-- end row -->
        	</div><!-- end container -->
             </div>
        </section><!-- end cruise-offers -->
                           
        <!--=============== CRUISE OFFERS ===============-->
    <%-- Tour Cao Cấp --%>
       <section id="cruise-offers" class="section-padding" style="padding-top: 24px;padding-bottom: 0px;">
        	<div class="container">
        		<div class="row">
        			<div class="col-sm-12">
                    	<div class="page-heading">
                        	<h2>TOUR CAO CẤP</h2>
                            <hr class="heading-line" />
                        </div><!-- end page-heading -->
                           
                        <div class="row">
                          <asp:Repeater runat="server" ID="rpCaocap">
                                <ItemTemplate>
                        	<div class="col-sm-6 col-md-6">
                        		<div class="main-block cruise-block">
                                	<div class="row">
                               
                                    	<div class="col-sm-12 col-md-6 col-md-push-6 no-pd-l">
                                        	<div class="main-img cruise-img">
                                            	<a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>">
                                                   <img style="width:500px;height:150px"  src='<%# "/Images/AnhTour/" + (Eval("Images").ToString()) %>' class="img-responsive" alt="">
                                                    <div class="cruise-mask">
                                                        <p><%# Eval("Thoiluong").ToString() %></p>
                                                    </div><!-- end cruise-mask -->
                                                </a>
                                            </div><!-- end cruise-img -->
                                        </div><!-- end columns -->
                                        
                                		<div class="col-sm-12 col-md-6 col-md-pull-6 no-pd-r">
                                        	<div class=" main-info cruise-info">
                                                <div class="main-title cruise-title">
                                                    <a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>"><%# Eval("Tentour").ToString() %></a>
                                                    <p><%# Eval("Tendiadiem").ToString() %></p>
                                                   
                                                    
                                                	<span class="cruise-price"><%# Eval("Banggia").ToString() %></span>
                                                </div><!-- end cruise-title -->
                                            </div><!-- end cruise-info -->
                                        </div><!-- end columns -->
                                        
                                    </div><!-- end row -->	
                                </div><!-- end cruise-block -->
                        	</div><!-- end columns -->
                            </ItemTemplate>
                            </asp:Repeater>
                        </div>
                             
                             <div class="view-all text-center" ">
                        	<a href="TourCaoCap.aspx" class="btn btn-orange" >Xem thêm</a>
                    </div><!-- end columns -->
                </div><!-- end row -->
        	</div><!-- end container -->
            </div>
        </section><!-- end cruise-offers -->

    <%-- Tour Thông dụng --%>
     <section id="cruise-offers" class="section-padding" style="padding-top: 24px;padding-bottom: 0px;">
        	<div class="container">
        		<div class="row">
        			<div class="col-sm-12">
                    	<div class="page-heading">
                        	<h2>TOUR THÔNG DỤNG</h2>
                            <hr class="heading-line" />
                        </div><!-- end page-heading -->
                           
                        <div class="row">
                          <asp:Repeater runat="server" ID="rpThongdung">
                                <ItemTemplate>
                        	<div class="col-sm-6 col-md-6">
                        		<div class="main-block cruise-block">
                                	<div class="row">
                               
                                    	<div class="col-sm-12 col-md-6 col-md-push-6 no-pd-l">
                                        	<div class="main-img cruise-img">
                                            	<a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>">
                                                   <img style="width:500px;height:150px" src='<%# "/Images/AnhTour/" + (Eval("Images").ToString()) %>' class="img-responsive" alt="">
                                                    <div class="cruise-mask">
                                                        <p><%# Eval("Thoiluong").ToString() %></p>
                                                    </div><!-- end cruise-mask -->
                                                </a>
                                            &nbsp;&nbsp;&nbsp;</div><!-- end cruise-img -->
                                        </div><!-- end columns -->
                                        
                                		<div class="col-sm-12 col-md-6 col-md-pull-6 no-pd-r">
                                        	<div class=" main-info cruise-info">
                                                <div class="main-title cruise-title">
                                                    <a href="<%# "ChiTietTour.aspx?ID=" + Eval("Matour").ToString() %>&ml=<%# Eval("MaLoaiTour").ToString() %>&ttt=<%# Eval("MaTinhTrangTour").ToString() %>"><%# Eval("Tentour").ToString() %></a>
                                                    <p><%# Eval("Tendiadiem").ToString() %></p>
                                                   
                                                    
                                                	<span class="cruise-price"><%# Eval("Banggia").ToString() %></span>
                                                </div><!-- end cruise-title -->
                                            </div><!-- end cruise-info -->
                                        </div><!-- end columns -->
                                        
                                    </div><!-- end row -->	
                                </div><!-- end cruise-block -->
                        	</div><!-- end columns -->
                            </ItemTemplate>
                            </asp:Repeater>
                        </div>
                             
                             <div class="view-all text-center" style="padding-bottom:10px;">
                        	<a href="TourThongDung.aspx" class="btn btn-orange" >Xem thêm</a>
                    </div><!-- end columns -->
                </div><!-- end row -->
        	</div><!-- end container -->
            </div>
        </section><!-- end cruise-offers -->
        <!--==================== VIDEO BANNER ===================-->
        <section id="video-banner" class="banner-padding back-size"> 
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h2>VIDEO DU LỊCH</h2>
                       
                        
                        <a href="https://youtube.com/watch?v=0O2aH4XLbto" class="popup-youtube" id="play-button"><span><i class="fa fa-play"></i></span></a>
                    </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end video-banner -->

        <!--================ LATEST BLOG ==============-->
       <%-- <section id="latest-blog" class="section-padding">
        	<div class="container">
        		<div class="row">
        			<div class="col-sm-12">
                    	<div class="page-heading">
                        	<h2>Our Latest Blogs</h2>
                            <hr class="heading-line" />
                        </div>
                        
                        <div class="row">
                        	
                             <div class="col-sm-6 col-md-4">
                                <div class="main-block latest-block">
                                    <div class="main-img latest-img">
                                    	<a href="#">
                                        	<img src="Template/images/latest-blog-1.jpg" class="img-responsive" alt="blog-img" />
                                        </a>
                                    </div><!-- end latest-img -->
                                    
                                    <div class="latest-info">
                                    	<ul class="list-unstyled">
                                        	<li><span><i class="fa fa-calendar-minus-o"></i></span>29 April,2017<span class="author">by: <a href="#">Jhon Smith</a></span></li>
                                        </ul>
                                    </div><!-- end latest-info -->
                                    
                                    <div class="main-info latest-desc">
                                    	<div class="row">
                                        	<div class="col-xs-10 col-sm-10 main-title">
                                            	<a href="#">Travel Insuranve Benefits</a>
                                                <p>Veniam delectus ei vis. Est atqui timeam mnesarchum at, pro an eros perpetua ullamcorper.</p>
                                            </div><!-- end columns -->
                                        </div><!-- end row -->
                                        
                                        <span class="arrow"><a href="#"><i class="fa fa-angle-right"></i></a></span>
                                    </div><!-- end latest-desc -->
                                </div><!-- end latest-block -->
                            </div><!-- end columns -->
                        	
                            <div class="col-sm-6 col-md-4">
                                <div class="main-block latest-block">
                                    <div class="main-img latest-img">
                                        <a href="#">
                                        	<img src="Template/images/latest-blog-2.jpg" class="img-responsive" alt="blog-img" />
                                        </a>
                                    </div><!-- end latest-img -->
                                    
                                    <div class="latest-info">
                                    	<ul class="list-unstyled">
                                        	<li><span><i class="fa fa-calendar-minus-o"></i></span>29 April,2017<span class="author">by: <a href="#">Jhon Smith</a></span></li>
                                        </ul>
                                    </div><!-- end latest-info -->
                                    
                                    <div class="main-info latest-desc">
                                    	<div class="row">
                                        	<div class="col-xs-10 col-sm-10 main-title">
                                            	<a href="#">Travel Guideline Agents</a>
                                                <p>Veniam delectus ei vis. Est atqui timeam mnesarchum at, pro an eros perpetua ullamcorper.</p>
                                            </div><!-- end columns -->
                                        </div><!-- end row -->
                                        
                                        <span class="arrow"><a href="#"><i class="fa fa-angle-right"></i></a></span>
                                    </div><!-- end latest-desc -->
                                </div><!-- end latest-block -->
                             </div><!-- end columns -->
                             
                             <div class="col-sm-6 col-md-4">
                                <div class="main-block latest-block">
                                    <div class="main-img latest-img">
                                        <a href="#">
                                        	<img src="Template/images/latest-blog-3.jpg" class="img-responsive" alt="blog-img" />
                                        </a>
                                    </div><!-- end latest-img -->
                                    
                                    <div class="latest-info">
                                    	<ul class="list-unstyled">
                                        	<li><span><i class="fa fa-calendar-minus-o"></i></span>29 April,2017<span class="author">by: <a href="#">Jhon Smith</a></span></li>
                                        </ul>
                                    </div><!-- end latest-info -->
                                    
                                    <div class="main-info latest-desc">
                                    	<div class="row">
                                        	<div class="col-xs-10 col-sm-10 main-title">
                                            	<a href="#">Secure Travel Tips</a>
                                                <p>Veniam delectus ei vis. Est atqui timeam mnesarchum at, pro an eros perpetua ullamcorper.</p>
                                            </div><!-- end columns -->
                                        </div><!-- end row -->
                                        
                                        <span class="arrow"><a href="#"><i class="fa fa-angle-right"></i></a></span>
                                    </div><!-- end latest-desc -->
                                </div><!-- end latest-block -->
                             </div><!-- end columns -->
                             
                        </div><!-- end row -->
                        
                        <div class="view-all text-center">
                        	<a href="#" class="btn btn-orange">View All</a>
                        </div><!-- end view-all -->  
                    </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end latest-blog -->   --%>      
</asp:Content>
