using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string UserName = TBUserID.Text.Trim();
            string Password = HashPassword(TBPassword.Text.Trim());
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            // Initialize FormsAuthentication
            FormsAuthentication.Initialize();

            // Create our connection and command objects
            SqlConnection conn =
             new SqlConnection(CS);
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT Role FROM tblLogin WHERE userName=@username " +
             "AND Password=@password";

            // Fill our parameters
            cmd.Parameters.Add("@username", SqlDbType.NVarChar, 64).Value = UserName;
            cmd.Parameters.Add("@password", SqlDbType.NVarChar, 128).Value = Password;

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                // Create a new ticket used for authentication
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                   1, // Ticket version
                   UserName, // Username associated with ticket
                   DateTime.Now, // Date/time issued
                   DateTime.Now.AddMinutes(30), // Date/time to expire
                   true, // "true" for a persistent user cookie
                   reader.GetString(0), // User-data, in this case the roles
                   FormsAuthentication.FormsCookiePath);// Path cookie valid for



                // Encrypt the cookie using the machine key for secure transport
                string hash = FormsAuthentication.Encrypt(ticket);
                HttpCookie cookie = new HttpCookie(
                   FormsAuthentication.FormsCookieName, // Name of auth cookie
                   hash); // Hashed ticket

                // Set the cookie's expiration time to the tickets expiration time
                if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;

                // Add the cookie to the list for outgoing response
                Response.Cookies.Add(cookie);

                // Redirect to requested URL, or homepage if no previous page
                // requested
                string returnUrl = Request.QueryString["ReturnUrl"];
                if (returnUrl == null) returnUrl = "/";

                // Don't call FormsAuthentication.RedirectFromLoginPage since it
                // could
                // replace the authentication ticket (cookie) we just added
                Response.Redirect(returnUrl);
            }
            else
            {
                // Never tell the user if just the username is password is incorrect.
                // That just gives them a place to start, once they've found one or
                // the other is correct!
                LblMsg.Text = "Username / password incorrect. Please try again.";
                LblMsg.Visible = true;
            }

            reader.Close();
            conn.Close();


        }


        #region Private Methods
        private string HashPassword(string password)
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
        #endregion
    }
}