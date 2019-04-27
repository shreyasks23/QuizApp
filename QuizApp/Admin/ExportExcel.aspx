<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportExcel.aspx.cs" Inherits="QuizApp.Admin.ExportExcel" %>

<%@ Register Src="~/WUCHeader.ascx" TagName="WUCHeader" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Performance Matrix</title>
    <link href="CSS/MenuStyles.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Style.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
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
        function callPrint(data) {
            
            var prtContent = document.getElementById(data);
            var WinPrint = window.open('', '', 'left=70,top=100,width=200,height=200,toolbar=0,scrollbars=1,status=0');
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <Triggers>
                    <asp:PostBackTrigger ControlID="LBExport2Excel" />
                </Triggers>
                <ContentTemplate>
                    <table>
                        <tr>
                            <td>
                                <uc1:WUCHeader ID="WUCHeader1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="line-height: 25px; padding-right: 5px; text-align: right;"><a class="topLinkBtn" href="javascript:callPrint('PrintExcel');" style="color: #21549D; font-weight: bold;">Print</a> &nbsp; &nbsp; &nbsp;        
        <asp:LinkButton ID="LBExport2Excel" runat="server" class="topLinkBtn" Style="color: #21549D; font-weight: bold;" OnClick="LBExport2Excel_Click">Export to Excel</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td>
                                <div id="PrintExcel">
                                    <table border="0" cellpadding="3" cellspacing="0" style="border: solid 1px #ABCDEF; font-family: Verdana; font-size: 8pt; text-align: left;" width="100%">
                                        <tr>
                                            <td align="center" colspan="20" style="border-bottom: solid 1px #ABCDEF; font-family: Arial; font-size: 12pt; font-weight: bold; text-align: center;">Final Result Sheet</td>
                                        </tr>
                                        <tr>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Sl.<br />
                                                No.</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Emp ID</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Name</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Gender</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Tested On</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Age</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Location</th>

                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Empathy</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Leadership<br />
                                                Potential</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Emotions</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Confidence</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">sportsman<br />
                                                ship</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Relationship</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Ethics</th>

                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;" nowrap>Fear of
                                                <br />
                                                Failure</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Power</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Managing
                                                <br />
                                                Pressure</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Lack of
                                                <br />
                                                Self-Confidence</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Aggresiveness</th>
                                            <th style="border-right: solid 1px #ABCDEF; text-align: center;">Self
                                                <br />
                                                Efficacy</th>


                                        </tr>

                                        <asp:Repeater ID="Repeater1" runat="server" EnableViewState="false">
                                            <ItemTemplate>
                                                <tr>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;" ><%#DataBinder.Eval(Container.DataItem, "SlNo")%>
                                                    </td>
                                                    <td align="left" nowrap style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblEmployeeID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "EmployeeID")%>'></asp:Label></td>                                                        
                                                    <td align="left" nowrap style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblEmployeeName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Name")%>'></asp:Label></td>
                                                    <td align="left" nowrap style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblSex" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Gender")%>'></asp:Label></td>                                                         
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblTestDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CreatedOn") %>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblAge" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Age")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblLocation" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Location")%>'></asp:Label></td>  

                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblEmpathy" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Empathy")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblLeadership" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "LeadershipPotential")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblEmotions" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Emotions")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblConfidence" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Confidence")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblSportsmanShip" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "SportsmanShip")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblRelationship" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Relationship")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblEthics" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Ethics")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblFearOfFailure" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FearOfFailure")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblPower" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Power")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblManagingPressure" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ManagingPressure")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblLackOfConfidence" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "LackOfSelfConfidence")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblAggresive" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Aggressiveness")%>'></asp:Label></td>
                                                    <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                        <asp:Label ID="LblEfficacy" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "SelfEfficacy")%>'></asp:Label></td>
                                                    <%--<td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                <asp:Label ID="LblShuttleRun" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Agility")%>'></asp:Label></td>--%>
                                                    <%--<td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                <asp:Label ID="LblShuttleRunRessult" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "AgilityResult")%>'></asp:Label></td>
                                            <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                <asp:Label ID="LblFlexibility" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Flexibility")%>'></asp:Label></td>
                                            <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                <asp:Label ID="LblFlexibilityResult" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FlexibilityResult")%>'></asp:Label></td>
                                            <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                <asp:Label ID="LblSVJ" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "SVJ")%>'></asp:Label></td>
                                            <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                <asp:Label ID="LblSVJResult" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "SVJResult")%>'></asp:Label></td>
                                            <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                <asp:Label ID="LblEndurance" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Endurance")%>'></asp:Label></td>
                                            <td align="center" style="border-right: solid 1px #ABCDEF; border-top: solid 1px #ABCDEF;">
                                                <asp:Label ID="LblEnduranceResult" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "EnduranceResult")%>'></asp:Label></td>
                                            <td align="Right" style="border-top: solid 1px #ABCDEF; font-weight: bold;">
                                                <asp:Label ID="LblFitnessResultTotal" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "FitnessResultTotal")%>'></asp:Label></td>--%>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </td>
                        </tr>

                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </form>
</body>
</html>
