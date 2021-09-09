<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QLKhachSan.aspx.cs" Inherits="ThiWebNC.Admin.App.QLKhachSan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="penalhead" runat="server">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0 font-size-18">Khách sạn</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Menu</a></li>
                            <li class="breadcrumb-item active">Quản lý Khách Sạn</li>
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
                        <h4 class="card-title">Thông tin khách sạn</h4>
                        <div class="table-responsive">
                            <asp:GridView ID="dgvQLKhachSan" runat="server" class="table mb-0" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AllowPaging="true" OnPageIndexChanging="dgvQLKhachSan_PageIndexChanging" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057">
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
                                            <asp:LinkButton ID="linkEdit" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("MaKhachSan").ToString() %>' OnCommand="linkEdit_Command"><i class="bx bx-edit-alt" ></i></asp:LinkButton><span> |</span>
                                            <asp:LinkButton ID="linkDelete" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("MaKhachSan").ToString() %>' OnCommand="linkDelete_Command" OnClientClick="return checkValid()"><i class="bx bx-trash"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:BoundField DataField="MaKhachSan" HeaderText="Mã khách sạn" ItemStyle-HorizontalAlign="Center" />

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Loại khách sạn</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getLoaiKhachSan(Eval("MaLoaiKhachSan").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="TenKhachSan" HeaderText="Tên khách sạn" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Diachi" HeaderText="Địa chỉ" ItemStyle-HorizontalAlign="Center" />
                                    <%--<asp:BoundField DataField="DonGia" HeaderText="Đơn giá" ItemStyle-HorizontalAlign="Center" />--%>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Bảng giá</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# string.Format("{0:#,0}", Eval("DonGia")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--<asp:BoundField DataField="Images" HeaderText="Ảnh" ItemStyle-HorizontalAlign="Center" />--%>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Hình ảnh</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%--<asp:Label runat="server" Text='<%# getLoaiTour(Eval("MaLoaiTour").ToString()) %>'></asp:Label>--%>
                                            <img style="width:50px; height:50px" src='<%# "/Images/AnhKS/" + getLinkAnh(Eval("MaKhachSan").ToString()) %>' alt="">
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--<asp:BoundField DataField="Mota" HeaderText="Mô tả" ItemStyle-HorizontalAlign="Center" />--%>
                                    <asp:BoundField DataField="Thongtinchitiet" HeaderText="Thông tin" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Tinhtrang" HeaderText="Tình trạng" ItemStyle-HorizontalAlign="Center" />
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
                        <h4 class="card-title mb-4">Chỉnh sửa thông tin khách sạn</h4>
                        <div class="outer-repeater">
                            <div data-repeater-list="outer-group" class="outer">
                                <div data-repeater-item="" class="outer">
                                    <div class="form-group">
                                        <label for="formadattour">Mã khách sạn :</label>
                                        <asp:TextBox ID="txt_makhachsan" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="fortentour">Loại khách sạn :</label>
                                            <asp:DropDownList ID="cbloaiks" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="forsdt">Tên khách sạn :</label>
                                        <asp:TextBox ID="txt_tenks" runat="server" class="form-control"></asp:TextBox>
                                    </div>


                                    <div class="form-group">
                                        <label for="foremail">Địa chỉ :</label>
                                        <asp:TextBox ID="txt_diachi" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="fordiachi">Đơn giá :</label>
                                        <asp:TextBox ID="txt_dongia" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="fornguoilon">Images :</label>
                                        <asp:TextBox ID="txt_images" type="file" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="forsotreem">Tình trạng :</label>
                                        <asp:TextBox ID="txt_tinhtrang" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <%--<div class="form-group">
                                        <label for="forngaydi">Mô tả :</label>
                                        <asp:TextBox ID="txt_mota" runat="server"  class="form-control"></asp:TextBox>
                                    </div>--%>

                                    <div class="form-group">
                                        <label for="formota">Mô tả :</label>
                                        <textarea id="txt_mota" class="ckeditor" runat="server"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="foryeucau">Thông tin liên quan :</label>
                                        <asp:TextBox ID="txt_ythongtin" runat="server" class="form-control"></asp:TextBox>
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
    <script src="../ckeditor/ckeditor.js"></script>
    <script>
        window.onload = function () {
            CKEDITOR.replace("txt_mota");
        }
    </script>
</asp:Content>
