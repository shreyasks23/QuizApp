using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizApp
{
    public partial class BasicInfo : System.Web.UI.Page
    {
        IFormatProvider culture = System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat;
        string Gender = "Male";
        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!RBMale.Checked)
                  Gender = "Female";

                if (TBName.Text.Trim() != "")
                {
                    Session["UserName"] = TBName.Text.Trim();
                    Session["EmployeeID"] = TBEmpID.Text;
                    Session["DOB"] = TBDOB.Text;
                    Session["MailID"] = TBEMail.Text;
                    Session["Gender"] = Gender;
                }
                else
                {
                    Session["UserName"] = "user";
                }
         

        }

        protected void CBAgree_CheckedChanged(object sender, EventArgs e)
        {

        }       

        protected void TBName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TBDOB_TextChanged(object sender, EventArgs e)
        {
            try
            {
                DateTime DOB = DateTime.Today;

                if (TBDOB.Text.Trim() != "")
                    DOB = Convert.ToDateTime(TBDOB.Text, culture);

                LblAge.Visible = true;
                LblAge.Text = "Age : " + getAge(DOB).ToString() + " yrs";
            }
            catch (Exception Ex)
            {
                LblMsg.Visible = true;
                LblMsg.Text = Ex.Message;
            }
        }       

        protected void LBContinue_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                LblMsg.Visible = true;
                LblMsg.Text = "Fill the required fields and agree to the instructions";
            }
            else
            {
                if (CBAgree.Checked)
                {
                    try
                    {
                        SqlConnection SCon = new SqlConnection(CS);
                        SqlDataAdapter SDA;
                        SqlCommand SCmd;
                        SqlTransaction ST;
                        DataTable DT = new DataTable();
                        DataRow DR;

                        SCon.Open();

                        SCmd = new SqlCommand("SELECT * FROM PsychometricResults WHERE EmployeeID='" + TBEmpID.Text.ToString().Trim() + "' AND (Empathy is NOT NULL or Empathy = '') AND RecordStatus<2", SCon);
                        ST = SCon.BeginTransaction(IsolationLevel.ReadCommitted);
                        SCmd.CommandType = CommandType.Text;
                        SCmd.Transaction = ST;
                        SCmd.CommandTimeout = 0;

                        using (SDA = new SqlDataAdapter(SCmd))
                        {
                            new SqlCommandBuilder(SDA);
                            SDA.Fill(DT);
                            if (DT.Rows.Count > 0)
                            {
                                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "alert", "<script>alert('You have already submitted your answers')</script>", false);
                                ClearCtrls();
                            }
                            else
                            {
                                try
                                {
                                    DR = DT.NewRow();
                                    DR["Name"] = Session["UserName"];
                                    DR["EmployeeID"] = Session["EmployeeID"];
                                    DR["DOB"] = Session["DOB"];
                                    DR["Age"] = getAge(Convert.ToDateTime(TBDOB.Text, culture));
                                    DR["Email"] = Session["MailID"];
                                    DR["Gender"] = Gender;
                                    DR["Location"] = DDLLocation.SelectedValue;
                                    DR["CreatedOn"] = DateTime.Now;
                                    DR["RecordStatus"] = 1;

                                    DT.Rows.Add(DR);
                                    SDA.Update(DT);
                                    ST.Commit();
                                    ClearCtrls();

                                    Response.Redirect("TestPage.aspx");

                                }
                                catch (Exception Ex)
                                {
                                    ST.Rollback();
                                    LblMsg.Visible = true;
                                    LblMsg.Text = Ex.Message.ToString();
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        LblMsg.Visible = true;
                        LblMsg.Text = ex.Message.ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "alert", "<script>alert('Please agree to the instructions by clicking in the box')</script>", false);
                }
            }
        }

        #region private methods

        private void ClearCtrls()
        {
            TBName.Text = "";
            TBDOB.Text = "";
            TBEMail.Text = "";
            TBEmpID.Text = "";
            CBAgree.Checked = false;
            LblAge.Visible = false;
            LblMsg.Visible = false;
        }        

        private int getAge(DateTime DOB)
        {
            int Age = DateTime.Today.Year - DOB.Year;

            if (DOB.Month > DateTime.Today.Month)
                Age -= 1;
            else if (DOB.Month == DateTime.Today.Month)
            {
                if (DOB.Day > DateTime.Today.Day)
                    Age -= 1;
            }

            return Age;
        }

        #endregion
    }
}