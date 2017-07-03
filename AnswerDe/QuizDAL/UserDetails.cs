using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace QuizDAL
{
    public class UserDetails
    {
        public int UserId { get; set; }
        public string UserEmail { get; set; }
        public string UserPassword { get; set; }
        public string UserName { get; set; }
        public string Contact { get; set; }
        public bool IsActive { get; set; }
        public DateTime UserCreated { get; set; }

        public string SaveUser()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cSql = new SqlCommand("Insert into UserDetail(UserEmail,UserPassword,UserName,Contact) values(@UserEmail,@UserPassword,@UserName,@Contact)", con);
                    cSql.Parameters.AddWithValue("@UserEmail", UserEmail);
                    cSql.Parameters.AddWithValue("@UserPassword", UserPassword);
                    cSql.Parameters.AddWithValue("@UserName", UserName);
                    cSql.Parameters.AddWithValue("@Contact", Contact);
                    cSql.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    
                }
                finally
                {
                    con.Close();
                }
            }
            return null;
        }

    }

}
