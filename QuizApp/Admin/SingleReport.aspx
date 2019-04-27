<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SingleReport.aspx.cs" Inherits="QuizApp.Admin.SingleReport" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report</title>
    <link href="CSS/Style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function callPrint(data) {
            
            var prtContent = document.getElementById(data);
            var WinPrint = window.open('', '', 'left=70,top=100,width=200,height=200,toolbar=0,scrollbars=1,status=0',);
            WinPrint.document.write(prtContent.innerHTML);           
                setTimeout(function () { // wait until all resources loaded 
                    WinPrint.document.close(); // necessary for IE >= 10
                    WinPrint.focus(); // necessary for IE >= 10
                    WinPrint.print();  // change window to winPrint
                    WinPrint.close();// change window to winPrint
                }, 250);          
            
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="600" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <table border="0" cellpadding="5" cellspacing="0" style="background-color: #FFFFFF; border: solid 1px #CCCCCC; text-align: left;" width="100%">
                        <tr>
                            <td colspan="3" style="padding-right: 30px; text-align: right;">
                                <asp:Label ID="LblErr" Text="" runat="server" Visible="false" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="topLinkBtn" href="javascript:callPrint('divReport');" style="color: #21549D; font-weight: bold;">Print</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
        <a class="topLinkBtn" href="javascript: window.close();" style="color: #21549D; font-weight: bold;">Close</a><br />
                            </td>
                        </tr>
                       </table>
                    <div id="divReport" runat="server">
                    <table  border="0" cellpadding="5" cellspacing="0" style="background-color: #FFFFFF; border: solid 1px #CCCCCC; text-align: left;" width="100%">
                        <tr>                          
                            <td align="center" style="font-family: Arial; font-size: 14pt; font-weight: bold;">
                                <span style="font-size: 24pt;">Makino India Private Ltd.</span><br />
                                <br />
                                <span style="font-size: 16pt;">Psychometry Report</span></td>
                            <td align="right" style="width: 150px;">
                                <img alt="" src="../Images/MakinoLogo.jpg" height="80" style="width: 130px;" /></td>
                        </tr> 
                            </tr>
                            <tr>
                                <td colspan="5" style="border-bottom: solid 1px #ABCDEF;">
                                    <table border="0" cellpadding="5" cellspacing="5" style="font-size: 12pt;" width="100%">
                                        <tr>
                                            <td colspan="3" style="font-weight: bold; text-decoration: underline;">BASIC INFO</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 45%;">Name :
                                                <asp:Label ID="LblName" runat="server" />
                                            </td>
                                            <td colspan="2">Employee ID :
                                                <asp:Label ID="LblEmployeeID" runat="server" />
                                            </td>
                                        </tr>                                       
                                        <tr>
                                            <td>Location :
                                                <asp:Label ID="LblLocation" runat="server" />
                                            </td>
                                            <td colspan="2">Company Name :
                                                <asp:Label ID="LblCompanyName" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Email Address :
                                                <asp:Label ID="LblEmail" runat="server" />
                                            </td>
                                            <td>Age :
                                                <asp:Label ID="LblAge" runat="server" />
                                            </td>
                                            <td>Gender :
                                                <asp:Label ID="LblGender" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Date of Birth :
                                                <asp:Label ID="LblDOB" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="Center" colspan="5" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size:larger">This Psychometric test is developed to assess 13 parameters related to behavior in the scale of 1-5
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="4"><span style="font-size: 24pt;">Psychological Analysis Graph </span></td>
                            </tr>
                            <tr>
                                <td colspan="4" style="align-content: center">
                                    <div id="ChartDiv">
                                        <table border="0" cellpadding="5" cellspacing="0" style="background-color: #FFFFFF; text-align: left;" width="100%">
                                            <tr>
                                                <td align="Center">
                                                    <asp:Chart ID="Chart1" runat="server" Height="500px" ImageStorageMode="UseImageLocation" Width="800px">                                                        
                                                        <Series>
                                                            <asp:Series ChartArea="ChartArea1" Name="Default" />
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="4"><em><u>Powered By: Asha Wellness Services Pvt Ltd</u></em> </td>
                            </tr>                        
                    </table>
                        </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
