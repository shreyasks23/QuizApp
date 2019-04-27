<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QuizApp.BasicInfo" %>

<%@ Register Src="~/WUCHeader.ascx" TagName="WUCHeader" TagPrefix="uc1" %>
<%@ Register Src="~/WUCFooter.ascx" TagName="WUCFooter" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pyschometric Test</title>
    <link href="CSS/MenuStyles.css" rel="stylesheet" type="text/css" />
    <link href="CSS/Style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/jquery-ui.css" />
    <script language="javascript" type="text/javascript">
        butID = "ImgCalender";
        function showCal(txtID, imgCal) {
            butID = imgCal.id;
            try {
                var dp = datePickerController.getDatePicker(txtID.id);
            }
            catch (err) {
                alert(err);
                return false;
            };
            if (!dp.visible) {
                datePickerController.hideAll(txtID.id);
                dp.show();
            } else {
                datePickerController.hideAll();
            };
        }

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
    </script>
    <script type="text/javascript" src="Content/datepicker.js"></script>
    <link href="Content/datepicker.css" rel="stylesheet" type="text/css" />
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server"/>
                            
            <table border="0" cellpadding="5" cellspacing="0" style=" text-align: left;" width="100%;">
                <tr>
                    <td>
                        <table border="0" cellpadding="5" cellspacing="0" style="background-color: #FFFFFF; text-align: left;" width="100%;">
                            <tr>
                                <td>
                                    <uc1:WUCHeader ID="WUCHeader1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:center"  cellpadding="2" cellspacing="1">
                                    <h1 style="font-family:'Times New Roman', Times, serif; font-style:italic">Welcome, </h1>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <marquee style="color:maroon; font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size:small ; font-style:oblique" ><strong>Greeting from Asha Wellness!</strong></marquee>
                                    <asp:Panel ID="PanelAdd" runat="server">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                        <table border="0" cellpadding="2" cellspacing="2" style="text-align: left; line-height: 35px; width: 100%; background-color:beige; font-size:medium">
                                            <tr>
                                                <td style="text-align:center; color:red" colspan="4">
                                                    <asp:Label ID="LblMsg" runat="server" ForeColor="#B71414" Visible="false"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 170px;">Name *</td>
                                                <td>
                                                    <asp:TextBox ID="TBName" runat="server" MaxLength="50" Width="200px" OnTextChanged="TBName_TextChanged" />
                                                    <asp:RequiredFieldValidator ID="RFVName" runat="server" ControlToValidate="TBName" ErrorMessage="*" Font-Size="10pt" ForeColor="Red" />
                                                </td>
                                                <td>Employee ID *</td>
                                                <td>
                                                    <asp:TextBox ID="TBEmpID" runat="server" CssClass="TBEnabled" MaxLength="15" />
                                                    <asp:RequiredFieldValidator ID="RFVEmpID" runat="server" ControlToValidate="TBEmpID" ErrorMessage="*" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>                                               
                                                <td>Date of Birth *</td>
                                                <td>
                                                    <asp:TextBox ID="TBDOB" runat="server" AutoPostBack="true" CssClass="w8em format-d-m-y highlight-days-67 range-high-today" MaxLength="10" Width="100px" OnTextChanged="TBDOB_TextChanged" />
                                                    <asp:Image ID="ImgCalender" runat="server" AlternateText="Calender" ImageAlign="AbsMiddle" ImageUrl="Images/Calender/Calender.gif" onclick="showCal(form1.TBDOB, this);" />
                                                    <asp:RequiredFieldValidator ID="RFVDOB" runat="server" ControlToValidate="TBDOB" ErrorMessage="*" Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVDOB" runat="server" ControlToValidate="TBDOB" Display="Dynamic" ErrorMessage="enter dd/mm/yyyy" Font-Size="X-Small" ForeColor="Red" ValidationExpression="^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((1[6-9]|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$" />
                                                    <asp:Label ID="LblAge" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="#B71414" />
                                                </td>
                                                <td>EMail Address</td>
                                                <td>
                                                    <asp:TextBox ID="TBEMail" runat="server" CssClass="TBEnabled" MaxLength="80" onkeyup="this.value=this.value.toLowerCase();" Width="150px" />
                                                    <asp:RegularExpressionValidator ID="REVEMail" runat="server" ControlToValidate="TBEMail" ErrorMessage="Enter valid E-Mail" Font-Bold="false" Font-Size="X-Small" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Gender *</td>
                                                <td>
                                                    <asp:RadioButton ID="RBMale" runat="server" Checked="true" GroupName="Sex" Text="Male" />
                                                    &nbsp;
                                                        <asp:RadioButton ID="RBFemale" runat="server" GroupName="Sex" Text="Female" />
                                                </td>
                                                <td style="width: 130px;">Location</td>
                                                <td style="width: 280px;">                                                    
                                                    <asp:DropDownList ID="DDLLocation" runat="server" Width="220px" Height="30px"    Font-Size="Medium" >                                                        
                                                        <asp:ListItem Text="Makino Training Centre,Bengaluru" Value="Makino Training Centre,Bengaluru" />
                                                        <asp:ListItem Text="Bengaluru" Value="Bengaluru" />
                                                         <asp:ListItem Text="Chennai" Value="Chennai" />
                                                         <asp:ListItem Text="Pune" Value="Pune" />
                                                         <asp:ListItem Text="Delhi" Value="Delhi" />
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RFVLocation" ControlToValidate="DDLLocation" runat="server" ErrorMessage="*" Font-Size="10pt" ForeColor="Red" />
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4 style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size: large; text-align: initial; text-decoration:underline">Instructions:-</h4>
                                    <p style="font-size:medium">
                                       1. Please fill the above fields to continue further.<br/>
                                       2. This test will evaluate your psychological aspects, please answer truthfully.<br />
                                       3. Minimum time required to answer will be 20-25 min.<br />
                                       4. Please take the test in a single attempt.<br />
                                       5. Test can be taken on mobile phones with good internet connectivity.
                                    </p>
                                </td>
                            </tr>                           
                            <tr>
                                <td style="text-align:center; font-size:medium">
                                    <asp:CheckBox ID="CBAgree" runat="server" Text="I Agree" OnCheckedChanged="CBAgree_CheckedChanged"/> &nbsp
                                    <asp:LinkButton ID="LBContinue" runat="server" OnClick="LBContinue_Click">Continue to Questionnaire</asp:LinkButton>
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
