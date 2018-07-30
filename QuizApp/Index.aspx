<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QuizApp.Index" %>

<%@ Register Src="~/WUCHeader.ascx" TagName="WUCHeader" TagPrefix="uc1" %>
<%@ Register Src="~/WUCFooter.ascx" TagName="WUCFooter" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pyschological Test</title>
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
    <style type="text/css">
        .auto-style2 {
            height: 37px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <table>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" style="background-color: #FFFFFF; text-align: left;" width="1004px;">
                            <tr>
                                <td>
                                    <uc1:WUCHeader ID="WUCHeader1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" />
                                    <asp:Panel ID="PanelAdd" runat="server">
                                        <table border="0" cellpadding="1" cellspacing="0" style="text-align: left; line-height: 35px; width: 100%;">
                                            &nbsp
                                <tr>
                                    <td style="width: 170px;">Name *</td>
                                    <td>
                                        <asp:TextBox ID="TBName" runat="server" MaxLength="50" Width="200px" />
                                        <asp:RequiredFieldValidator ID="RFVName" ControlToValidate="TBName" runat="server" ErrorMessage="*" Font-Size="10pt" ForeColor="Red" /></td>
                                    <td style="width: 130px;">Date</td>
                                    <td style="width: 280px;">
                                        <asp:Label ID="LblDate" runat="server" /></td>
                                </tr>
                                            <tr>
                                                <td>Date of Birth *</td>
                                                <td>
                                                    <asp:TextBox ID="TBDOB" AutoPostBack="true" CssClass="w8em format-d-m-y highlight-days-67 range-high-today" MaxLength="10" OnTextChanged="TBDOB_TextChanged" runat="server" Width="85px" />
                                                    <asp:Image ID="ImgCalender" runat="server" AlternateText="Calender" ImageAlign="AbsMiddle" ImageUrl="Images/Calender/Calender.gif" onclick="showCal(form1.TBDOB, this);" />
                                                    <asp:RequiredFieldValidator ID="RFVDOB" runat="server" ErrorMessage="*" Font-Size="10pt" ForeColor="Red" ControlToValidate="TBDOB"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REVDOB" runat="server" ControlToValidate="TBDOB" ErrorMessage="enter dd/mm/yyyy" Font-Size="X-Small" ForeColor="Red" Display="Dynamic" ValidationExpression="^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((1[6-9]|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$" />
                                                    <asp:Label ID="LblAge" runat="server" Font-Size="Medium" Font-Bold="true" ForeColor="#B71414" /></td>
                                                <td>EMail Address</td>
                                                <td>
                                                    <asp:TextBox ID="TBEMail" runat="server" CssClass="TBEnabled" MaxLength="80" onkeyup="this.value=this.value.toLowerCase();" Width="200px" />
                                                    <asp:RegularExpressionValidator ID="REVEMail" runat="server" Font-Bold="false" Font-Size="X-Small" ForeColor="Red" ControlToValidate="TBEMail" ErrorMessage="Enter valid E-Mail Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Gender *</td>
                                                <td>
                                                    <asp:RadioButton ID="RBMale" runat="server" Checked="true" GroupName="Sex" Text="Male" />
                                                    &nbsp; 
                                        <asp:RadioButton ID="RBFemale" runat="server" GroupName="Sex" Text="Female" />
                                                </td>
                                                <td>Phone No.</td>
                                                <td>
                                                    <asp:TextBox ID="TBPhone" runat="server" CssClass="TBEnabled" MaxLength="15" onkeypress="return isNumberKey(event)" />
                                                    <asp:RegularExpressionValidator ID="REVPhone" runat="server" ControlToValidate="TBPhone" ErrorMessage="Enter Only Numbers" Font-Size="X-Small" ValidationExpression="[0-9]*" /></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="PanelQuestionnaire" runat="server" Visible="false">
                                        <table border="0" cellpadding="1" cellspacing="1" style="text-align: left; line-height: 35px; width: 100%;">
                                            <tr>
                                                <td style="text-align: center; line-height: 30px; font-weight: bold">Questionnaire </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>1.</b>
                                                    <strong><em>I take time out for others.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RBLOptions" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>2.</b>
                                                    <strong><em>I know that I am not a special person.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>3.</b>
                                                    <strong><em>I take control of things.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>4.</b>
                                                    <strong><em>I try to forgive and forget.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>5.</b>
                                                    <strong><em>I keep in the background.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>6.</b>
                                                    <strong><em>I can't do without the company of others.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>7.</b>
                                                    <strong><em>I trust others.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>8.</b>
                                                    <strong><em>I am not easily frustrated.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList7" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>9.</b>
                                                    <strong><em>I cheer people up.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList8" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>10.</b>
                                                    <strong><em>I often feel uncomfortable around others.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList9" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>11.</b>
                                                    <strong><em>I seldom feel blue.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList10" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>12.</b>
                                                    <strong><em>I dislike myself.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList11" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>13.</b>
                                                    <strong><em>I take charge.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList12" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>14.</b>
                                                    <strong><em>I let others make the decisions.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList13" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>15.</b>
                                                    <strong><em>I believe in the importance of art.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList14" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>16.</b>
                                                    <strong><em>I like to get lost in thought.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList15" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>17.</b>
                                                    <strong><em>I wait for others to lead the way.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList16" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>18.</b>
                                                    <strong><em>I am willing to talk about myself.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList17" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>19.</b>
                                                    <strong><em>I find it difficult to approach others.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList18" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>20.</b>
                                                    <strong><em>I enjoy my privacy.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList19" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>21.</b>
                                                    <strong><em>I swim against the current.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList20" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>22.</b>
                                                    <strong><em>I feel guilty when I say "no."</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList21" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>23.</b>
                                                    <strong><em>I am hard to get to know.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList22" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>24.</b>
                                                    <strong><em>I don't talk a lot.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList23" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>25.</b>
                                                    <strong><em>I believe in one true religion.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList24" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>26.</b>
                                                    <strong><em>I am not easily annoyed.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList25" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>27.</b>
                                                    <strong><em>I feel crushed by setbacks.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList26" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>28.</b>
                                                    <strong><em>I am afraid that I will do the wrong thing.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList27" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>29.</b>
                                                    <strong><em>I enjoy being part of a loud crowd.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList28" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>30.</b>
                                                    <strong><em>I weigh the pros against the cons.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList29" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>31.</b>
                                                    <strong><em>I do unexpected things.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList30" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>32.</b>
                                                    <strong><em>I get angry easily.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList31" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>33.</b>
                                                    <strong><em>I am quiet around strangers.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList32" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>34.</b>
                                                    <strong><em>I don't mind eating alone.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList33" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>35.</b>
                                                    <strong><em>I make people feel at ease.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList34" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>36.</b>
                                                    <strong><em>I use my brain.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList35" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>37.</b>
                                                    <strong><em>I have a good word for everyone.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList36" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>38.</b>
                                                    <strong><em>I feel desperate.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList37" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>39.</b>
                                                    <strong><em>I want to be in charge.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList38" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>40.</b>
                                                    <strong><em>I feel comfortable around people.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList39" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>41.</b>
                                                    <strong><em>I am the life of the party.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList40" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>42.</b>
                                                    <strong><em>I don't let others discourage me.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList41" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>43.</b>
                                                    <strong><em>I enjoy being part of a group.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList42" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>44.</b>
                                                    <strong><em>I love to daydream.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList43" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>45.</b>
                                                    <strong><em>I distrust people.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList44" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>46.</b>
                                                    <strong><em>I worry about things.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList45" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>47.</b>
                                                    <strong><em>I am not easily bothered by things.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList46" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>48.</b>
                                                    <strong><em>I respect authority.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList47" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>49.</b>
                                                    <strong><em>I do things that others find strange.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList48" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>50.</b>
                                                    <strong><em>I skip difficult words while reading.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList49" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>51.</b>
                                                    <strong><em>I feel comfortable with myself.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList50" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>52.</b>
                                                    <strong><em>I am exacting in my work.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList51" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>53.</b>
                                                    <strong><em>I tend to analyze things.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList52" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>54.</b>
                                                    <strong><em>I continue until everything is perfect.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList53" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>55.</b>
                                                    <strong><em>I believe that people are basically moral.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList54" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>56.</b>
                                                    <strong><em>I am quick to judge others.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList55" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr><tr>
                                                <td>
                                                    <b>57.</b>
                                                    <strong><em>I am relaxed most of the time.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList56" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>58.</b>
                                                    <strong><em>I enjoy silence.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList57" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>59.</b>
                                                    <strong><em>I show my feelings.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList58" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>60.</b>
                                                    <strong><em>I judge people by their appearance.</em></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: justify; line-height: 5px;">
                                                    <asp:RadioButtonList ID="RadioButtonList59" runat="server" RepeatDirection="Horizontal" CellPadding="4" CellSpacing="2" Width="100%">
                                                        <asp:ListItem Text="Strongly Disagree" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Disagree" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Niether Agree nor Disagree" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Agree" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Strongly Agree" Value="5"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
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
