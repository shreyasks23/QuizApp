using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizApp
{
    public partial class WUCHeader : System.Web.UI.UserControl
    {
        String CurrentPageName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsLoggedIn))
                Response.Redirect(ConfigurationManager.AppSettings["LoginPage"].ToString(), true);

            CurrentPageName = Request.Path.Substring(Request.Path.LastIndexOf("/") + 1).Trim();
            LblUserName.Text = UserName;

        }

        protected void LBLogout_Click(object sender, EventArgs e)
        {
            Logout();
        }

        public bool IsLoggedIn
        {
            get
            {
                return (LoginDate != "" && LoginID != "");
            }
        }

        public bool IsAdministrator
        {
            get
            {
                return isAdministrator();
            }
        }

        public bool IsUser
        {
            get
            {
                return isUser();
            }
        }

        public string LoginID
        {
            get
            {
                return HttpContext.Current.User.Identity.Name;
            }
        }

        public string UserName
        {
            get
            {
                return getUserName(UserIDKey);
            }
        }

        public string UserIDKey
        {
            get
            {
                return getUserIDKey(LoginID);
            }
        }

        public string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            }
        }

        public string LoginDate
        {
            get
            {
                return getCookieValue("logindate");
            }
        }

        public bool IsNumeric(string val)
        {
            Double result;
            return Double.TryParse(val, out result);
        }

        public string systemDateFormat
        {
            get
            {

                return "MM/dd/yyyy";
            }

        }

        public bool IsAdministratorOfRole(string roleID)
        {
            bool retVal = false;
            if (IsLoggedIn && roleID != "")
            {
                using (SqlCommand Cmd = new SqlCommand(string.Format("SELECT COUNT(1) FROM Login_Roles WHERE ID={0} AND RoleName='Administrators'", roleID), new SqlConnection(ConnectionString)))
                {
                    Cmd.Connection.Open();
                    retVal = Convert.ToInt32(Cmd.ExecuteScalar()) > 0;
                    Cmd.Connection.Close();
                }
            }
            return retVal;
        }

        public void DisableButtonOnClick(Button ButtonControl)
        {
            StringBuilder sb = new StringBuilder(128);
            sb.Append("if (typeof(Page_ClientValidate) == 'function') { ");
            sb.Append(string.Format("if (Page_ClientValidate({0}) == false) {{ return false; }}}} ",
            ButtonControl.ValidationGroup == string.Empty ? string.Empty : string.Format("\"{0}\"", ButtonControl.ValidationGroup)));
            sb.Append("this.disabled = true; this.value = 'wait...';");
            sb.Append(ButtonControl.Page.ClientScript.GetPostBackEventReference(ButtonControl, "") + ";");
            ButtonControl.Attributes.Add("onclick", sb.ToString());
        }

        public string HashPassword(string password)
        {
            System.Text.UTF8Encoding ue = new System.Text.UTF8Encoding();
            byte[] bytes = ue.GetBytes(password);
            System.Security.Cryptography.MD5 md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] hashBytes = md5.ComputeHash(bytes);
            string hashString = "";
            for (int i = 0; i < hashBytes.Length; i++)
            {
                hashString += Convert.ToString(hashBytes[i], 16).PadLeft(2, '0');
            }
            password = hashString.PadLeft(32, '0');
            return password;
        }

        public string getCookieValue(string CookieName)
        {
            string retVal = "";
            try
            {
                string[] CookieNames = Request.Cookies.AllKeys;
                for (int i = 0; i < CookieNames.Length; i++)
                {
                    if (CookieNames[i].ToLower() == CookieName.ToLower())
                    {
                        retVal = Request.Cookies[i].Value;
                        break;
                    }
                }
            }
            catch (Exception Ex)
            {
                retVal = Ex.Message;
            }
            return retVal;
        }

        public void Logout()
        {
            if (IsLoggedIn)
            {
                Session.RemoveAll();

                HttpCookie authCookie;
                string strCookieName = FormsAuthentication.FormsCookieName;
                authCookie = Context.Request.Cookies[strCookieName];
                authCookie.Expires = DateTime.Now.AddDays(-1);
                authCookie.Value = "";
                FormsAuthentication.SignOut();

                string[] CookieValue = Request.Cookies.AllKeys;
                for (int i = 0; i < CookieValue.Length; i++)
                {
                    authCookie = new HttpCookie(CookieValue[i].ToString());
                    authCookie.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(authCookie);
                }

                Response.Redirect(ConfigurationManager.AppSettings["LoginPage"].ToString());
            }
        }

        public void fillDDL(DropDownList DDL, string TextField, string TableName, string Condition, string OrderColumn, string SelectName)
        {
            DataTable DT = new DataTable();
            DDL.Items.Clear();

            using (SqlDataAdapter SDA = new SqlDataAdapter("SELECT ID, " + TextField + " FROM " + TableName + " WHERE " + ((Condition.Trim() == "") ? "" : Condition + " AND ") + "RecordStatus<2 ORDER BY " + ((OrderColumn.Trim() == "") ? TextField : OrderColumn), ConnectionString))
            {
                DT.Clear();
                SDA.Fill(DT);

                if (DT != null)
                {
                    if (DT.Rows.Count > 0)
                    {
                        DDL.DataValueField = "ID";
                        DDL.DataTextField = TextField;
                        DDL.DataSource = DT;
                        DDL.DataBind();
                    }
                    if (SelectName.Trim() != "")
                        DDL.Items.Insert(0, new ListItem(" - Select " + SelectName + " - ", ""));
                }
            }
        }

        public DataTable getDT(StringBuilder Query)
        {
            DataTable DT = new DataTable();
            using (SqlDataAdapter SDA = new SqlDataAdapter(Query.ToString(), ConnectionString))
            {
                DT.Clear();
                SDA.Fill(DT);
            }
            return DT;
        }

        public int getAge(DateTime DOB)
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

        private bool isAdministrator()
        {
            bool retVal = (LoginID.ToLower() == "administrator" || LoginID.ToLower() == "admin");
            if (IsLoggedIn && !retVal)
            {
                using (SqlCommand Cmd = new SqlCommand(string.Format("SELECT COUNT(1) FROM Login_UserRole, Login_Roles WHERE Login_UserRole.FKRoleID=Login_Roles.ID AND Login_UserRole.FKUserID='{0}' AND Login_Roles.RoleName='Administrators' AND Login_UserRole.RecordStatus<2", UserIDKey), new SqlConnection(ConnectionString)))
                {
                    Cmd.Connection.Open();
                    retVal = Convert.ToInt32(Cmd.ExecuteScalar()) > 0;
                    Cmd.Connection.Close();
                }
            }
            return retVal;
        }

        private bool isUser()
        {
            bool retVal = (LoginID.ToLower() == "user");
            if (IsLoggedIn && !retVal)
            {
                using (SqlCommand Cmd = new SqlCommand(string.Format("SELECT COUNT(1) FROM Login_UserRole, Login_Roles WHERE Login_UserRole.FKRoleID=Login_Roles.ID AND Login_UserRole.FKUserID='{0}' AND Login_Roles.RoleName='users' AND Login_UserRole.RecordStatus<2", UserIDKey), new SqlConnection(ConnectionString)))
                {
                    Cmd.Connection.Open();
                    retVal = Convert.ToInt32(Cmd.ExecuteScalar()) > 0;
                    Cmd.Connection.Close();
                }
            }
            return retVal;
        }

        private string getUserIDKey(string loginID)
        {
            string userIDkey = "";
            if (ConnectionString != "")
            {
                DataTable DT = new DataTable();
                using (SqlDataAdapter SDA = new SqlDataAdapter(string.Format("SELECT ID FROM Login_Users WHERE UserID='{0}'", loginID), ConnectionString))
                {
                    DT.Clear();
                    SDA.Fill(DT);
                    if (DT.Rows.Count > 0)
                        userIDkey = DT.Rows[0][0].ToString();
                }
            }
            return userIDkey;
        }

        private string getUserName(string userIDKey)
        {
            string userName = "";
            if (ConnectionString != "")
            {
                DataTable DT = new DataTable();
                using (SqlDataAdapter SDA = new SqlDataAdapter(string.Format("SELECT FullName FROM Login_Users WHERE ID='{0}'", userIDKey), ConnectionString))
                {
                    DT.Clear();
                    SDA.Fill(DT);
                    if (DT.Rows.Count > 0)
                        userName = DT.Rows[0][0].ToString();
                }
            }
            return userName;
        }
    }
}
