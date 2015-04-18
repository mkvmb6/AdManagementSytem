using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace AdManagementDataAccess
{
    public class CountryDao
    {
        public static List<string> GetAllCountries()
        {
            List<string> countries = new List<string>();
            SqlConnection conn = ConnectionManager.GetConnection();
            SqlCommand cmd = new SqlCommand("Select CountryName from Country", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                countries.Add(dr[0].ToString());
            }
            dr.Close();
            conn.Close();
            return countries;
        }

        public static string GetCountryCode(string countryName)
        {
            string countryCode = "";
            SqlConnection conn = ConnectionManager.GetConnection();
            countryCode = new SqlCommand("select CountryId from Country where CountryName='" + countryName + "'", conn).ExecuteScalar().ToString();
            return countryCode;
        }
    }
}
