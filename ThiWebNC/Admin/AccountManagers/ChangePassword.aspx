<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ThiWebNC.Admin.AccountManagers.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Change Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="..\Template\assets\images\favicon.ico" />

    <!-- Bootstrap Css -->
    <link href="..\Template\css\bootstrap.min.css" id="bootstrapstyle" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="..\Template\css\icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="..\Template\css\app.min.css" id="appstyle" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="account-pages my-5 pt-sm-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card overflow-hidden">
                            <div class="bg-soft-primary">
                                <div class="row">
                                    <div class="col-7">
                                        <div class="text-primary p-4">
                                            <h5 class="text-primary">Change Password</h5>
                                            <p>Change</p>
                                        </div>
                                    </div>
                                    <div class="col-5 align-self-end">
                                        <img src="..\Template\images\profile-img.png" alt="" class="img-fluid"/>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body pt-0"> 
                            <div>
                                    <a href="#">
                                        <div class="avatar-md profile-user-wid mb-4">
                                            <span class="avatar-title rounded-circle bg-light">
                                                <img src="..\Template\images\logo.svg" alt="" class="rounded-circle" height="34"/>
                                            </span>
                                        </div>
                                    </a>
                                </div>
                                <div class="p-2">
                                    <asp:Panel ID="pnthongbao" runat="server" class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <i class="mdi mdi-block-helper mr-2"></i>
                                                Đổi mật khẩu thất bại ! Vui lòng thử lại
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                        </asp:Panel>
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label for="useremail">Username : </label>
                                            <asp:TextBox ID="txtusername" runat="server" class="form-control"></asp:TextBox>        
                                        </div>
                
                                        <div class="form-group">
                                            <label for="username">Password : </label>
                                            <asp:TextBox ID="txtpass1" runat="server" class="form-control" TextMode="Password" ></asp:TextBox>
                                        </div>
                
                                        <div class="form-group">
                                            <label for="userpassword">Password : </label>
                                            <asp:TextBox ID="txtpass2" runat="server" class="form-control" TextMode="Password"></asp:TextBox>       
                                        </div>
                                        
                                        
                                        <%--<div class="form-group">
                                             <label class="d-block mb-3">Phân quyền :</label>
                                             <div class="custom-control custom-radio custom-control-inline">
                                                    <asp:RadioButton ID="rbAdmin" runat="server"  GroupName="radioRole" Checked="true" Height="30px" style="margin-right:10px; margin-left:50px" />Administrator
                                             </div>
                                             <div class="custom-control custom-radio custom-control-inline">
                                                    <asp:RadioButton ID="rbUser" runat="server" GroupName="radioRole" Height="30px" style="margin-right:9px"/>User
                                             </div>
                                        </div>--%>

                                        <div class="mt-4">
                                            <asp:Button ID="btnChange" runat="server" Text="Change" class="btn btn-primary btn-block waves-effect waves-light"  />
                                        </div>
                
                                        <div class="mt-4 text-center">
                                            <p class="mb-0">By registering you agree to the Du lịch  <a href="#" class="text-primary">Terms of Use</a></p>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="mt-5 text-center">
                            
                            <div>
                                <p>Already have an account ? <a href="Login.aspx" class="font-weight-medium text-primary"> Login</a> </p>
                            </div>
                        </div>

                    </div>
                </div>
                </div>
            </div>
    </form>
    <!-- JAVASCRIPT -->
        <script src="..\Template\libs\jquery\jquery.min.js"></script>
        <script src="..\Template\libs\bootstrap\js\bootstrap.bundle.min.js"></script>
        <script src="..\Template\libs\metismenu\metisMenu.min.js"></script>
        <script src="..\Template\libs\simplebar\simplebar.min.js"></script>
        <script src="..\Template\libs\node-waves\waves.min.js"></script>
        
        <!-- App js -->
        <script src="..\Template\assets\js\app.js"></script>
</body>
</html>
