using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdManagementEntity
{
    class Notification
    {
        public string EmailId { get; set; }
        public string NotificationEmail { get; set; }
        public bool DailyAlerts { get; set; }
        public bool CampaignAlerts { get; set; }

    }
}
