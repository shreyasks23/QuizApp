using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;


namespace QuizApp.Admin
{
    public partial class SingleReport : System.Web.UI.Page
    {
        string SID;
        DataTable dt;
        string[] x = { "Empathy", " LeadershipPotential", "Emotions", "Confidence", "SportsmanShip", "Relationship", " Ethics", "FearOfFailure", "Power", "ManagingPressure", "LackOfSelfConfidence", "Aggressiveness", "SelfEfficacy" };
        protected void Page_Load(object sender, EventArgs e)
        {
             Chart1.ChartAreas[0].AxisX.MajorGrid.Enabled = false;
            Chart1.ChartAreas[0].AxisY.MajorGrid.Enabled = false;
            Chart1.Series[0].Palette = System.Web.UI.DataVisualization.Charting.ChartColorPalette.None;
            Chart1.Series[0].IsValueShownAsLabel = true;
            Chart1.ChartAreas[0].AxisX.LabelStyle.Interval = 1;
            //Chart1.Series[0].Label = "#VALX - #VALY";
            Chart1.Series[0].LegendText = "#VALX";
            

            if (Request.QueryString.HasKeys())
            {
                if (Request.QueryString["SID"] != null && Request.QueryString["SID"].ToString().Trim() != "")
                    SID = Request.QueryString["SID"].ToString().Trim();

            }

            if (SID == null || SID == "")
                Response.Redirect("GenerateReport.aspx");

            if (!this.IsPostBack)
            {
                try
                {
                    string query = "SELECT Empathy, LeadershipPotential, Emotions, Confidence, SportsmanShip, Relationship, Ethics, FearOfFailure, Power, ManagingPressure, LackOfSelfConfidence, Aggressiveness, SelfEfficacy FROM PsychometricResults WHERE EmployeeID ='" + SID + "'";                   
                    dt = GetData(query);
                    Chart1.DataSource = dt;
                    List<double> yval = new List<double>();

                    foreach (DataRow dr in dt.Rows)
                    {
                        foreach (var item in dr.ItemArray)
                        {
                            if (item == DBNull.Value)
                                {
                                throw new Exception("Test Not Complete");
                            }
                            else
                            {
                                yval.Add(Math.Round(Convert.ToSingle(item), 2));
                            }

                        }
                    }
                    //dt.Rows.CopyTo(yval, 0);
                    List<string> xval = new List<string>();
                    xval.AddRange(x);
                    Chart1.Series[0].ChartType = SeriesChartType.Column;
                    Chart1.Series["Default"].Points.DataBindXY(xval, yval);
                    Chart1.Titles.Add("Personality Traits");
                    Chart1.Titles[0].Font = new System.Drawing.Font("Arial Black", 18, System.Drawing.FontStyle.Italic);                    

                    AssignControls();
                }
                catch(Exception ex)
                {
                    LblErr.Visible = true;
                    LblErr.ForeColor = System.Drawing.Color.Red;
                    LblErr.Text = ex.Message;
                }

            }


        }
        protected void Chart1_Load(object sender, EventArgs e)
        {
                      
        }


        #region Private Methods
        private static DataTable GetData(string query)
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                    {
                        sda.Fill(dt);
                    }
                    return dt;
                }
            }
        }

        private void AssignControls()
        {
            string query = "SELECT Name ,EmployeeID , DOB, Gender, Email ,Age ,Location  ,CompanyName  FROM PsychometricResults WHERE EmployeeID ='" + SID + "'";
            DataTable dt = GetData(query);
           foreach(DataRow dr in dt.Rows)
            {
                LblName.Text = dr["Name"].ToString();
                LblEmployeeID.Text = dr["EmployeeID"].ToString();
                LblDOB.Text = dr["DOB"].ToString();
                LblGender.Text = dr["Gender"].ToString();
                LblEmail.Text = dr["Email"].ToString();
                LblCompanyName.Text = dr["CompanyName"].ToString();
                LblLocation.Text = dr["Location"].ToString();
                LblAge.Text = dr["Age"].ToString();               
            } 
        }

        #endregion
    }
}