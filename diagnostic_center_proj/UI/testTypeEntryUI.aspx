<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testTypeEntryUI.aspx.cs" Inherits="diagnostic_center_proj.UI.test_type_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Type Entry</title>
    <style>
        .center-div { margin: 0 auto; width: 50% }
        .center-table { margin: 0 auto; width: 100%; }
        .table-bg { background: #ccc; }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <fieldset class="center-div">
            <legend>Test Type Setup</legend>
            <table>
                <tr>
                    <td>Type Name</td>
                    <td>  
                        <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Label ID="messageLabel" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" /></td>
                </tr>
            </table>
        </fieldset>

    <div style="margin: 50px auto 0; width: 52%">
        <asp:GridView ID="showAllTestType" runat="server" AutoGenerateColumns="false" CssClass="center-table">
            <Columns>
                <asp:TemplateField HeaderText="SL #" HeaderStyle-CssClass="table-bg">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Type Name" HeaderStyle-CssClass="table-bg">
                    <ItemTemplate>
                        <%# Eval("Name") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>

        <a href="Default.aspx" style="display: inline-block; margin-top: 20px; float: right;">Back</a>

    </div>
    </form>
</body>
</html>
