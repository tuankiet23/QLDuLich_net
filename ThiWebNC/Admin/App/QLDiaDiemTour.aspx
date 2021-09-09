<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QLDiaDiemTour.aspx.cs" Inherits="ThiWebNC.Admin.App.QLDiaDiemTour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="penalhead" runat="server">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0 font-size-18">Địa điểm du lịch</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Apps</a></li>
                            <li class="breadcrumb-item active">Quản lý địa điểm có trong tour</li>
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
                            <asp:GridView ID="dgvQLChiTietDiaDiem" runat="server" class="table mb-0" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AllowPaging="true" OnPageIndexChanging="dgvQLChiTietDiaDiem_PageIndexChanging" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057">
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
                                            <asp:LinkButton ID="linkEdit" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("MaChiTietDD").ToString() %>' OnCommand="linkEdit_Command"><i class="bx bx-edit-alt" ></i></asp:LinkButton><span> |</span>
                                            <asp:LinkButton ID="linkDelete" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("MaChiTietDD").ToString() %>' OnCommand="linkDelete_Command" OnClientClick="return checkValid()"><i class="bx bx-trash"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:BoundField DataField="MaChiTietDD" HeaderText="Mã chi tiết địa điểm" ItemStyle-HorizontalAlign="Center" />

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Tên địa điểm</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getDiaDiem(Eval("Madiadiem").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Tên tour</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getTour(Eval("Matour").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="TenChiTietDD" HeaderText="Tên địa điểm tham quan" ItemStyle-HorizontalAlign="Center" />
                                    
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
                        <h4 class="card-title mb-4">Chỉnh sửa thông tin</h4>
                        <div class="outer-repeater">
                            <div data-repeater-list="outer-group" class="outer">
                                <div data-repeater-item="" class="outer">
                                    <div class="form-group">
                                        <label for="formadattour">Mã chi tiết địa điểm :</label>
                                        <asp:TextBox ID="txt_madiadiem" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="formmessage">Địa điểm :</label>
                                            <asp:DropDownList ID="cbDiaDiem" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="formmessage">Tên tour :</label>
                                            <asp:DropDownList ID="cbTenTour" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="forsdt">Tên địa điểm :</label>
                                        <asp:TextBox ID="txt_tendiadiem" runat="server" class="form-control"></asp:TextBox>
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
