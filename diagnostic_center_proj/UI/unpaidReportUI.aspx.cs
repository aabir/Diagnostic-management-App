using System;
using System.Collections.Generic;
using System.Linq;
using diagnostic_center_proj.Models;
using diagnostic_center_proj.BLL;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.UI;

namespace diagnostic_center_proj.UI
{
    public partial class unpaidReportUI : System.Web.UI.Page
    {
        ReportManager reportManager = new ReportManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void testReportButton_Click(object sender, EventArgs e)
        {
            if (fromDateTextBox.Value == string.Empty || toDateTextBox.Value == string.Empty)
            {
                messageLabel.Text = "Please select both date.";
                return;
            }

            DateTime fromDate = Convert.ToDateTime(fromDateTextBox.Value);
            DateTime toDate = Convert.ToDateTime(toDateTextBox.Value);

            List<Report> ReportList = reportManager.GetUnpaidBillReport(fromDate, toDate);

            if (ReportList.Count != 0)
            {
                decimal totalAmount = ReportList.Sum(item => item.TotalAmount);
                decimal paidAmount = ReportList.Sum(item => item.PaidAmount);

                unpaidBillPDFButton.Visible = true;
                unpaidBillReportGridView.Visible = true;
                unpaidBillReportGridView.DataSource = ReportList;
                unpaidBillReportGridView.DataBind();

                messageLabel.Visible = false;
            }
            else
            {
                unpaidBillReportGridView.Visible = false;
                messageLabel.Visible = true;
                messageLabel.Text = "Sorry, No data found.";
            }
        }

        int serialNo;
        decimal totalAmount;
        decimal paidAmount;
        decimal superTotal;
        protected void unpaidBillReportGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = (serialNo += 1).ToString();
                e.Row.Cells[1].Text = DataBinder.Eval(e.Row.DataItem, "BillNO").ToString();
                e.Row.Cells[2].Text = DataBinder.Eval(e.Row.DataItem, "MobileNo").ToString();
                e.Row.Cells[3].Text = DataBinder.Eval(e.Row.DataItem, "PatientName").ToString();
                e.Row.Cells[4].Text = DataBinder.Eval(e.Row.DataItem, "TotalAmount").ToString();
                e.Row.Cells[5].Text = DataBinder.Eval(e.Row.DataItem, "PaidAmount").ToString();

                totalAmount = totalAmount + Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "TotalAmount"));
                paidAmount = paidAmount + Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "PaidAmount"));

                superTotal = (totalAmount - paidAmount);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "";
                e.Row.Cells[1].Text = "";
                e.Row.Cells[2].Text = "";
                e.Row.Cells[3].Text = "";
                e.Row.Cells[4].Text = "Total Unpaid Amount: ";
                e.Row.Cells[5].Text = superTotal.ToString();
            }
        }
        protected void unpaidBillPDFButton_Click(object sender, EventArgs e)
        {
            int columnsCount = unpaidBillReportGridView.HeaderRow.Cells.Count;
            // Create the PDF Table specifying the number of columns


            PdfPTable pdfTable = new PdfPTable(columnsCount);



            // Loop thru each cell in GrdiView header row
            foreach (TableCell gridViewHeaderCell in unpaidBillReportGridView.HeaderRow.Cells)
            {

                PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewHeaderCell.Text));

                // Set the PDF cell backgroundcolor to GridView header row BackgroundColor color
                pdfCell.BackgroundColor = new BaseColor(unpaidBillReportGridView.HeaderStyle.BackColor);

                // Add the cell to PDF table
                pdfTable.AddCell(pdfCell);
            }

            // Loop thru each datarow in GrdiView
            foreach (GridViewRow gridViewRow in unpaidBillReportGridView.Rows)
            {
                if (gridViewRow.RowType == DataControlRowType.DataRow)
                {
                    // Loop thru each cell in GrdiView data row
                    foreach (TableCell gridViewCell in gridViewRow.Cells)
                    {
                        PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewCell.Text));

                        pdfCell.BackgroundColor = new BaseColor(unpaidBillReportGridView.RowStyle.BackColor);

                        pdfTable.AddCell(pdfCell);
                    }
                }
            }


            foreach (TableCell gridViewHeaderCell in unpaidBillReportGridView.FooterRow.Cells)
            {

                PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewHeaderCell.Text));

                // Add the cell to PDF table
                pdfTable.AddCell(pdfCell);
            }



            // Create the PDF document specifying page size and margins
            Document pdfDocument = new Document(PageSize.A4, 20f, 10f, 10f, 10f);

            PdfWriter.GetInstance(pdfDocument, Response.OutputStream);

            string centerName = "Diagnostic Center";
            string reportName = "Unpaid Bill Report";


            pdfDocument.Open();

            pdfDocument.Add(new Paragraph(" \n"));
            pdfDocument.Add(new Paragraph(DateTime.Now.ToString()));
            //pdfDocument.Add(new Paragraph(centerName));
            pdfDocument.Add(new Paragraph(" \n"));
            pdfDocument.Add(new Paragraph("\t" + reportName));
            pdfDocument.Add(new Paragraph(" \n\n"));



            pdfDocument.Add(pdfTable);
            pdfDocument.Close();
            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition",
                "attachment;filename=UnpaidBillList.pdf");
            Response.Write(pdfDocument);
            Response.Flush();
            Response.End();
        }

        protected void unpaidBillPDFButton_Click1(object sender, EventArgs e)
        {

        }
    }
}