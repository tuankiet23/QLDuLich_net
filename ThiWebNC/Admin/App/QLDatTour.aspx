<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QLDatTour.aspx.cs" Inherits="ThiWebNC.Admin.App.QLDatTour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="penalhead" runat="server">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0 font-size-18"> Đặt Tour du lịch</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Menu</a></li>
                            <li class="breadcrumb-item active">Quản lý đặt Tour</li>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
    </asp:Panel>

     <asp:Panel ID="penaltable" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Thông tin đặt Tour</h4>
                        <div class="table-responsive">
                            <asp:GridView ID="dgvQLDatTour" runat="server" class="table mb-0" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AllowPaging="true"  OnPageIndexChanging="dgvQLDatTour_PageIndexChanging" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057">
                                <Columns>
                                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            Hành động
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="linkEdit" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("MaDT").ToString() %>' OnCommand="linkEdit_Command"><i class="bx bx-edit-alt" ></i></asp:LinkButton><span> |</span>
                                            <asp:LinkButton ID="linkDelete" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("MaDT").ToString() %>' OnCommand="linkDelete_Command" OnClientClick="return checkValid()"><i class="bx bx-trash"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:BoundField DataField="MaDT" HeaderText="Mã đặt tour" ItemStyle-HorizontalAlign="Center" />
                                    <%--<asp:BoundField DataField="MaLoaiTour" HeaderText="Mã loại tour" ItemStyle-HorizontalAlign="Center" />--%>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Tên tour</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getTour(Eval("Matour").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="DienThoai" HeaderText="Số điện thoại"  ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="SoNguoiLon" HeaderText="Số người lớn" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="SoTreEm" HeaderText="Số trẻ em" ItemStyle-HorizontalAlign="Center" />
                                    <%--<asp:BoundField DataField="NgayDi" HeaderText="Ngày đi" DataFormatString="{0:dd-MM-yyyy}" ItemStyle-HorizontalAlign="Center" />--%>
                                    <%--<asp:BoundField DataField="MaDichVu" HeaderText="Mã dịch vụ" ItemStyle-HorizontalAlign="Center" />--%>

                                    <%--<asp:BoundField DataField="Mapt" HeaderText="mã phương thức" ItemStyle-HorizontalAlign="Center" />--%>

                                    <asp:BoundField DataField="YeuCau" HeaderText="Yêu cầu" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Phương thức thanh toán</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getPhuongThucTT(Eval("Mapt").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:BoundField DataField="TinhTrang" HeaderText="Tình trạng" ItemStyle-HorizontalAlign="Center" />--%>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Tình trạng</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getTinhTrang(Eval("MaTinhtrangDatTour").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                            </asp:GridView>
                        </div>
                        <br />
                        <asp:Button ID="btnSave" runat="server" Text="Thêm" class="btn btn-success" OnCommand="btn_Save" />
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="panelform" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title mb-4">Chỉnh sửa thông tin Đặt Tour</h4>
                        <div class="outer-repeater">
                            <div data-repeater-list="outer-group" class="outer">
                                <div data-repeater-item="" class="outer">
                                    <div class="form-group">
                                        <label for="formadattour">Mã đặt tour :</label>
                                        <asp:TextBox ID="txt_Madattour" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="fortenkh">Tên khách hàng :</label>
                                        <asp:TextBox ID="txt_tenkh" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="fortentour">Tên tour :</label>
                                            <asp:DropDownList ID="cbTenTour" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
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

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="forpttt">Phương thức thanh toán:</label>
                                            <asp:DropDownList ID="cbphuongthuctt" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="foryeucau">yêu cầu :</label>
                                        <asp:TextBox ID="txt_yeucau" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="forpttt">Tình trạng:</label>
                                            <asp:DropDownList ID="cbtinhtrang" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <asp:Button ID="btnAdd" runat="server" Text="Lưu" class="btn btn-success" OnCommand="btn_Add" />
                                    <asp:Button ID="btnDelete" runat="server" Text="Xóa" class="btn btn-danger " OnCommand="btn_Delete" OnClientClick="return checkValid()" />
                                    <asp:Button ID="btnOut" runat="server" Text="Quay lại" class="btn btn-light" OnCommand="btn_Out" />
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
    <script>
        function checkValid() {
            if (confirm("Bạn có chắc muốn xóa không ??") == true) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
