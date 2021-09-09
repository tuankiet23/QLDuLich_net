<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ThiWebNC.Admin.App.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="panelform" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title mb-4">Thông tin chung</h4>
                        <div class="outer-repeater">
                            <div data-repeater-list="outer-group" class="outer">
                                <div data-repeater-item="" class="outer">
                                    <div class="form-group">
                                        <label id="lb_tongtien" runat="server"></label>
                                        <%--<asp:TextBox ID="txt_tongtien" runat="server" class="form-control"></asp:TextBox>--%>
                                    </div>

                                    <div class="form-group">
                                        <label id="lb_sotourtrongthang" runat="server"></label>
                                        <%--<asp:TextBox ID="txt_tongtien" runat="server" class="form-control"></asp:TextBox>--%>
                                    </div>

                                    <h4 class="card-title mb-4" style="padding-top: 50px">Tiền tour trong 3 tháng gần nhất: </h4>
                                    <div class="form-group">
                                        <label id="lb_doanhthu1" runat="server"></label>
                                        <%--<asp:TextBox ID="txt_tongtien" runat="server" class="form-control"></asp:TextBox>--%>
                                    </div>
                                    <div class="form-group">
                                        <label id="lb_doanhthu2" runat="server"></label>
                                        <%--<asp:TextBox ID="txt_tongtien" runat="server" class="form-control"></asp:TextBox>--%>
                                    </div>
                                    <div class="form-group">
                                        <label id="lb_doanhthu3" runat="server"></label>
                                        <%--<asp:TextBox ID="txt_tongtien" runat="server" class="form-control"></asp:TextBox>--%>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <h4 class="card-title mb-4" style="padding-top: 50px">Tình trạng tour</h4>
                        <div class="outer-repeater">
                            <div data-repeater-list="outer-group" class="outer">
                                <div data-repeater-item="" class="outer">
                                    <div class="form-group">
                                        <h4 class="card-title mb-4"> </h4>
                                        <div class="form-group">
                                            <label id="lb_tinhtrang1" runat="server"></label>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label id="lb_tinhtrang2" runat="server"></label>
                                           
                                        </div>
                                        <div class="form-group">
                                            <label id="lb_tinhtrang3" runat="server"></label>
                                        </div>
                                        <a href="QLDatTour.aspx">Ấn vào đây để liên hệ với khách hàng!</a>
                                        <h4 class="card-title mb-4" style="padding-top: 50px">Doanh thu</h4>
                                        <div class="form-group">
                                            <label id="lb_tienthudc" runat="server"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <!-- apexcharts -->
    <script src="..\Template\libs\apexcharts\apexcharts.min.js"></script>

    <script src="..\Template\js\pages\dashboard.init.js"></script>
</asp:Content>
