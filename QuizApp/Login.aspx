<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QuizApp.Login" %>

<%@ Register Src="~/WUCFooter.ascx" TagName="WUCFooter" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link href="CSS/MenuStyles.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/jquery-ui.css" />
</head>
<body>

    <form id="form1" runat="server">
        <div style="height: 100%;" >
            <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server"/>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
            <table border="0" cellpadding="5" cellspacing="0" style="background-color: #FFFFFF; text-align: left;" width="100%;">               
                <tr>
                    
                    <td class="header" style="width:100%">Personality Test</td>
                    <td style="text-align: center; width: 150px;">
                        <img alt="ASHA WELLNESS" src="Images/Logo.jpg" onclick="www.ashahealth.com" />
                    </td>
                </tr>
                </table>
                 <table border="0" cellpadding="0" cellspacing="0" style="background-color: #FFFFFF;" width="100%" >
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0" style="background-color:#FFFFFF; height:100%;" width="100%">
                                                <tr>
                                                    <td colspan="4" class="loginHeader" style="font-size: 10pt;">L O G I N</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" class="errMsg">
                                                        <asp:Label ID="LblMsg" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="3" style="width: 40px;">&nbsp;</td>
                                                    <td style="line-height: 50px; width: 90px;">User ID :</td>
                                                    <td style="width: 230px;">
                                                        <asp:TextBox ID="TBUserID" runat="server" BackColor="#FFF7F9" MaxLength="50" Width="180px" />
                                                        <asp:RequiredFieldValidator ID="RFVUserID" ControlToValidate="TBUserID" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="10pt" /></td>
                                                    <td rowspan="3" style="width: 5px;">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="line-height: 50px;">Password :</td>
                                                    <td>
                                                        <asp:TextBox ID="TBPassword" runat="server" BackColor="#FFF7F9" MaxLength="50" TextMode="Password" Width="180px" />
                                                        <asp:RequiredFieldValidator ID="RFVPassword" ControlToValidate="TBPassword" runat="server" ErrorMessage="*" ForeColor="Red" Font-Size="10pt" /></td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td style="line-height: 50px;">
                                                        <asp:Button ID="BtnLogin" runat="server" Text=" Login " OnClick="BtnLogin_Click" Width="80px" />
                                                        &nbsp; &nbsp; &nbsp; 
        <asp:Button ID="BtnCancel" runat="server" Text="Cancel"  CausesValidation="false" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" style="line-height: 30px;">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                    </td>
                </tr>                
            </table>
           </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <%--<div id="fixed-bottom" style="align-self:baseline">
            <uc1:WUCFooter ID="WUCFooter1" runat="server" />
        </div>--%>
    </form>
    <footer>
        <div>
            <uc1:WUCFooter ID="WUCFooter2" runat="server" />
        </div>
    </footer>
</body>
    
</html>
