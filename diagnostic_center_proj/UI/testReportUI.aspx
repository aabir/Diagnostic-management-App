<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testReportUI.aspx.cs" Inherits="diagnostic_center_proj.UI.testReportUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Wise Report</title>
    <style>
        .center-div { margin: 0 auto; width: 50% }
        .center-table { margin: 0 auto; width: 100%; }
        .center-table-halfwidth { margin: 50px auto 0; width: 50%; }
        .table-bg { background: #ccc; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <fieldset class="center-div">
            <legend>Test Wise Report</legend>

            <table>
                <tr>
                    <td>
                        <asp:Label ID="fromDateLabel" runat="server" Text="From Date"></asp:Label></td>
                    <td><input type="date" id="fromDateTextBox" runat="server" value="DD-MM-YYYY" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="toDateReportLabel" runat="server" Text="To Date"></asp:Label></td>
                    <td><input type="date" id="toDateTextBox" runat="server" value="DD-MM-YYYY" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="testReportButton" runat="server" Text="Show" OnClick="testReportButton_Click" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </fieldset>
    </div>

        <div style="margin: 50px auto 0; width: 52%">

            <asp:GridView ID="testReportGridView" runat="server" AutoGenerateColumns="false" CssClass="center-table" Visible="false">

                <Columns>
                    <asp:TemplateField HeaderText="SL" HeaderStyle-CssClass="table-bg">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Test Name" HeaderStyle-CssClass="table-bg">
                        <ItemTemplate>
                            <%# Eval("TestName") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total Test" HeaderStyle-CssClass="table-bg">
                        <ItemTemplate>
                            <%# Eval("TestCount") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total Amount" HeaderStyle-CssClass="table-bg">
                        <ItemTemplate>
                            <%# Eval("TotalFee") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <table style="float: right; width: 84%; ">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Label ID="superTotalLabel" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="superTotalValue" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </td>
                </tr>

            </table>

            <a href="Default.aspx" style="display: inline-block; margin-top: 20px; clear: both; float: right;">Back</a>
        </div>

    </form>
</body>
</html>
