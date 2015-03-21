using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AdManagementEntity;
using System.Data.SqlClient;
using System.Data;

namespace AdManagementDataAccess
{
    public class CategoryDao
    {
        public static List<Category> GetCategories()
        {
            List<Category> categories = null;
            try
            {
                SqlConnection conn = ConnectionManager.GetConnection();
                SqlDataAdapter da = new SqlDataAdapter("select * from Category", conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                var myData = ds.Tables[0].AsEnumerable().Select(
                    dataRow => new Category()
                    {
                        CategoryId = dataRow.Field<int>("CategoryId"),
                        CategoryName = dataRow.Field<string>("CategoryName")
                    });
                categories = myData.ToList<Category>();
            }
            catch (Exception)
            {

            }
            return categories;
        }
    }
}
