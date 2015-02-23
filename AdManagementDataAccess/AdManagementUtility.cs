using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdManagementDataAccess
{
    public class AdManagementUtility
    {
        public static string GetRedirectMessage(string redirectUrl, string redirectMessage)
        {
            return "<script>location.href='" + redirectUrl + "';" +
                "alert('" + redirectMessage + "');"
                + "</script>"
                ;
        }

        public static string GetAlertMessage(string message)
        {
            return "<script>" +
                "alert('" + message + "');"
                + "</script>"
                ;
        }
    }
}
