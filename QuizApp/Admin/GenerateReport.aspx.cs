using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace QuizApp.Admin
{
    public partial class GenerateReport : System.Web.UI.Page
    {

        string ConnectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WUCHeader1.IsLoggedIn)
            {
                Response.Redirect("../Login.aspx");
            }

            Session["UserName"] =WUCHeader1.LoginID;

            if (!IsPostBack)
            {
                bindLocations();
                BindDates();
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection SConn = new SqlConnection(ConnectionString);

            try
            {
                BindGridView();
            }
            catch (Exception Ex)
            {
                LblMsg.Visible = true;
                LblMsg.Text = Ex.Message;
            }
            finally
            {
                if (SConn.State == ConnectionState.Open)
                    SConn.Close();
            }
        }

        protected void BtnFullReport_Click(object sender, EventArgs e)
        {
            try
            {
                StringBuilder SBQuery = new StringBuilder();
                SBQuery.Append("SELECT [EmployeeID], [Name] , [Gender], [Age], [Location] , [Empathy], [LeadershipPotential], [Emotions], ");
                SBQuery.Append("[Confidence] ,[SportsmanShip] ,[Relationship] ,[Ethics] ,[FearOfFailure] ,[Power], ");                
                SBQuery.Append("[ManagingPressure] , [LackOfSelfConfidence] , [Aggressiveness], [SelfEfficacy], [CreatedOn] ");
                SBQuery.Append("FROM PsychometricResults WHERE RecordStatus<2 ");                

                if (DDLLocation.SelectedValue != "")
                    SBQuery.Append("AND Location='" + DDLLocation.SelectedValue + "' ");
                if (TBEmployeeName.Text.Trim() != "")
                    SBQuery.Append(" AND Name LIKE '" + TBEmployeeName.Text.Trim() + "%' ");               
                

                using (SqlDataAdapter SDA = new SqlDataAdapter(SBQuery.ToString(), ConnectionString))
                {
                    DataTable DT = new DataTable();
                    DT.Clear();
                    SDA.Fill(DT);

                    if (DT.Rows.Count > 0)
                    {
                        Session["DTExcelReport"] = DT;
                        ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "var Mleft = (screen.width/2)-(760/2);var Mtop = (screen.height/2)-(700/2);window.open( 'ExportExcel.aspx', null, 'height=700,width=760,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );", true);
                    }
                    else
                    {
                        throw new Exception("No details available for the Search.");
                    }
                }

            }
            catch (Exception Ex)
            {
                LblMsg.Visible = true;
                LblMsg.Text = Ex.Message;
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            ClearCtrls(sender,e);
        }


        #region Gridview

        protected void GVStudentProfile_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVStudentProfile.EditIndex = -1;
            GVStudentProfile.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void GVStudentProfile_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Report")
                {
                    Session["EmployeeID"] = e.CommandArgument.ToString();
                }
            }
            catch (Exception ex)
            {
                LblMsg.Text = ex.Message;
                LblMsg.Visible = true;
            }
        }

        protected void GVStudentProfile_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    e.Row.Cells[0].Style.Add("Display", "None");
                }
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Cells[0].Style.Add("Display", "None");
                }
            }
            catch (Exception ex)
            {
                LblMsg.Text = ex.Message;
                LblMsg.Visible = true;
            }
        }        

        #endregion


        #region Private Methods

        private void ClearCtrls(object sender, EventArgs e)
        {
            TBEmployeeName.Text = "";
            TBEmployeeID.Text = "";
            DDLLocation.SelectedIndex = -1;
            DDLDates.SelectedIndex = -1;
            GVStudentProfile.Visible=false;
            LblCount.Text = "";
        }
        
       

        private void BindGridView()
        {
            
            StringBuilder SBQuery = new StringBuilder();
            SBQuery.Append("SELECT ID, Name, EmployeeID , DOB , Gender , Location, Age, CompanyName, CreatedOn ");
            SBQuery.Append("FROM PsychometricResults WHERE RecordStatus<2 ");

            if (TBEmployeeName.Text.Trim() != "")
                SBQuery.Append("AND Name LIKE '" + TBEmployeeName.Text.Trim() + "%' ");
            if (TBEmployeeID.Text.Trim() != "")
                SBQuery.Append("AND EmployeeID LIKE '" + TBEmployeeID.Text.Trim() + "%' ");            
            if (DDLLocation.SelectedValue != "")
                SBQuery.Append("AND Location LIKE '" + DDLLocation.SelectedValue + "%' ");
            if (DDLDates.SelectedValue != "")
                SBQuery.Append("AND CONVERT(VARCHAR(25), CreatedOn, 105) = '" + DDLDates.SelectedValue +" ' ");


            using (SqlDataAdapter SDA = new SqlDataAdapter(SBQuery.ToString(), ConnectionString))
            {
                DataTable DT = new DataTable();
                DT.Clear();
                SDA.Fill(DT);

                GVStudentProfile.DataSource = DT;
                GVStudentProfile.DataBind();
                GVStudentProfile.Visible = true;
                LblCount.Text = "Total Count : " + DT.Rows.Count.ToString();

                if (DT.Rows.Count <= 0)
                {
                    throw new Exception("No details available for the Search.");
                }
            }
        }

        private void bindLocations()
        {
            try
            {
                DataTable DT = new DataTable();
                DDLLocation.Items.Clear();

                using (SqlDataAdapter SDA = new SqlDataAdapter("SELECT DISTINCT Location FROM PsychometricResults WHERE RecordStatus<2 ORDER BY Location", ConnectionString))
                {
                    DT.Clear();
                    SDA.Fill(DT);

                    if (DT != null)
                    {
                        if (DT.Rows.Count > 0)
                        {
                            DDLLocation.DataValueField = "Location";
                            DDLLocation.DataTextField = "Location";
                            DDLLocation.DataSource = DT;
                            DDLLocation.DataBind();
                        }
                        DDLLocation.Items.Insert(0, new ListItem(" - Select Location - ", ""));
                    }
                }
            }
            catch (Exception ex)
            {
                LblMsg.Text = ex.Message;
                LblMsg.Visible = true;
            }
        }

        private void BindDates()
        {
            try
            {
                DataTable DT = new DataTable();
                DDLDates.Items.Clear();

                using (SqlDataAdapter SDA = new SqlDataAdapter("SELECT DISTINCT CONVERT(VARCHAR(10), CreatedOn, 105) As EntryDate  FROM PsychometricResults WHERE RecordStatus<2 ORDER BY EntryDate", ConnectionString))
                {
                    DT.Clear();
                    SDA.Fill(DT);

                    if (DT != null)
                    {
                        if (DT.Rows.Count > 0)
                        {
                            DDLDates.DataValueField = "EntryDate";
                            DDLDates.DataTextField = "EntryDate";
                            DDLDates.DataSource = DT;
                            DDLDates.DataBind();
                        }
                        DDLDates.Items.Insert(0, new ListItem(" - Select Date - ", ""));
                    }
                }
            }
            catch (Exception ex)
            {
                LblMsg.Text = ex.Message;
                LblMsg.Visible = true;
            }
        }

        private List<double> getSingleRow()
        {           
            List<double> yval = new List<double>();            
            try
            {
                StringBuilder SBQuery = new StringBuilder();
                SBQuery.Append("SELECT ID,Name,EmployeeID ,DOB ,Gender,");
                SBQuery.Append("Age , Location , Email, ");
                SBQuery.Append(" Empathy  ,LeadershipPotential  ,Emotions  ,Confidence ,SportsmanShip  ,");
                SBQuery.Append("Relationship  ,Ethics  ,FearOfFailure ,Power ,");
                SBQuery.Append("ManagingPressure ,LackOfSelfConfidence, Aggressiveness ,SelfEfficacy  ");
                SBQuery.Append("FROM PsychometricResults WHERE RecordStatus<2 ");


                if (TBEmployeeName.Text.Trim() != "")
                {
                    SBQuery.Append("AND Name LIKE '" + TBEmployeeName.Text.Trim() + "%' ");
                    ViewState["EmpName"] = TBEmployeeName.Text.Trim();
                }
                if (TBEmployeeID.Text.Trim() != "")
                {
                    SBQuery.Append("AND EmployeeID LIKE '" + TBEmployeeID.Text.Trim() + "%' ");
                    ViewState["EmpID"] = TBEmployeeID.Text.Trim();
                }
                if (DDLLocation.SelectedValue != "")
                {
                    SBQuery.Append("AND Location LIKE '" + DDLLocation.SelectedValue + "%' ");
                    ViewState["Location"] = DDLLocation.SelectedValue;
                }
                using (SqlDataAdapter SDA = new SqlDataAdapter(SBQuery.ToString(), ConnectionString))
                {
                    DataTable DT = new DataTable();
                    DT.Clear();
                    SDA.Fill(DT);

                    if (DT.Rows.Count > 0)
                    {                       

                        foreach (DataRow dr in DT.Rows)
                        {
                            foreach (var item in dr.ItemArray)
                            {
                                if (item == DBNull.Value)
                                {
                                    throw new Exception("No value");
                                }
                                else
                                {
                                    yval.Add(Math.Round(Convert.ToSingle(item), 2));
                                }

                            }
                        }
                    }
                    else
                    {
                        throw new Exception("No details available for the Search.");
                    }
                }

            }
            catch (Exception Ex)
            {
                LblMsg.Visible = true;
                LblMsg.Text = Ex.Message;
            }

            return yval;
        }

        private DataTable createDataTable()
        {
            string[] x = { "Empathy", " LeadershipPotential", "Emotions", "Confidence", "SportsmanShip", "Relationship", " Ethics", "FearOfFailure", "Power", "ManagingPressure", "LackOfSelfConfidence", "Aggressiveness", "SelfEfficacy" };
            List<string> xval = new List<string>();
            List<double> yval = new List<double>();
            xval.AddRange(x);
            yval.AddRange(getSingleRow());

            DataTable dt = new DataTable("GraphTable");
            DataRow dr;

            dt.Columns.Add("Traits", Type.GetType("String"));
            dt.Columns.Add("Scores", Type.GetType("double"));

            dr = dt.NewRow();

            foreach (string names in xval)
            {
                foreach (double scores in yval)
                {

                    dr["Traits"] = names;
                    dr["Scores"] = scores;
                    break;
                }
            }

            dt.Rows.Add(dr);
            return dt;

        }

        #endregion

        
    }
    }