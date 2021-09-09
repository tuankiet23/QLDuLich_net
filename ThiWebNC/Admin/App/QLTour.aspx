<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="QLTour.aspx.cs" Inherits="ThiWebNC.Admin.App.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Panel ID="penalhead" runat="server">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-flex align-items-center justify-content-between">
                    <h4 class="mb-0 font-size-18">Tour du lịch</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Menu</a></li>
                            <li class="breadcrumb-item active">Quản lý Tour</li>
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
                        <h4 class="card-title">Thông tin Tour</h4>
                        <div class="table-responsive">
                            <asp:GridView ID="dgvQLTour" runat="server" class="table mb-0" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AllowPaging="true" OnPageIndexChanging="dgvQLTour_PageIndexChanging" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057">
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
                                            <asp:LinkButton ID="linkEdit" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("Matour").ToString() %>' OnCommand="linkEdit_Command"><i class="bx bx-edit-alt" ></i></asp:LinkButton><span> |</span>
                                            <asp:LinkButton ID="linkDelete" runat="server" CssClass="bx-spin-hover" CommandArgument='<%# Eval("Matour").ToString() %>' OnCommand="linkDelete_Command" OnClientClick="return checkValid()"><i class="bx bx-trash"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:BoundField DataField="Matour" HeaderText="Mã tour" ItemStyle-HorizontalAlign="Center" />
                                    <%--<asp:BoundField DataField="MaLoaiTour" HeaderText="Mã loại tour" ItemStyle-HorizontalAlign="Center" />--%>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Tên loại tour</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getLoaiTour(Eval("MaLoaiTour").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Tentour" HeaderText="Tên tour" ItemStyle-HorizontalAlign="Center" />
                                    <%--<asp:BoundField DataField="Mota" HeaderText="Mô tả" ItemStyle-HorizontalAlign="Center" />--%>
                                    <%--<asp:BoundField DataField="Lichtrinh" HeaderText="Lịch trình" ItemStyle-HorizontalAlign="Center" />--%>
                                    <%--<asp:BoundField DataField="Banggia" HeaderText="Bảng giá" ItemStyle-HorizontalAlign="Center" />--%>

                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Bảng giá</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# string.Format("{0:#,0}", Eval("Banggia")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--<asp:BoundField DataField="Thongtinlienquan" HeaderText="Thông tin" ItemStyle-HorizontalAlign="Center" />--%>
                                    <%--<asp:BoundField DataField="Images" HeaderText="Ảnh" ItemStyle-HorizontalAlign="Center" />--%>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Hình ảnh</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%--<asp:Label runat="server" Text='<%# getLoaiTour(Eval("MaLoaiTour").ToString()) %>'></asp:Label>--%>
                                            <img style="width:50px; height:50px" src='<%# "/Images/AnhTour/" + getLinkAnh(Eval("Matour").ToString()) %>' alt="">
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Tình trạng tour</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getTinhTrang(Eval("MaTinhTrangTour").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Diadiemkhoihanh" HeaderText="Địa điểm khởi hành" ItemStyle-HorizontalAlign="Center" />

                                    <%--<asp:BoundField DataField="Madiadiem" HeaderText="Điểm đến" ItemStyle-HorizontalAlign="Center" />--%>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Tên điểm đến</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getDiaDiem(Eval("Madiadiem").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Thoiluong" HeaderText="Thời lượng" ItemStyle-HorizontalAlign="Center" />

                                    <%--<asp:BoundField DataField="MaKhachSan" HeaderText="Mã Khách Sạn" ItemStyle-HorizontalAlign="Center" />--%>

                                   

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Tên khách sạn</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getKhachSan(Eval("MaKhachSan").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            <asp:Label runat="server">Tên dịch vụ</asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getDichVu(Eval("MaDichvu").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <%--<asp:BoundField DataField="MaDichVu" HeaderText="dịch vụ" ItemStyle-HorizontalAlign="Center" />--%>
                                    <asp:BoundField DataField="Phuongtien" HeaderText="Phương tiện" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="NgayDi" HeaderText="Ngày đi" DataFormatString="{0:dd-MM-yyyy}" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Lienhe" HeaderText="Liên hệ" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Ngaycapnhat" HeaderText="Ngày cập nhật" DataFormatString="{0:dd-MM-yyyy}" ItemStyle-HorizontalAlign="Center" />
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
                        <h4 class="card-title mb-4">Chỉnh sửa thông tin Tour</h4>
                        <div class="outer-repeater">
                            <div data-repeater-list="outer-group" class="outer">
                                <div data-repeater-item="" class="outer">

                                    <div class="form-group">
                                        <label for="formatour">Mã tour :</label>
                                        <asp:TextBox ID="txt_Matour" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <%--<div class="form-group">
                                        <label for="formaloaitour">Mã loại tour :</label>
                                        <asp:TextBox ID="txt_maloaitour" runat="server" class="form-control"></asp:TextBox>
                                    </div>--%>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="formmessage">Loại tour :</label>
                                            <asp:DropDownList ID="cbLoaiTour" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="fortentour">Tên tour :</label>
                                        <asp:TextBox ID="txt_tentour" runat="server" class="form-control"></asp:TextBox>
                                    </div>


                                    <%--<div class="form-group">
                                        <label for="formota">Mô tả :</label>
                                        <asp:TextBox ID="txt_mota" TextMode="MultiLine" runat="server" class="form-control"></asp:TextBox>
                                    </div>--%>

                                    <div class="form-group">
                                        <label for="formota">Mô tả :</label>
                                        <textarea id="txt_mota" class="ckeditor" runat="server"></textarea>
                                    </div>

                                    <%--<div class="form-group">
                                        <label for="forlichtrinh">Lịch trình :</label>
                                        <asp:TextBox ID="txt_lichtrinh" TextMode="MultiLine" runat="server" class="form-control"></asp:TextBox>
                                    </div>--%>

                                    <div class="form-group">
                                        <label for="formota">Lịch trình :</label>
                                        <textarea id="txt_lichtrinh" class="ckeditor" runat="server"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="forbanggia">Bảng giá :</label>
                                        <asp:TextBox ID="txt_banggia" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <%--<div class="form-group">
                                        <label for="forthongtin">Thông tin liên quan :</label>
                                        <asp:TextBox ID="txt_thongtin" runat="server" class="form-control"></asp:TextBox>
                                    </div>--%>
                                    <div class="form-group">
                                        <label for="formota">Thông tin :</label>
                                        <textarea id="txt_thongtin" class="ckeditor" runat="server"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="foranh">Ảnh :</label>
                                        <asp:TextBox ID="txt_Anh" type="file" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <%--<div class="form-group">
                                        <label for="fortinhtrang">Tình trạng :</label>
                                        <asp:TextBox ID="txt_tinhtrang" runat="server" class="form-control"></asp:TextBox>
                                    </div>--%>

                                    <div class="form-group">
                                        <label for="fordiadiemkhoihanh">Địa điểm khởi hành :</label>
                                        <asp:TextBox ID="txt_diadiemkhoihanh" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <%--<div class="form-group">
                                        <label for="fordiemden">Mã điểm đến :</label>
                                        <asp:TextBox ID="txt_madiemden" runat="server" class="form-control"></asp:TextBox>
                                    </div>--%>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="formmessage">Tên điểm đến :</label>
                                            <asp:DropDownList ID="cbDiemDen" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="forthoiluong">Thời lượng :</label>
                                        <asp:TextBox ID="txt_thoiluong" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <%--<div class="form-group">
                                        <label for="forthoiluong">Mã khách Sạn :</label>
                                        <asp:TextBox ID="txt_makhachsan" runat="server" class="form-control"></asp:TextBox>
                                    </div>--%>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="formmessage">Tên Khách Sạn :</label>
                                            <asp:DropDownList ID="cbKhachSan" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="formmessage">Tên dịch vụ :</label>
                                            <asp:DropDownList ID="cbDichVu" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="forphuongtien">Phương tiện :</label>
                                        <asp:TextBox ID="txt_phuongtien" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="fornaycapnhat">Ngày đi :</label>
                                        <asp:TextBox ID="txt_NgayDi" runat="server" TextMode="Date" class="form-control" value="2000-01-01"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="formmessage">Tình trạng :</label>
                                            <asp:DropDownList ID="cbTinhTrang" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="forlienhe">Liên hệ :</label>
                                        <asp:TextBox ID="txt_lienhe" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="fornaycapnhat">Ngày cập nhật :</label>
                                        <asp:TextBox ID="txt_ngaycapnhat" runat="server" TextMode="Date" class="form-control" value="2000-01-01"></asp:TextBox>
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
