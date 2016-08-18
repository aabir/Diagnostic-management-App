using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using diagnostic_center_proj.DAL;
using diagnostic_center_proj.Models;

namespace diagnostic_center_proj.BLL
{
    public class TestTypeManager
    {
        TestTypeGateWay testTypeGateWay = new TestTypeGateWay();
        public bool IsTestTypeExists(string name)
        {
            return testTypeGateWay.IsTestTypeExists(name);
        }

        public bool SaveTestType(TestType testType)
        {
            return testTypeGateWay.SaveTestType(testType);
        }

        public List<TestType> GetAllTestType()
        {
            return testTypeGateWay.GetAllTestType();
        }
    }
}