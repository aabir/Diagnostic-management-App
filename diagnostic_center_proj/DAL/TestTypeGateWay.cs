using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using diagnostic_center_proj.Models;

namespace diagnostic_center_proj.DAL
{
    public class TestTypeGateWay
    {
        private string connectionString =
           WebConfigurationManager.ConnectionStrings["diagnosticCenterApp"].ConnectionString;
        public bool IsTestTypeExists(string name)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * FROM test_type WHERE Name='" + name + "'";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            bool isTestTypeExist = reader.HasRows;
            connection.Close();

            return isTestTypeExist;
        }

        public List<TestType> GetAllTestType()
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * FROM test_type ORDER BY Name";
            SqlCommand command = new SqlCommand(query, connection);

            List<TestType> testType = new List<TestType>();

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                TestType testTypes = new TestType();

                testTypes.Name = reader["Name"].ToString();
                testType.Add(testTypes);
            }

            connection.Close();

            return testType;
        }

        public bool SaveTestType(TestType testType)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            DateTime created_at = DateTime.Now;
            
            string query = "INSERT INTO test_type(Name, created_at) VALUES('" + testType.Name + "', '"+ created_at + "')";

            
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();

            if (rowAffected > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}