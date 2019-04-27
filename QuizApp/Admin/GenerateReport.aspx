<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenerateReport.aspx.cs" Inherits="QuizApp.Admin.GenerateReport" %>

<%@ Register Src="~/WUCHeader.ascx" TagName="WUCHeader" TagPrefix="uc1" %>
<%@ Register Src="~/WUCFooter.ascx" TagName="WUCFooter" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <link href="~/CSS/MenuStyles.css" rel="stylesheet" type="text/css" />
    <link href="~/CSS/Style.css" rel="stylesheet" type="text/css" />
    <script language="Javascript" type="text/javascript">

        function isNumberKey(evt, needPeriod) {
            var charCode = ((evt.which) ? evt.which : event.keyCode);
            if (needPeriod == "yes") {
                if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46)
                    return false;
            }
            else {
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
            }
            return true;
        }

        function openWindow(sid) {
            window.open('SingleReport.aspx?SID=' + sid, 'Report', ' width=1024, height=680, left=0, top=0, status=yes, resizable=yes, scrollbars=yes');
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server" />
            <table border="0" cellpadding="5" cellspacing="0" style="text-align: left;" width="100%;">
                <tr>
                    <td>
                        <table border="0" cellpadding="5" cellspacing="0" style="background-color: #FFFFFF; text-align: left;" width="100%;">
                            <tr>
                                <td>
                                    <uc1:WUCHeader ID="WUCHeader1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center" cellpadding="2" cellspacing="1">
                                    <h1 style="font-family: 'Times New Roman', Times, serif; font-style: italic">Welcome, </h1>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <marquee style="color: maroon; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: small; font-style: oblique"><strong>Greeting from Asha Wellness!</strong></marquee>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Panel ID="PanelSearch" runat="server">
                                                <table border="0" cellpadding="1" cellspacing="0" style="text-align: left; line-height: 35px; width: 100%;" class="titleTable">
                                                    <tr>
                                                        <td class="errMsg" colspan="5">
                                                            <asp:Label ID="LblMsg" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td rowspan="5" style="width: 80px;">&nbsp;</td>
                                                        <td style="width: 130px;">Location</td>
                                                        <td style="width: 300px;">
                                                            <asp:DropDownList ID="DDLLocation" runat="server" AutoPostBack="true" />
                                                            <asp:RequiredFieldValidator ID="RFVLocationName" ControlToValidate="DDLLocation" runat="server" ErrorMessage="*" Font-Size="10pt" ForeColor="Red" /></td>
                                                        <td style="width: 130px;">Date</td>
                                                        <td>
                                                            <asp:DropDownList ID="DDLDates" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Name</td>
                                                        <td>
                                                            <asp:TextBox ID="TBEmployeeName" runat="server" MaxLength="50" Width="200px" />
                                                        </td>
                                                        <td>Employee ID</td>
                                                        <td>
                                                            <asp:TextBox ID="TBEmployeeID" runat="server" MaxLength="50" Width="100px" />
                                                        </td>
                                                        </td>
                                                    </tr>
                                                    <tr>

                                                        <td style="line-height: 80px; align-content: center" colspan="4">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                                                <asp:Button ID="BtnSubmit" runat="server" Text=" Search " OnClick="BtnSubmit_Click" Width="110px" />
                                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                                                
        <asp:Button ID="BtnClear" runat="server" Text="Clear" CausesValidation="false" Width="100px" OnClick="BtnClear_Click" />
                                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
        <asp:Button ID="BtnPDFReport" runat="server" Text=" PDF Reports " Width="120px" OnClick="BtnFullReport_Click" /></td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td class="errMsg">
                                    <asp:Label ID="LblCount" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="border: Solid 0px #DDDDDD; text-align: center; width: 100%;">
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <td align="center">
                                                            <asp:GridView ID="GVStudentProfile" runat="server" AllowPaging="true" AutoGenerateColumns="false" DataKeyNames="ID" PageSize="15" ShowFooter="false" UseAccessibleHeader="true" OnPageIndexChanging="GVStudentProfile_PageIndexChanging" OnRowCommand="GVStudentProfile_RowCommand" OnRowDataBound="GVStudentProfile_RowDataBound" Width="100%">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" />
                                                                    <asp:TemplateField HeaderText="Employee ID" HeaderStyle-Width="200px" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Company Name" HeaderStyle-Width="150px" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LblEmployeeName" runat="server" Text='<%# Bind("CompanyName") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Location" HeaderStyle-Width="120px" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LblLocation" runat="server" Text='<%# Bind("Location") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Employee Name" HeaderStyle-Width="200px" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <a href="#" class="topLinkBtn" onclick='openWindow("<%# Eval("EmployeeID") %>");' style="font-weight: bold;"><%#DataBinder.Eval(Container.DataItem, "Name")%></a>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Age" HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LblAge" runat="server" Text='<%# Bind("Age") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Gender" HeaderStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LblSex" runat="server" Text='<%# Bind("Gender") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ShowHeader="False" HeaderStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <a href="#" class="topLinkBtn" onclick='openWindow("<%# Eval("EmployeeID") %>");' style="font-weight: bold;">Report</a>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <AlternatingRowStyle BackColor="#FFEAEA" />
                                                                <RowStyle BackColor="#E1F5FF" />
                                                                <SelectedRowStyle Font-Bold="True" />
                                                                <PagerStyle BackColor="#0070A6" ForeColor="White" HorizontalAlign="Center" />
                                                                <HeaderStyle BackColor="#0070A6" ForeColor="White" Font-Size="8pt" HorizontalAlign="Left" />
                                                                <EditRowStyle BackColor="#2461BF" />
                                                                <SelectedRowStyle BackColor="#E6E6E6" Font-Bold="True" ForeColor="#333333" />
                                                                <EmptyDataTemplate>
                                                                    <table style="border: Solid 0px #DDDDDD; text-align: center; width: 100%;">
                                                                        <tr>
                                                                            <td style="border-right: Solid 1px #DDDDDD; width: 100%;">No details available.</td>
                                                                        </tr>
                                                                    </table>
                                                                </EmptyDataTemplate>
                                                            </asp:GridView>
                                                            <br />
                                                        </td>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <uc1:WUCFooter ID="WUCFooter1" runat="server" />
                                </td>
                            </tr>
                        </table>
        </div>
    </form>
</body>
</html>
