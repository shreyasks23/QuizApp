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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            LblUserName.Text = Session["UserName"].ToString();            

        }

        protected void LogoutLink_Click(object sender, EventArgs e)
        {
            Logout();
        }


        #region Helper Methods
        public bool IsLoggedIn
        {
            get
            {
                return (LoginDate != "" && LoginID != "");
            }
        }

        public string LoginID
        {
            get
            {
                return HttpContext.Current.User.Identity.Name;
            }
        }

        public string LoginDate
        {
            get
            {
                return getCookieValue("QuizForm");
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

                Response.Redirect("~/Login.aspx");
            }
        }
        #endregion
    }
}
