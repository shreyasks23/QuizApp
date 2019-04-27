using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace QuizApp.Admin
{
    
    public partial class ExportExcel : System.Web.UI.Page
    {
        private DataTable DT;
        private DataSet DS = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            DT = (DataTable)Session["DTExcelReport"];

            if (!IsPostBack)
            {
                if (DT != null)
                {
                    int SlNo = 0;
                    DT.Columns.Add(new DataColumn("SlNo", typeof(int)));

                    foreach (DataRow DR in DT.Rows)
                    {
                        SlNo += 1;
                        DR["SlNo"] = SlNo;
                    }

                    Repeater1.DataSource = DT;
                    Repeater1.DataBind();
                }
            }
        }

        protected void LBExport2Excel_Click(object sender, EventArgs e)
        {

            try
            {
                if (DT == null)
                {
                    throw new Exception("Data not available to export to excel!!!");
                }
                else
                {
                    DS.Tables.Add(DT);
                    ExportUtility.exportToExcel(DS, "EmployeeData");
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine("Error Occured", ex.Message);
            }

        }
    }
}