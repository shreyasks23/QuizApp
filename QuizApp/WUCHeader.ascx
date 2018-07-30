<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WUCHeader.ascx.cs" Inherits="QuizApp.WUCHeader" %>
<asp:UpdateProgress ID="updateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
    <ProgressTemplate>
        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/images/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." style="padding: 0px; position:fixed; top:45%; left:50%;" />
</div>
    </ProgressTemplate>
    </asp:UpdateProgress>
<table border="0" cellpadding="0" cellspacing="0" style="background-color: #FFFFFF; text-align: left;" width="1004px">
<tr>
    <td>
<table border="0" cellpadding="0" cellspacing="0" style="text-align: center;" width="100%">
  <tr>
    <td valign="top">
<table border="0" cellpadding="3" cellspacing="0" width="100%">
   <tr>
    <td valign="top">
<table border="0" cellpadding="3" cellspacing="0" style="text-align: left; width: 100%">
  <tr>
    <td><asp:Label ID="LblUserName" runat="server" CssClass="userName" /></td>
  </tr>
</table>
    </td>
  </tr>
  <tr>
    <td class="header">Pyschological Test</td>
  </tr>
</table>
    </td>
    <td style="text-align: center; width: 150px;"><img alt="ASHA WELLNESS" src="Images/Logo.jpg" style="vertical-align: middle;" /></td>
  </tr>
</table>
    </td>
  </tr>
  <tr>
    <td align="center" nowrap>
<div id='cssmenu'>
<ul>
    <li><a href='Default.aspx'><span>Home</span></a></li>
<%if (!IsUser) {%>
             <li><a href='SportsInfo.aspx'><span>Basic Information.</span></a></li>         
      
<%} %>    
    <li class='has-sub'><a href='#'><span>Reports</span></a>        
    </li>
<%if (!IsUser) {%>
   
	<li class='has-sub'><a href="#"><span>Settings</span></a>
        <ul>
            <li><a href="ChangePassword.aspx" target="_self"><span> Change Password </span></a></li>
        </ul>
	</li>
<%} %>
    <li class='last'><asp:LinkButton ID="LBLogout" runat="server" OnClick="LBLogout_Click" CausesValidation="False" OnClientClick="form1.target='_self'">Logout</asp:LinkButton></li>
</ul>
</div>
    </td>
  </tr>
</table>