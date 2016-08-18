<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="unpaidReportUI.aspx.cs" Inherits="diagnostic_center_proj.UI.unpaidReportUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unpaid Bill Report</title>
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
            <legend>Unpaid Bill Report</legend>

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
                        <asp:Button ID="unpaidBillButton" runat="server" Text="Show" OnClick="testReportButton_Click" /></td>
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

            <asp:GridView ID="unpaidBillReportGridView" runat="server" AutoGenerateColumns="false" CssClass="center-table" Visible="false" OnRowDataBound="unpaidBillReportGridView_RowDataBound" ShowFooter="true">

                <Columns>

                    <asp:TemplateField HeaderText="Sl.No"></asp:TemplateField>
                    <asp:BoundField DataField="BillNO" HeaderText="Bill No" />
                    <asp:BoundField DataField="MobileNo" HeaderText="Contact No" />
                    <asp:BoundField DataField="PatientName" HeaderText="Paitent Name" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" />
                    <asp:BoundField DataField="PaidAmount" HeaderText="Paid Amount" />

                    <%--<asp:TemplateField HeaderText="SL" HeaderStyle-CssClass="table-bg">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Bill NO" HeaderStyle-CssClass="table-bg">
                        <ItemTemplate>
                            <%# Eval("BillNO") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Contact No" HeaderStyle-CssClass="table-bg">
                        <ItemTemplate>
                            <%# Eval("MobileNo") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Patient Name" HeaderStyle-CssClass="table-bg">
                        <ItemTemplate>
                            <%# Eval("PatientName") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total Amount" HeaderStyle-CssClass="table-bg">
                        <ItemTemplate>
                            <%# Eval("TotalAmount") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Paid Amount" HeaderStyle-CssClass="table-bg">
                        <ItemTemplate>
                            <%# Eval("PaidAmount") %>
                        </ItemTemplate>
                    </asp:TemplateField>--%>

                </Columns>
            </asp:GridView>

            <asp:Button ID="unpaidBillPDFButton" runat="server" Text="PDF" OnClick="unpaidBillPDFButton_Click" Visible="false" />

            
            <a href="Default.aspx" style="display: inline-block; margin-top: 20px; clear: both; float: right;">Back</a>
        </div>

    </form>
</body>
</html>
