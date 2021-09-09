<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QLSlide.aspx.cs" Inherits="ThiWebNC.Admin.App.QLSlide" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="penalhead" runat="server">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0 font-size-18">Slide ảnh</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Menu</a></li>
                            <li class="breadcrumb-item active">Quản lý Slide ảnh</li>
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
                        <h4 class="card-title">Thông tin tin tức</h4>
                        <div class="table-responsive">
                            <asp:GridView ID="dgvQLSlide" runat="server" class="table mb-0" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AllowPaging="true" OnPageIndexChanging="dgvQLSlide_PageIndexChanging" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057">
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
                                            <asp:LinkButton ID="linkEdit" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("MaAnh").ToString() %>' OnCommand="linkEdit_Command"><i class="bx bx-edit-alt" ></i></asp:LinkButton><span> |</span>
                                            <asp:LinkButton ID="linkDelete" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("MaAnh").ToString() %>' OnCommand="linkDelete_Command" OnClientClick="return checkValid()"><i class="bx bx-trash"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:BoundField DataField="MaAnh" HeaderText="Mã ảnh" ItemStyle-HorizontalAlign="Center" />
                                    
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Hình ảnh</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%--<asp:Label runat="server" Text='<%# getLoaiTour(Eval("MaLoaiTour").ToString()) %>'></asp:Label>--%>
                                            <img style="width:50px; height:50px" src='<%# "/Images/Slide/" + getLinkAnh(Eval("MaAnh").ToString()) %>' alt="">
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="MoTa" HeaderText="Mô tả" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái" ItemStyle-HorizontalAlign="Center" />
                                    <%--<asp:BoundField DataField="Hinhanh" HeaderText="Hình ảnh" ItemStyle-HorizontalAlign="Center" />--%>

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
                        <h4 class="card-title mb-4">Chỉnh sửa thông tin tin tức</h4>
                        <div class="outer-repeater">
                            <div data-repeater-list="outer-group" class="outer">
                                <div data-repeater-item="" class="outer">
                                    <div class="form-group">
                                        <label for="formadattour">Mã ảnh :</label>
                                        <asp:TextBox ID="txt_maanh" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="fordiachi">Ảnh :</label>
                                        <asp:TextBox ID="txt_anh" runat="server" type="File" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="forsdt">Mô tả :</label>
                                        <asp:TextBox ID="txt_mota" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    
                                    <%--<div class="form-group">
                                        <label for="forngaydi">Trạng thái :</label>
                                        <asp:TextBox ID="txt_trangthai" runat="server" class="form-control" ></asp:TextBox>
                                    </div>--%>

                                   
                                    <%--<div class="form-group">
                                        <label for="forngaydi">Ngày đăng :</label>
                                        <asp:TextBox ID="TextBox1" runat="server" type="file" class="form-control" ></asp:TextBox>
                                    </div>--%>

                                    
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="formmessage">Trạng thái :</label>
                                            <asp:DropDownList ID="cbTrangThai" runat="server" class="form-control">
                                                <asp:ListItem Text="1" />
                                                <asp:ListItem Text="0" />
                                            </asp:DropDownList>
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
