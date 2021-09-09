<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QLPHKhachHang.aspx.cs" Inherits="ThiWebNC.Admin.App.QLPHKhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="penalhead" runat="server">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0 font-size-18">Phản hồi khách hàng</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Menu</a></li>
                            <li class="breadcrumb-item active">Phản hồi khách hàng</li>
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
                        <h4 class="card-title">Thông tin</h4>
                        <div class="table-responsive">
                            <asp:GridView ID="dgvQLPHKhachHang" runat="server" class="table mb-0" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AllowPaging="true" OnPageIndexChanging="dgvQLPHKhachHang_PageIndexChanging" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057">
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
                                            <asp:LinkButton ID="linkEdit" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("MaLH").ToString() %>' OnCommand="linkEdit_Command"><i class="bx bx-edit-alt" ></i></asp:LinkButton><span> |</span>
                                            <asp:LinkButton ID="linkDelete" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("MaLH").ToString() %>' OnCommand="linkDelete_Command" OnClientClick="return checkValid()"><i class="bx bx-trash"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:BoundField DataField="MaLH" HeaderText="Mã liên hệ" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ChuDe" HeaderText="Chủ đề" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="NoiDung" HeaderText="Nội dung" ItemStyle-HorizontalAlign="Center" />
                                    <%--<asp:BoundField DataField="TinhTrang" HeaderText="TinhTrang" ItemStyle-HorizontalAlign="Center" />--%>
                                </Columns>
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            Tình trạng
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
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
                        <h4 class="card-title mb-4">Chỉnh sửa thông tin liên hệ</h4>
                        <div class="outer-repeater">
                            <div data-repeater-list="outer-group" class="outer">
                                <div data-repeater-item="" class="outer">
                                    <div class="form-group">
                                        <label for="formadattour">Mã liên hệ :</label>
                                        <asp:TextBox ID="txt_madlienhe" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="formadattour">Chủ đề :</label>
                                        <asp:TextBox ID="txt_chude" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="formadattour">Tên khách hàng :</label>
                                        <asp:TextBox ID="txt_tenkh" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="formadattour">Email :</label>
                                        <asp:TextBox ID="txt_email" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="formadattour">Nội dung :</label>
                                        <asp:TextBox ID="txt_noidung" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="formadattour">Tình trạng:</label>
                                        <asp:TextBox ID="txt_tinhtrang" runat="server" class="form-control"></asp:TextBox>
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
