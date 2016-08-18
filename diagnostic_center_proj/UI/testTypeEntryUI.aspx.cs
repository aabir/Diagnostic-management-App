using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using diagnostic_center_proj.BLL;
using diagnostic_center_proj.Models;

namespace diagnostic_center_proj.UI
{
    public partial class test_type_report : System.Web.UI.Page
    {
        TestTypeManager testTypeManager = new TestTypeManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAllTestType();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            if( NameTextBox.Text == "")
            {
                messageLabel.Text = "Name Cannot be blank.";
                return;
            }

            if( NameTextBox.Text.Length < 3 )
            {
                messageLabel.Text = "Name Should be atleast 3 character long.";
                return;
            }

            string name = NameTextBox.Text;

            TestType testType = new TestType();

            testType.Name = name;

            if (testTypeManager.IsTestTypeExists(name))
            {
                messageLabel.Text = "Test Type Already exists!";
                return;
            }

            bool isSaved = testTypeManager.SaveTestType(testType);

            if (isSaved)
            {
                messageLabel.Text = "Saved Successfully!";
                NameTextBox.Text = "";
                LoadAllTestType();
                
            }
            else
            {
                messageLabel.Text = "Insertion Failed!";
            }

        }

        private void LoadAllTestType()
        {
            List<TestType> testType = testTypeManager.GetAllTestType();

            showAllTestType.DataSource = testType;
            showAllTestType.DataBind();
        }
    }
}