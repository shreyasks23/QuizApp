<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CR_Viewer.aspx.cs" Inherits="QuizApp.Admin.CR_Viewer" %>

<%@ Register Src="~/WUCHeader.ascx" TagName="WUCHeader" TagPrefix="uc1" %>


<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:WUCHeader ID="WUCHeader1" runat="server" Visible="false" />
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="text-align: center; vertical-align: top;">
                        <CR:crystalreportviewer id="CrystalReportViewer1" runat="server" autodatabind="true" hascrystallogo="False" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <asp:Label ID="LblMsg" runat="server" />&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
