using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizApp.Admin
{
    public partial class CR_Viewer : System.Web.UI.Page
    {
        private ReportDocument objRD;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserName"] = "user";
            if(!IsPostBack)
            {
                try
                {
                    DataTable DT = null;
                    bool Report = false;

                    Report = Convert.ToBoolean(Session["Report"].ToString());

                    objRD = new ReportDocument();

                    if (Report)
                    {
                        DT = (DataTable)Session["DTPsychometryReport"];
                        objRD.Load(Server.MapPath("EmployeeReport.rpt"));
                    }

                        objRD.SetDataSource(DT);

                        ExportFormatType type = ExportFormatType.PortableDocFormat;
                        //MemoryStream memStream = (MemoryStream)objRD.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                        System.IO.Stream oStream = null;
                        byte[] byteArray = null;
                        oStream = objRD.ExportToStream(type);
                        byteArray = new byte[oStream.Length];
                        oStream.Read(byteArray, 0, Convert.ToInt32(oStream.Length - 1));

                        objRD.Close();
                        objRD.Dispose();
                        objRD = null;


                        Response.Clear();
                        Response.Buffer = true;
                        Response.ContentType = "application/PDF";
                        //Response.BinaryWrite(memStream.ToArray());
                        Response.BinaryWrite(byteArray);
                        Response.End();                    
                }
                catch(Exception ex)
                {
                    
                    LblMsg.Text = ex.Message;
                    LblMsg.Visible = true;
                }
            }
        }
    }
}