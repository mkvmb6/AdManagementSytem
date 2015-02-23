using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdManagementEntity
{
    class Campaign
    {
        public int CampaignId { get; set; }
        public string CampaignName { get; set; }
        public int GroupId { get; set; }
        public DateTime StartDate { get; set; }
        public double Budget { get; set; }

    }
}
