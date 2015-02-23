using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Data;

namespace AdManagementDataAccess
{
    public class ConnectionManager
    {
        public static SqlConnection GetConnection()
        {
            SqlConnection conn = null;
            try
            {
                conn = new SqlConnection(System.Configuration.
                    ConfigurationManager.ConnectionStrings["AdManagementConStr"].ConnectionString);
                if (conn.State==ConnectionState.Closed)
                {
                    conn.Open();
                }
            }
            catch (Exception)
            {

            }
            return conn;
        }
    }
}
