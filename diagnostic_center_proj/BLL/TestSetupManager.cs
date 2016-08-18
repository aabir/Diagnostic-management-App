using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using diagnostic_center_proj.DAL;
using diagnostic_center_proj.Models;

namespace diagnostic_center_proj.BLL
{
    public class TestSetupManager
    {
        TestSetupGateWay testSetupGeteWay = new TestSetupGateWay();


        public List<TestType> GetAllTestType()
        {
            List<TestType> testTypes = testSetupGeteWay.GetAllTestType();
            return testTypes;
        }

        public bool IsTestExists(string name)
        {
            return testSetupGeteWay.IsTestExists(name);
        }

        public bool SaveTestSetup(TestSetup testSetup)
        {
            return testSetupGeteWay.SaveTestSetup(testSetup); 
        }

        public List<TestSetup> GetAllTest()
        {
            return testSetupGeteWay.GetAllTest();
        }
    }
}