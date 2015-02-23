using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AdManagementEntity;
using System.Data.SqlClient;
using System.Data;

namespace AdManagementDataAccess
{
    public class UserInfoDao
    {
        public static bool SaveUserInfo(UserInfo userInfo, AddressInfo addressInfo, LoginInfo login)
        {
            bool isSaved = true;
            try
            {
                SqlConnection conn = ConnectionManager.GetConnection();
                SqlCommand cmd = new SqlCommand("spSaveUserInfo", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("EmailId", userInfo.EmailId);
                cmd.Parameters.AddWithValue("FullName", userInfo.FullName);
                cmd.Parameters.AddWithValue("Company", userInfo.Company);
                cmd.Parameters.AddWithValue("PhoneNum", userInfo.PhoneNum);
                cmd.Parameters.AddWithValue("Skype", userInfo.Skype);
                cmd.Parameters.AddWithValue("Password", login.Password);
                cmd.Parameters.AddWithValue("UserType", login.UserType);
                cmd.Parameters.AddWithValue("AddressLine1", addressInfo.AddressLine1);
                cmd.Parameters.AddWithValue("AddressLine2", addressInfo.AddressLine2);
                cmd.Parameters.AddWithValue("State", addressInfo.State);
                cmd.Parameters.AddWithValue("CountryId", addressInfo.CountryId);
                cmd.Parameters.AddWithValue("MainAddress", addressInfo.MainAddress);
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                isSaved = false;
            }
            return isSaved;
        }

        public static UserInfo GetUserInfo(string emailId)
        {
            UserInfo objUserInfo = null;
            try
            {
                SqlConnection conn = ConnectionManager.GetConnection();
                SqlCommand cmd = new SqlCommand("spGetUserInfo", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("EmailId", emailId);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    objUserInfo = new UserInfo();
                    objUserInfo.FullName = dr["FullName"].ToString();
                    objUserInfo.EmailId = dr["EmailId"].ToString();
                    objUserInfo.Company = dr["Company"].ToString();
                    objUserInfo.PhoneNum = dr["PhoneNum"].ToString();
                    objUserInfo.Skype = dr["Skype"].ToString();
                }
                dr.Close();
            }
            catch (Exception)
            {
                objUserInfo = null;
            }
            return objUserInfo;
        }
    }
}
