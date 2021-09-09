<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QLTaiKhoan.aspx.cs" Inherits="ThiWebNC.Admin.App.QLTaiKhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="penalhead" runat="server">
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0 font-size-18">Tài khoản</h4>

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Menu</a></li>
                                            <li class="breadcrumb-item active">Quản lý tài khoản</li>
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
                                        <h4 class="card-title">Thông tin tài khoản</h4> 
                                        <div class="table-responsive">
                                            <asp:GridView ID="dgvAccount" runat="server" class="table mb-0" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AllowPaging="true" OnPageIndexChanging="dgvAccount_PageIndexChanging" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057" >
                                                <Columns>
                                                    <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                
                                                <Columns>
                                                    <asp:BoundField DataField="Username" HeaderText="Username" ItemStyle-HorizontalAlign="Center"  />
                                                    <%--<asp:BoundField DataField="Userpass" HeaderText="Password" ItemStyle-HorizontalAlign="Center"  />--%>
<%--                                                    <asp:BoundField DataField="role" HeaderText="Role" ItemStyle-HorizontalAlign="Center" />--%>
                                                </Columns>
                                                <Columns >
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" >
                                                        <HeaderTemplate>
                                                            Hành động
                                                        </HeaderTemplate>
                                                        <ItemTemplate >
                                                            <asp:LinkButton ID="linkDelete" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("Username").ToString() %>' OnCommand="linkDelete_Command" OnClientClick="return checkValid()" ><i class="bx bx-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <br />
                                        <asp:LinkButton ID="linkCreate" runat="server" class="btn btn-primary waves-effect waves-light" target="_blank" href="../AccountManagers/Register.aspx">Tạo tài khoản</asp:LinkButton>
                                        <asp:LinkButton ID="linkChange" runat="server" class="btn btn-info waves-effect waves-light" target="_blank" href="../AccountManagers/ChangePassword.aspx">Đổi mật khẩu</asp:LinkButton>
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
