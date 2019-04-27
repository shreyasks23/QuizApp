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
        object Obj;

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
                        SqlConnection SCon;

                        using (SCon = new SqlConnection(CS))
                        {
                            using (SqlCommand Selectcmd = new SqlCommand("select employeeID from tblUsers u " +
                                "inner join PyschometricResults pr on u.userId = pr.userId AND pr.Empathy is not null " +
                                "where employeeID = @EmployeeID; ", SCon))
                            {
                                Selectcmd.CommandType = CommandType.Text;
                                Selectcmd.Parameters.AddWithValue("@EmployeeID", TBEmpID.Text.Trim());
                                SCon.Open();
                                Obj = Selectcmd.ExecuteScalar();
                                if (Obj != null)
                                {
                                    ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "alert", "<script>alert('You have already submitted your answers')</script>", false);
                                    ClearCtrls();
                                    SCon.Close();
                                }
                                SCon.Close();
                            }
                            if (Obj == null)
                            {

                                using (SqlCommand InsertCmd = new SqlCommand("insert into tblUsers (userName,DoB,gender,email,employeeID,location,RecordStatus,CreatedOn) " +
                                    "values (@Name,@Dob,@Gender,@Email,@EmpId,@Location,1,GETDATE())", SCon))
                                {
                                    InsertCmd.CommandType = CommandType.Text;
                                    InsertCmd.Parameters.AddWithValue("@Name", TBName.Text.Trim());
                                    InsertCmd.Parameters.AddWithValue("@Dob", TBDOB.Text.Trim());
                                    InsertCmd.Parameters.AddWithValue("@Gender", Gender);
                                    InsertCmd.Parameters.AddWithValue("@Email", TBEMail.Text.Trim());
                                    InsertCmd.Parameters.AddWithValue("@EmpId", TBEmpID.Text.Trim());
                                    InsertCmd.Parameters.AddWithValue("@Location", DDLLocation.SelectedValue);
                                    SCon.Open();
                                    int count = InsertCmd.ExecuteNonQuery();
                                    SCon.Close();
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

        private string GetCompanyName()
        {
            string CompanyName = "";
            if (DDLLocation.SelectedValue == "Bengaluru")
                CompanyName = "Makino India Pvt Ltd, Bengaluru ";
            else if (DDLLocation.SelectedValue == "Pune")
                CompanyName = "Makino India Pvt Ltd, Pune";
            else if (DDLLocation.SelectedValue == "Chennai")
                CompanyName = "Makino India Pvt Ltd, Coimbatore";
            else if (DDLLocation.SelectedValue == "Delhi")
                CompanyName = "Makino India Pvt Ltd, Delhi";
            else if (DDLLocation.SelectedValue == "Makino Training Centre,Bengaluru")
                CompanyName = "Makino Technical Training Centre, Bengaluru";

            return CompanyName;
        }

        #endregion
    }
}