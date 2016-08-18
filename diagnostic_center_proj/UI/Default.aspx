<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="diagnostic_center_proj.UI.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to Diagnostic Center</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Welcome to Diagnostic Center Bill Management APP</h1>
        <ul>
            <li><a href="testTypeEntryUI.aspx">Test Type Entry</a></li>
            <li><a href="testSetupEntryUI.aspx">Test Setup Entry</a></li>
            <li><a href="testRequestEntryUI.aspx">Test Request Entry</a></li>
            <li><a href="paymentEntryUI.aspx">Payment Entry</a></li>
        </ul>
        <ul>
            <h3>Report</h3>
            <li><a href="testReportUI.aspx">Test Wise Report</a></li>
            <li><a href="typeReportUI.aspx">Type Wise Report</a></li>
            <li><a href="unpaidReportUI.aspx">Unpaid Bill Report</a></li>
        </ul>
    </div>
    </form>
</body>
</html>
