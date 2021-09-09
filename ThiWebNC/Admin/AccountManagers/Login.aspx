<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ThiWebNC.Admin.AccountManagers.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description"/>
        <meta content="Themesbrand" name="author"/>
        <!-- App favicon -->
        <link rel="shortcut icon" href="..\Template\images\favicon.ico"/>

        <!-- Bootstrap Css -->
        <link href="..\Template\css\bootstrap.min.css" id="bootstrapstyle" rel="stylesheet" type="text/css"/>
        <!-- Icons Css -->
        <link href="..\Template\css\icons.min.css" rel="stylesheet" type="text/css"/>
        <!-- App Css-->
        <link href="..\Template\css\app.min.css" id="appstyle" rel="stylesheet" type="text/css"/>
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
                                            <h5 class="text-primary">Welcome Back !</h5>
                                            <p>Login</p>
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
                                    <div class="form-horizontal">
                                        <asp:Panel ID="pnthongbao" runat="server" class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <i class="mdi mdi-block-helper mr-2"></i>
                                                Tài khoản hoặc mật khẩu không chính xác!
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                        </asp:Panel>
                                        <div class="form-group">
                                            <label for="username">Username</label>
                                            <asp:TextBox ID="txtusername" runat="server" type="text" class="form-control"></asp:TextBox>
                                        </div>
                
                                        <div class="form-group">
                                            <label for="userpassword">Password</label>
                                            <asp:TextBox ID="txtpassword" runat="server" type="password" Cssclass="form-control"></asp:TextBox>
                                        </div>
                
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customControlInline"/>
                                            <label class="custom-control-label" for="customControlInline">Remember me</label>
                                        </div>
                                        
                                        <div class="mt-3">
                                            <asp:Button ID="btnLogin" runat="server" Text="Login" Cssclass="btn btn-primary btn-block waves-effect waves-light" OnCommand="btn_Login" />
                                        </div>
        

                                        <div class="mt-4 text-center">
                                            <a href="auth-recoverpw.html" class="text-muted"><i class="mdi mdi-lock mr-1"></i> Forgot your password?</a>
                                        </div>
                                    </div>
                                </div>
            
                            </div>
                        </div>
                        <div class="mt-5 text-center">
                            <div>
                                <p>Don't have an account ? <a href="Register.aspx" class="font-weight-medium text-primary"> Sign up now </a> </p>
                                
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
        <script src="..\Templatelibs\metismenu\metisMenu.min.js"></script>
        <script src="..\Template\libs\simplebar\simplebar.min.js"></script>
        <script src="..\Template\libs\node-waves\waves.min.js"></script>
        
        <!-- App js -->
        <script src="..\Template\js\app.js"></script>
</body>
</html>
